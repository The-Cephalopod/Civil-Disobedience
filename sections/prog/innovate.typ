#import "../../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("../resources/Cycle1Icon.png",height:80%)))
  #pad(y: -30pt, strong(counter(page).display("1")))
  #align(right, "86832A = Wait Look Wait")
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
   [Imran],[17/08/26],))])
= Innovate award submission form
== Team number: 86832A
== Description:
- In override, the field had 9 goals hard-mounted to the field area. Navigating between the goals in autonomous mode requires precise navigation and path planning. The team developed a path planning algorithm that allowed the robot to navigate between the goals in autonomous mode with high precision. The algorithm takes into account the position of the robot, the position of the goals, and then plans an optimal path using Dijkstra's algorithm optimized by square root decomposition heuristic. The algorithm was tested extensively in simulation and on the field, and it was found to be highly effective in allowing the robot to navigate between the goals in autonomous mode.
== Locating pathfinding:
- A more detailed explanation and tests can be found in section X, "Pathfinding" of the engineering notebook.
== Unique aspects of the innovation:
- The pathfinding algorithm is unique in that it uses Dijkstra's algorithm optimized by square root decomposition heuristic, which allows for faster pathfinding in a dynamic environment, which we are yet to see another team do, as it is not a common robotics algorithm. I came up with the algorithm utilizing my prior competitive programming knowledge. That optimization brings the number of nodes of the graph from more than 5000000 to only 36, with small adjustments following, keeping it accurate. \ \
- Another aspect of innovation is Physical-to-algorithmic mapping. Sqrt decomposition required the larger zone to be split into smaller chunks, which we dicided to pin to the foam tiles on the field. This allowed us to test the algorithm in a physical environment and to pinpoint what exact part of the movbement could go wrong. It is also more intuitive and is easier to explain to other team members and judges, as they can see the physical representation of the algorithm on the field.
