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
[Finn],[18/06/26],))])

= Drivetrain

There are several potential drivetrain types we are considering for use in Override:

=== Tank Drive
#table(columns:(1fr,2fr),stroke:none, [#figure(image("../Photos/RobustTankDrive.PNG"),caption:[Model of my team (86832B Robust)'s Tank Drive from High Stakes last year])],[This drivetrain consists of a series of wheels placed on each side of the robot, with motors controlling each respective side allowing for forward, backward, and turning motion.

#table(
  columns: (1fr, 1fr),
  inset: 4pt,
  fill: (x, y) =>
    if y == 0 and x ==1 {rgb("D30504").lighten(40%)} else
    if y==0 and x==0 {green.lighten(40%)},
  table.header([*Pros*], [*Cons*],
),
  align: left,
  [Simple construction],
  [Limited in motion],
  [Space efficient],
  [Low in traction],
  [Easy to program basic functions],
  [Potentially hard to operate based off variations in wheel type and driver ability\*],
  [Consistent power output from connected gear train],
  [Harder to program autonomous routines],
  [Relatively flexible motor count (4, 6, & 5 with effort)]
)
])
\* This will be elaborated on further in the "Wheel Size Analysis & Comparison - DI" Section.

=== H-Drive
#table(columns:(1fr,2fr),stroke:none, [#figure(image("../Photos/HDrive.png"),caption:[A basic model of UKentucky's H-Drive \ Source: Purdue Sigbots])],[This drivetrain is similar to the Tank Drive - the only differentiating factor is additional horizontal wheel in the center of the chassis.

#table(
  columns: (1fr, 1fr),
  inset: 4pt,
  fill: (x, y) =>
    if y == 0 and x ==1 {rgb("D30504").lighten(40%)} else
    if y==0 and x==0 {green.lighten(40%)},
  table.header([*Pros*], [*Cons*],
),
  align: left,
  [Lateral movement enabled by the center wheel],
  [Weak lateral movement enabled only be one motor],
  [Relatively simple construction],
  [Easy to be pushed around due to the inability to have traction wheels],
  [Simple option if 5 motors/55W is desired],
  [Generally restricted to 5 motors/55W output],
  [Plenty of room for front and back intakes/mechanisms],
  [Less space efficient than Tank Drives]

)
])

=== Swivel Drive
#table(columns:(1fr,2fr),stroke:none, [#figure(image("../Photos/SwivelDrive.png"),caption:[A swivel drive posted to the VEX Forums])],[Like an advanced office chair, this drivetrain consists of four wheels that are powered by two motors: One to power the wheel, and one to change the bearing of the wheel.

#table(
  columns: (1fr, 1fr),
  inset: 4pt,
  fill: (x, y) =>
    if y == 0 and x ==1 {rgb("D30504").lighten(40%)} else
    if y==0 and x==0 {green.lighten(40%)},
  table.header([*Pros*], [*Cons*],
),
  align: left,
  [Very maneuverable],
  [Excessive weight],
  [Extremely unique],
  [Lacks traction],
  [],
  [Generally slow],
  [],
  [High motor usage for relatively low power output]

)
])

=== Mecanum Drive
#table(columns:(1.1fr,2fr),stroke:none, [#figure(image("../Photos/mecanum.png"),caption:[A simple chassis with a Mecanum Drive \ Source: CS-STEM Network])],[This drivetrain features four Mecanum wheels (wheels with rollers at 45 degree angles) allowing for dynamic movement in all directions.

#table(
  columns: (1fr, 1fr),
  inset: 4pt,
  fill: (x, y) =>
    if y == 0 and x ==1 {rgb("D30504").lighten(40%)} else
    if y==0 and x==0 {green.lighten(40%)},
  table.header([*Pros*], [*Cons*],
),
  align: left,
  [High maneuverability],
  [Difficult to assemble],
  [Unique],
  [Difficult to program],
  [Decent efficiency, allowing for good speed and torque],
  [Not space-efficient compared to Tank Drives],
  [Most space-efficient drivetrain with lateral movement ability],
  [Less flexible in terms of motor count (Generally 4)],
  [Allows strafing],


)
])

=== X-Drive
#table(columns:(1fr,2fr),stroke:none, [#figure(image("../Photos/XDrive.png"),caption:[A render of an X-Drive Chassis\ Source: Purdue Sigbots])],[This drivetrain features four omni-wheels attached at 45 degree angles, allowing forward motion using vector addition.

#table(
  columns: (1fr, 1fr),
  inset: 4pt,
  fill: (x, y) =>
    if y == 0 and x ==1 {rgb("D30504").lighten(40%)} else
    if y==0 and x==0 {green.lighten(40%)},
  table.header([*Pros*], [*Cons*],
),
  align: left,
  [High maneuverability],
  [Difficult to assemble],
  [Unique],
  [Difficult to program basic functions],
  [Balanced speed and torque output in all directions],
  [Less space efficient than Tank Drive],
  [Easier to simulate in programs due to its holonomic nature],
  [Minimal traction],
  [Easier to operate\*],
  [],
  [Allows strafing]
)
])
\*Some may prefer the controls of a holonomic drive over Tank Drive, but this can come down to preference. However, it is certain that X-Drives offer the most freedom of movement.


=== Asterisk Drive
#table(columns:(1fr,2fr),stroke:none, [#figure(image("../Photos/asterstfk.png"),caption:[A render of an Asterisk-Drive Chassis\ Source: VEX Forums])],[This drivetrain builds on top of a traditional x drive by adding two extra motors parallel to the two channels on the side, allowing for the maneuverability of an x drive paired with more offensive capabilities.
#table(
  columns: (1fr, 1fr),
  inset: 4pt,
  fill: (x, y) =>
    if y == 0 and x ==1 {rgb("D30504").lighten(40%)} else
    if y==0 and x==0 {green.lighten(40%)},
  table.header([*Pros*], [*Cons*],
),
  align: left,
  [Quick repositioning],
  [Less torque than other options],
  [Unique],
  [2 motors are not being constantly utilized],
  [Agility of an x drive with strength of a tank drive],
  [],
  [Omni directional],
  [],
  [Allows strafing],
)
])

// === Wheel Types

// #pagebreak()

#set page(footer:[#pad(y: -20pt, table(
  columns: 2,
  inset: 3pt,
  table.header([*Contributor*], [*Date*],
),
   [Eddie],[26/06/25]))])
#set heading(outlined: true)
== Wheel Size Analysis & Comparison - DI

While different wheel sizes can be geared to produce the same speed for a robot, the size of wheels still matters for a couple of factors:
\
\
*Acceleration and Torque*
\
The sizes of wheels can affect a robot's acceleration because of its moment of inertia. 
\
\
#table(stroke:none, columns: (1fr,1fr), align: horizon + center, [#text(20pt, $ I_P = sum_(i=1)^N m_i r_i^2 $)],[ #text(20pt, $tau = I alpha$)])
\
Since moment of inertia is both proportional to torque and inversely proportional to angular acceleration, and the moment of inertia of wheels has a quadratic relationship with their respective radii, the size of wheels can affect both acceleration and torque. This matters because higher acceleration typically allows for faster gameplay and higher torque increases the pushing power of robots.
\
\
*Center of Gravity and Obstacle Traversal*
\
Larger wheels generally lift a robot's base marginally higher than smaller wheels, resulting in a higher center of gravity. This is important because it can affect whether a robot tips over easily when experiencing sudden changes in acceleration (or high amounts of jerk). An elevated base as a result of larger wheels can also allow for greater ground clearance, which influences a robot's ability to traverse obstacles. 
\
\
// hey eddie, youre literally using an app made to write math equations, you can just write the equation out instead of putting an image
// how do i write the Sigma symbol with the funny numbers under and also subscripts and stuff

*Comparison of Wheel Sizes Given Constant Speed from Gearing*
\
#let g = table.cell(
  fill: green.lighten(60%),
)[\ \ ]
#let r = table.cell(
  fill: red.lighten(60%),
)[\ \ ]

#table(
  fill: (x,y) =>
  if x == 0 or y == 0 {gray.lighten(60%)},
  columns: (1fr, 1fr, 1fr),
  table.header([], [*Smaller wheels*], [*Larger wheels*]
),
  align: left,
  [Higher top acceleration],
  g,
  r,
  [Higher torque output],
  g,
  r,
  [Lower center of gravity],
  g,
  r,
  [Higher top speed potential],
  r,
  g,
  [Better obstacle traversal],
  r,
  g,
 
)