#import "../../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("../resources/Cycle1Icon.png",height:80%)))
  #pad(y: -30pt, strong(counter(page).display("1")))
  #align(right, "60000A = Civil disobedience")
      #line(length: 100%)],)
#set page(background: move(dy:390pt, dx: 255pt,
  text(80pt, fill: nDI.lighten(40%), font: "Roboto Mono")[
     *DI* 
  ]))


#set page(footer:[#pad(y: -20pt, table(
  columns: 2,
  inset: 3pt,
  table.header([*Contributor*], [*Date*],
),
   [Imran],[17/06/26],))])
= Pathfinding
== Design problem

In the current V5RC game, Override, there are 9 solid immovable objects mounted onto the field area:
- 4 alliance-specific goals
- 4 neutral goals
- 1 center goal in the midfield
making navigating between them complicated and critical to master. When writing an autonomous, and especially an autonomous skills code, to swiftly navigate between them, we would have to account for tens of intermediate points, as driving in a straight line is not always an option, since almost always there would be a goal in the way.

That's how an idea of implementing a system, which would output a path with all those intermediate points by only getting the 2 input points: start and finish. It can even be further simplified, since the starting point would always be the current position of the robot that can be calculated with the tracking described in section ? - Odometry.

== Brainstorming the solutions

There's a couple of known shortest path algorithms, however, if we would want at least 0.1 inch precision, there's no algorithm that satisfies the precision preference, without going over the memory/time limit. Worst case scenario for most algorithms in O(n^2) time complexity e.g. in the worst case scenario, it would approximately take the brain n^2 operations, where n is the number of times, the precision unit can fit into the width of the field: (144 / 0.1)^2 = 2'073'600, which is a lot, as a brain can stably perform around 10000 operations per second, meaning it would take 200 seconds, which is longer than the duration of the match, and most of the algorithms require the same space, overflowing the RAM and crashing the Program entirely. Here are some of the heuristic examples that could help with the space and time complexity:

== Dijkstra’s Algorithm
#h(.5cm)Time Complexity: O(V log V + E) \
#h(.5cm)Space Complexity: O(V) \
The Constraint: At 0.1-inch precision, the field has over 2 million vertices (V). Even with a priority queue, the memory overhead for the distance table exceeds the V5 Brain's RAM, causing a heap overflow or immediate crash.

== A-star search
#h(.5cm)Time Complexity: O(E) best case; O(b^d) worst case\
#h(.5cm)Space Complexity: O(V)\
The Constraint: While the heuristic h(n) helps "aim" the search toward the target, the "Open List" still scales with the resolution. At 0.1-inch precision, the number of nodes stored in memory grows significantly, and the heuristic is complex and requires a lot of calculations, overwhelming the brain.
== Bellman-Ford Algorithm

#h(.5cm)Time Complexity: O(V  E)\
#h(.5cm)Space Complexity: O(V)\
The Constraint: This algorithm is designed to handle negative edge weights, which don't exist on a physical override field. With V = 2,073,600, the V  E operations would reach into the trillions, taking hours to calculate a single path—far exceeding the 120-second driver period.


== Floyd-Warshall Algorithm

#h(.5cm)Time Complexity: O(V^3)\
#h(.5cm)Space Complexity: O(V^3)\
The Constraint: This calculates the shortest path between all pairs of points. Storing the resulting matrix for a 0.1-inch grid would require approximately 4 trillion entries. This is mathematically impossible to run on any mobile robotics controller *during a match*. Emphasis on the speed during a match, since it is one of the few algorithms which actually have the ability to store the paths. if we could balance the pre-processing and on-field calculations, this could work perfectly fine.
== RRT (Rapidly-exploring Random Tree)

#h(.5cm)Time Complexity: O(n log n)\
#h(.5cm)Space Complexity: O(n)\
The Constraint: RRT is "probabilistically complete," meaning it finds a path by random sampling rather than a grid. While memory-efficient, the resulting path is jagged and non-optimal. For high-goal alignment, the "random" nature of the path would cause the wing to stutter, losing the precious seconds needed to de-score blocks effectively.
== Conclusions
Since all of the above solutions turned out to be not optimized for the computing possibilities of the V5 Robot brain, with the best time still requiring 

$ 
"Total Nodes " (N) &= 720^2 = 518,400 \
\
"Best-case Complexity" &= O(N log_2 N) \
\
"Total Operations" &= 518,400 times log_2(518,400) \
&\ approx 518,400 times 19 \
&\ approx 9,849,600 " operations" \
\
&  approx 10^7 " operations " ("too slow")
$
we had to come up with an innovative approach to the problem. We are yet to find a robot with similar code to ours in any robotics competition, so I took a problem from competitive programming and adapted it into the robotics field.
