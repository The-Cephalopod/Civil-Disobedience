#import "../../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("../resources/Cycle1Icon.png",height:80%)))
  #pad(y: -30pt, strong(counter(page).display("1")))
  #align(right, "60000A = Civil disobedience")
      #line(length: 100%)],)

#set page(background: move(dy:390pt, dx: 230pt,
  text(80pt, fill: nDP.lighten(40%), font: "Roboto Mono")[
     *DP* 
  ]))
#set page(footer:[#pad(y: -20pt, table(
  columns: 2,
  inset: 3pt,
  table.header([*Contributor*], [*Date*],
),
   [Imran],[24/09/26],))])

= Autonomous routines
Here I will document my work on the autonomous routines of the robot. It includes paths, calibration and codes. My autonomous paths are traced on the official CAD of the V5RC Override field in Autodesk Fusion.

== Autonomous paths:

#figure(
  image("Fusion_In.png"), caption : "Screenshot from fusion with all the influentioal points"
)
It is planned that our autonomous code will run based on 2 main functions: 
- Driving to a point
- Turning to a set heading
Therefore, the main part of the autonomous code we must record are the coordinates of the points to which the robot will be moving.

I've traced paths of different difficulty, depending on our success rate at calibrating, cycle speed of the robot and aliance partners.

=== Brief field analysis (based on autonomous strategy, may differ from the driver's analysis):


#figure(
  image("Field Analysis.jpg"), caption : "Brief field analysis"
)
The green circles around the pins resemble the pins that can be approached from any angle, hence the circular shape. The orange small arcs resemble the same for the pins along the wall, however they have a far lower range of angles they can be approached from.

This makes them not as optimal to use.

The aliance goal is much lower in height compared to the neutral goal, meaning the cycle length will be sharter when scoring on it.

THhe lying pins are crossed out for now, since we don't have an effective way to pick them up.

=== The paths

Here are the paths I sketched in order of increasing difficulty:

#figure(
  image("diff1.jpg"), caption : "Flipping a toggle and scoring the preload. Very easy"
)
#figure(
  image("diff2.jpg"), caption : "Additional pin scored. Due to the need to drive away, the time constraint might be a little less open"
)
#figure(
  image("diff3.jpg"), caption : "Another pin added. Absolute limit for the current robot in my opinion"
)
#figure(
  image("diff4.jpg"), caption : "A suboptimal to achieve pin  added to the neutral goal. Most likely Impossible for the current robot."
)

