#import "../../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("../resources/Cycle1Icon.png",height:80%)))
  #pad(y: -30pt, strong(counter(page).display("1")))
  #align(right, "86832A = Wait Look Wait")
      #line(length: 100%)],)
#set page(background: move(dy:390pt, dx: 255pt,
  text(80pt, fill: nDI.lighten(40%), font: "Roboto Mono")[
     *DP* 
  ]))

== Selecting a solution
The solution includes an adaptation of a heuristic called Square-root decomposition. Usually it works on splitting an array into blocks of the length equal to a certain length, such that the number of blocks is equal to the length of a single block, meaning that you can pre-calculate the values for the blocks, and for a query on indexes from l to r, when the elements of the whole block are inside the boundaries, instead of calculating the values by hand, we can use pre-recorded values of the entire block:\
(INSERT THE THINGY yk)\
Even though this is the main practical use of the heuristic, all of its interpretations can fall into one quote:\ 
	"Divide the problem into blocks: large enough to keep the number of blocks small, while small enough to keep the work inside each group easy."\
Turns out that a normal vex foam tile fits all of the requirements, simplifying the task significantly.
The idea is using a foam tile as a block, thus splitting the movement into 3 actual stages:


- 1) Aligning with the tile's center
- 2) Moving from the starting tile's center to the destination tile's center
- 3) Moving from the destination tile's center to the destination coordinates.
Lemlib has a built-in function to move to specific coordinates, which can be used in steps 1 and 3, but the heuristic is there, because LemLib's moveToPoint doesn't account for the field elements, therefore sometimes, the robot rams into a goal instead of driving around it.


We can use the integrated PID-based LemLib's `moveToPoint` function, but we need the arguments to fill into it: $x$ and $y$ coordinates. In step 1, the coordinates are always the center of a foam tile, so we can divide every tile into 3 types: Achievable, Non-achievable, and Semi-achievable:

- *Achievable Tile:* A tile is considered achievable if, from every point on the same tile where a robot can theoretically end up, there exists a path in the shape of a straight line to move into its center (the desired point in step 1).
- *Semi-achievable Tile:* A tile is considered semi-achievable if it does not fall into the achievable criteria, but its center is unobstructed and a robot satisfying the size-regarding rules (R5, SG2, SG3) can be placed into it manually from a certain direction.
- *Non-achievable Tile:* A tile is considered non-achievable if and only if a robot of a maximum legal size cannot be placed into the center of that tile without physically engaging with the environment (Center/long goals).

// #image_placeholder("Map of every tile on the field based on its classification of achievability (Achievable, Semi-achievable, Non-achievable)")

The center tiles are marked red, as their center is obstructed by the middle goal; therefore, the robot cannot be placed into the center without touching the goal. The tiles underneath the parking zone are technically considered semi-achievable, but in a real match, engaging with the parking zone is risky, as it is not as consistent as normal driving and possesses a risk of lifting off the ground, completely breaking the odometry; therefore, they will be treated as unachievable.

*Tile Coordinate Calculation:* \
We will use global coordinates, with the top-left corner having the coordinates $(0; 0)$ and use inches as the main unit. Every foam tile is 24 by 24 inches long; therefore, the top-left corner tile's center will have the coordinates $(12; 12)$, as it is offset from the sides by half of a tile's length. Every adjacent tile will have the coordinates of the current tile $+24$ inches in one of the directions, resulting in a recursive formula:

$ x[i] = x[i-1] + 24 $
$ y[i] = y[i-1] + 24 $

where $x[i]$ corresponds to the tile which has $i$ tiles to its left, and $y[i]$ corresponds to a tile with $i$ tiles above it.

//#image_placeholder("Coordinates overview matrix mapping out center points for all 36 tiles across the field layout")

//#code_placeholder("Initialization of a 2D array / structure container holding the pre-calculated (X, Y) centers of the 36 local tiles.")

Now we know the coordinates of the robot, but we still need to determine what tile the tracking center is currently on. There are 36 tiles in total, thus brute-forcing through all of them is not a difficult task taking up the brain's processing power. Here is the finalized code snippet of Step 1:

//#code_placeholder("Loops evaluating current robot position coordinates against boundaries to snap target center reference coordinates.")

//#subsection("10.4.2 Step #2: Movement out of the tiles")
//#citation("Imran Abdulkhakov", "20/02/2026")

We know that the number of tiles is only 36, meaning that now we can afford a good pathfinding algorithm fitting into all the time constraints. In order to achieve an optimal path built, we need to account for (and mostly minimize) the following factors:

1. *Total distance traveled:* The obvious factor, as a shorter path will always be more preferable over a longer path, minimizing the travel time.
2. *Number of turns:* This factor is just as important; if the number of turns is too large, small errors will build up, resulting in cumulative chassis tracking inaccuracy.
3. *Obstacles:* The main purpose of this algorithm is to avoid obstacles, thus we need to figure out if the robot will hit an object along the vector path.

As movement is only limited by those factors, the travel paths are not strictly bound to the four cardinal directions, and the weight of each move will be different. For that reason, the total movement will be considered as an ordered set of sub-movements, directed from the center of one tile to another. It cannot be calculated using a simple BFS algorithm, prompting us to use an upgraded version of it configured for weighted graphs—Dijkstra's algorithm.

In Dijkstra's algorithm, you are supposed to input the weights of every edge. In accordance with the factors above, we need to figure out the specific penalties for each constraint. Here, to account for the obstacles, we could form a graph where every edge would be a possible path between every two vertices. This way, we would not be bothered again about path accuracy or tile achieve-ability, and it would help us avoid constant square root calculations taking up runtime processing power.

Total distance traveled serves as the main unit of weight, measured relative to the length of one tile. For example, the distance between two tiles sharing one common point (connected diagonally) will be equal to:

$ sqrt(1^2 + 1^2) = sqrt(2) approx 1.4142 $

while the distance between two adjacent tile centers would be exactly $1$. The penalty for every turn is set equal to $1$, making the algorithm sometimes prefer a longer path with fewer turns, while still picking a viable trajectory that is not too long.

*The Greedy Principle:* \
Dijkstra is a greedy algorithm that uses a Priority Queue to always explore the "cheapest" known node first. This ensures that once a node is processed, the path found to it is mathematically guaranteed to be the shortest possible under the given edge weights.

*Penalty Implementation:* \
In this specific implementation, we modify the edge weight equation to properly account for physical mechanical constraints:

$ text("Weight") = text("Euclidean Distance") + 1.0 " " (text("Turn / Segment Penalty")) $

By adding a $1.0$ penalty to every edge, Dijkstra is forced to minimize not just pure distance, but the total number of distinct linear moves. This effectively prevents the robot from making unnecessary macro stops or turning adjustments ("zig-zags") in the middle of an open path alignment.

//#subsection("10.4.3 Step #3: The final touches")
//#citation("Imran Abdulkhakov", "20/02/2026")

After completing the first two calculation steps, the destination coordinate path is now within a localized one-tile proximity of the robot chassis. After that, the only thing left is to perform one final linear movement to hit the target destination coordinates.

//#subsection("10.5 Applying the Algorithm")

Outside of real-time driver control override variables, the pathfinding algorithm also helps significantly in making the structural layout for autonomous coding skills challenges simpler, as shown in this trajectory model:

//#image_placeholder("Visual mapping comparison showing manual multi-segment trajectories vs. automated pathfinder generation vectors around obstacles")

Red arrows stand for coding the specific coordinate paths manually. It would require 5 distinct movements, heavily embedded with coordinate decimals, just to route around a single long goal structure. With our integrated pathfinding algorithm, it takes just 2 clean lines of code: one for match loading parameters and another for sweeping around and aligning with the long goal from the opposite side.


The algorithm itself proved functional, cleanly outputting the traced path vectors correctly. However, physical movements tended to overshoot or take longer than they should because the default LemLib PID control loop constants for driving turned out to be insufficient, forcing us to execute an intentional calibration iteration. But first—we need to review how a PID controller functions.

A PID controller stands for Proportional, Integral, and Derivative control. It uses three primary variables:

- *Proportional gain ($k_P$):* Follows the core principle of "The closer to the target, the lower the output power". It completes the majority of the travel route, but if the constant behind it is too low, final tracking speeds will be sluggish. If it is too high, the robot will violently overshoot the target, as the speed decrease curve becomes less significant relative to deceleration distance.
- *Integral term ($k_I$):* Addresses steady-state error. If for some reason the robot's movement is halted before reaching the exact destination (typically due to friction or a heavy game object), the Integral "remembers" that the error has existed for an extended duration and gradually increments the motor power channel. It calculates the sum of all accumulated system errors over time. The longer the robot stays away from the target, the higher the "$I$" value grows. *The Risk:* If the constant $k_I$ is set too high, it leads to Integral Windup, causing the robot to oscillate endlessly or overshoot because it accumulated excessive power while trying to get moving initially.
- *Derivative term ($k_D$):* Acts as a physical dampener. It looks closely at the continuous rate of change of the error term to predict future systemic behavior. Its main job is to counteract the Proportional term to prevent overshooting. It senses how fast the error gap is shrinking and applies an algorithmic "braking" force to guarantee a smooth deceleration landing.

#v(1em)
#align(center)[
  *Table 10.1: PID Tuning Parameter Impact Matrix*
]
#table(
  columns: (1fr, 1.2fr, 1.2fr, 1.2fr),
  align: center + horizon,
  fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else { none },
  stroke: 0.5pt + rgb("#cbd5e0"),
  [*Setting*], [*P (Proportional)*], [*I (Integral)*], [*D (Derivative)*],
  [Too High], [Oscillates / Overshoots target], [Overshoots target violently], [Too sensitive, undershoots in extreme cases],
  [Too Low], [Velocity too low / sluggish], [Falls 2-3 inches short of target], [Oscillates erratically around target]
)

#v(1em)
#align(center)[
  *Table 10.2: Chassis Calibration Iteration Log*
]
#table(
  columns: (0.6fr, 0.5fr, 0.5fr, 0.5fr, 1.5fr, 1.5fr),
  align: center + horizon,
  fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else { none },
  stroke: 0.5pt + rgb("#cbd5e0"),
  [*Iter.*], [*$k_P$*], [*$k_I$*], [*$k_D$*], [*Observed Problem*], [*Applied Solution*],
  [0 (def)], [10], [0], [0], [Too fast, small overshooting issues], [Added derivative term $k_D$ to system],
  [1], [10], [0], [1], [Overshooting solved but speed is unsafe; high risk of inaccurate movements], [Reduced proportional term $k_P$],
  [2], [6], [0], [1], [Very slow, tracking undershoots target consistently], [Iterating on minor adjustments...]
)
