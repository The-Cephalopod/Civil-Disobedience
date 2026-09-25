#import "../../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("../resources/Cycle1Icon.png",height:80%)))
  #pad(y: -30pt, strong(counter(page).display("1")))
  #align(right, "60000A = Civil Disobedience")
      #line(length: 100%)],)
#set page(background: move(dy:390pt, dx: 255pt,
  text(80pt, fill: nCI.lighten(40%), font: "Roboto Mono")[
     *CI* 
  ]))


#set page(footer:[#pad(y: -20pt, table(
  columns: 2,
  inset: 3pt,
  table.header([*Contributor*], [*Date*],
),
   [Imran],[21/09/26],))])


= Writing the code:
All the mechanics were already explained in the DP section, therefore we can move on to the actual code.


=== Step 1: Tile center locations, selection of the closest, and movement towards it. 
Tile Coordinate calculation: 

We will use global coordinates, with the top left corner having the coordinates (0; 0) and use inches as the main unit.
Every foam tile is 24 by 24 inches long, therefore the top left corner tile's center will have the coordinates (12; 12), as it is offset from the sides by half of a tile's length.
Every adjacent tile will have the coordinates of the current tile +24 inches in one of the directions, resulting in a recursive formula:
 $ x[i] = x[i-1] + 24 \
y[i] = y[i-1] + 24 $
where x[i] corresponds to the tile which has i tiles to its left, and y[i] corresponds to a tile with i tiles above it.

#figure(
  image("../../Photos/Step1Path.png"), caption : "Full all point matrix initialization"
)
=== Step 2: Dijkstra's algorithm

*The Greedy Principle*

Dijkstra is a greedy algorithm that uses a Priority Queue to always explore the "cheapest" known node first. This ensures that once a node is processed, the path found to it is mathematically guaranteed to be the shortest possible under the given weights.

*Penalty implementation*

In this specific implementation, we modify the edge weight to account for mechanical constraints:
$ "Weight"  = "Euclidean Distance" + 1.0 "(Penalty)" $ 


#figure(
  image("../../Photos/Step2Path.png"), caption : "Full greedy dijkstra algorithm implementation"
)

=== Step 3: Final movement and combining everything:

After the first two steps, the destination now is in one-tile proximity of the robot. After that, the only thing left is to perform one final movement to the destination coordinates.

#figure(
  image("../../Photos/Step3Path.png"), caption : "Final movement."
)





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