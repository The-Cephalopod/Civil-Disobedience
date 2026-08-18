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
   [Finn],[29/04/26],))])

= Roller Mechanism

== Design Problem

We need a front mechanism that can flip a wall-mounted Toggle quickly and repeatedly during late-match offense/defense without using lift motion, dedicated motors, or heavy pneumatic usage. Because the Toggle only scores when it is #emph[fully seated] and #emph[not touching a robot] at rest, our mechanism must not just rotate it; it must also release cleanly so the Toggle settles into a legal scored state.

== Possible Mechanisms

+ *Lift-Integrated Roller:* Use wheels geared to the motors that raise the lift to spin the roller like seen in the herobots this year.@vex_override_video
    - *Pros:* Replicable; high-tolerance (alignment isn't a significant issue); uses existing components; proven to function in the 2026 Hero Bot.
    - *Cons:* Uses motor torque and battery that could otherwise be dedicated to the lift mechanism; the high-torque lift motors will likely be slow so significant gearing is needed.
+ *Wedge:* A passive wedge that pushes against the vertex of the roller facing the field to lift it and cause it to spin.
    - *Pros:* Passive (no electronic use).
    - *Cons:* Low-tolerance for alignment and bending; may be heavy.
+ *Pull-Latch:* A triangular latch that slides under the roller and rotates it upon removal by the robot moving away from the roller.
    - *Pros:* Passive (no electronic use); proven to function in preliminary Override designs and prototypes.
    - *Cons:* Low tolerance for alignment and bending; may plastically deform with repeated use.
== Mechanism Comparison

#table(
  columns: 6,
  rows: 4,
  align: left,
  stroke: 0.5pt,
  inset: 5pt,

  [#strong[Mechanism]],
  [#strong[Passive]],
  [#strong[Repeatability]],
  [#strong[Complexity]],
  [#strong[Time per flip]],
  [#strong[Notes]],

  [Lift-Integrated Roller], [N], [High], [Low], [Short], [Next best option (easy to add after rest of robot built.)],
  [Wedge], [Y], [Med], [Low], [Med], [Simple directional bias; sensitive to driver approach and bending from usage.],
  [Pull-Latch], [Y], [High], [Low], [Med], [Likely best first prototype.],

)

== Best Option

Relying on the table above, we have decided that using a pull-latch similar to what 5203G Gremlins have done to rotate the toggles will likely be the best option. However, if the mechanism repeatedly fails or plastically deforms, we will return to this to re-evaluate this decision.

== Test Data to Collect

#table(
  columns: (1.6fr, 1fr, 2.1fr),
  align: left,
  stroke: 0.5pt,
  inset: 5pt,

  [#strong[Metric]], [#strong[Target]], [#strong[Reason]],

  [Single-face flip success], [$>=$ 90%], [Main repeatability target for match use],
  [Double-flip rate], [$<=$ 5%], [Prevents wasted endgame cycles],
  [Fully seated at rest], [100%], [Required for scoring],
  [Average flip time], [$<=$ 0.60 s], [Keeps cycle time low],
  [Approach-angle tolerance], [Works at $plus.minus 10$ degree yaw], [Driver inaccuracy],
  [Maintenance interval], [$>=$ 100 cycles without retune], [Competition robustness to prevent unnecessary point loss during competition],
  [Toggle flip without drivetrain (robot) movement], [$>=$ 90%], [Reduces cycle time]
)