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
   [Finn],[27/04/26],))])

= Lift Mechanism


== Design Problem
The robot must pick up one pin and/or one cup from the floor, lift the object accurately, and place it onto a goal or existing stack.

== Game Constraints Affecting the Lift

#list(
  [The robot may only possess one pin and one cup at a time.],
  [The lift must stay under the normal vertical expansion limit of 50 in / 1270 mm.],
  [During the final 10 seconds, robots inside the midfield boundary must stay below 18 in / 457 mm, so the lift should fully retract.@recf_guide],
  [The drivetrain subsystem is limited to 55 W. If we use a 4-motor drive, the remaining motor power (44W for a 4-motor drive, 33W for a 6-motor drive with 2x5.5W motors) must be used efficiently by the lift and other non-drivetrain components.@vex_motor_groups]
)

== Comparison Criteria

Lift mechanisms were compared using the following criteria:

#table(
  columns: (1.3fr, 2.7fr),
  align: left,
  stroke: 0.5pt,
  inset: 6pt,

  [#strong[Criterion]], [#strong[Reason for importance]],

  [Vertical placement accuracy],
  [The pin/cup must be placed without knocking over the previous object in the stack.],

  [Reach],
  [The lift must reach useful scoring heights while staying below 1270 mm.],

  [Retraction height],
  [The lift should retract below 457 mm if we want to enter midfield during the final 10 seconds.],

  [Cycle speed],
  [Faster lifting allows more scoring cycles during driver control.],

  [Stability],
  [The robot should not tip when the lift is extended with one pin and one cup.],

  [Friction and motor load],
  [High friction wastes motor power and may overheat motors.],

  [Build complexity],
  [The mechanism must be realistic to build, maintain, and repair at competition.]
)

== Mechanism Comparison

#table(
  columns: (1.1fr, 1.7fr, 1.7fr, 1.5fr),
  align: left,
  stroke: 0.5pt,
  inset: 5pt,

  [#strong[Mechanism]],
  [#strong[Advantages]],
  [#strong[Disadvantages]],
  [#strong[Fit for Override]],

  [Single 4-bar],
  [
    Simple, light, easy to build, and quick to prototype. VEX describes the 4-bar as one of the easiest linkage arms to assemble.@vex_lifts
  ],
  [
    The end of the linkage moves in an arc, not straight up. Reach is limited compared with taller lift systems.@vex_lifts
  ],
  [
    Likely not precise enough for high stacking.
  ],

  [6-bar],
  [
    Higher reach than a 4-bar while still using a simple linkage structure.@vex_lifts
  ],
  [
    Extends outward as it rises, which shifts the center of mass and can increase tipping risk. Also, has the same arc problem as the 4-bar.
  ],
  [
    Possible, but probably less accurate than a vertical lift.
  ],

  [Double reverse 4-bar (DR4B)],
  [
    High reach, mostly vertical motion, and proven in VEX. Can keep the load closer to the robot than a long single arm.@vex_lifts
  ],
  [
    More complex than a 4-bar. Needs strong cross-bracing (heavy), low tolerance, and paired sides to prevent twisting.
  ],
  [
    Strong backup option because it is a proven VEX design with manageable risk.
  ],

  [Cascade lift],
  [
    Very vertical motion, compact footprint, and good placement geometry. Chain can actively power the lift up and down.@vex_lifts
  ],
  [
    Sensitive to friction, chain tension, rail alignment, and spacer thickness (many low tolerances).
  ],
  [
    Best theoretical option for accurate stacking, but high risk due to friction and low tolerance.
  ],

  [Scissor lift],
  [
    High vertical extension from a compact base.
  ],
  [
    Heavy, torque-demanding, difficult to stabilize, and mechanically inefficient compared with other options.
  ],
  [
    Too complex and unstable for fast scoring.
  ],
)

== Initial Decision

We have chosen to use the cascade lift because it moves the end mechanism almost straight upward. This should make it easier to align a pin or cup with the goal/stack. The main risk is build quality and tolerance: if the sliding stages bind or the chain skips, the mechanism will be unreliable. The double reverse 4-bar is less ideal for perfectly vertical placement, but it is more familiar (we temporarily used similar mechanisms in High Stakes and Pushback) and may be easier to make competition-ready.

#table(
  columns: (auto, 1.2fr, 2.8fr),
  align: left,
  stroke: 0.5pt,
  inset: 6pt,

  [#strong[Rank]],
  [#strong[Mechanism]],
  [#strong[Reason]],

  [1],
  [Cascade lift],
  [Best vertical placement geometry, but only worth it if friction and alignment are acceptable.],

  [2],
  [Double reverse 4-bar],
  [Best backup due to proven mechanism (used temporarily in Pushback and High Stakes) with good reach and lower build risk than a cascade lift.],

  [3],
  [6-bar],
  [Simpler than a DR4B, but less vertical and more likely to shift the robot's center of mass forward due to arc.],

  [4],
  [Scissor lift],
  [Heavy, torque-demanding, and hard to stabilize.]
)

== Test Data to Collect

#table(
  columns: (1.4fr, 2.6fr),
  align: left,
  stroke: 0.5pt,
  inset: 6pt,

  [#strong[Test]],
  [#strong[Data to record]],

  [Maximum height],
  [Highest reachable end-effector position in mm.],

  [Retraction height],
  [Lowest folded height in mm. Check whether it can stay below 457 mm.],

  [Cycle speed],
  [Time from floor pickup position to scoring position, in seconds.],

  [Placement accuracy],
  [Successful placements / total attempts.],

  [Motor load],
  [Motor temperature after repeated cycles. Note any stalling or slowing.],

  [Stability],
  [Whether the robot tips or rocks when the lift is extended.],

  [Maintenance risk],
  [Chain skipping, loose axles, bending rails, binding, or spacer wear.]
)