#import "../../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("../resources/Cycle1Icon.png",height:80%)))
  #pad(y: -30pt, strong(counter(page).display("1")))
  #align(right, "86832A = Wait Look Wait")
      #line(length: 100%)],)
#set page(background: move(dy:390pt, dx: 255pt,
  text(80pt, fill: nDP.lighten(40%), font: "Roboto Mono")[
     *DP* 
  ]))

  #set page(footer:[#pad(y: -20pt, table(
columns: 2,
inset: 3pt,
table.header([*Contributor*], [*Date*],
),
[Finn],[15/05/26],))])

= Designing the Claw

== Planning

There are four key aspects that go into drivetrain design:

- Speed and gearing
- Wheel size and layout
- Width
- Length

=== Speed and Gearing

Our team has historically used medium to fast drivetrains that run at about 450-600 RPM. This benefitted us in fast-paced games like High Stakes and Pushback, where robots could be small, light, and compact. In Override, the use of a metal cascade lift and a potentially high center of gravity mean that high-speed robots may be at a disadvantage in comparison to higher-torque, medium-speed drivetrains. This is because as center of gravity increases, the robot must accelerate more slowly to prevent it from tipping over, meaning that the highest speeds of the drivetrain might not be used in a game despite torque being sacrificed. Therefore, due to our teams experience with 450 RPM drivetrains and their advantage over faster drivetrains for Override, *we have opted to use a 450 RPM drivetrain.* This is most easily done by using 11 W motors with blue cartridges (that output 600 RPM natively) and gearing them down to the wheels with a ratio of *36:48.*

== Wheel Size and Layout

We are choosing to use *3.25" wheels* for two reasons:
- 48 tooth gears slot into them nearly perfectly.
- The theoretical ground speed of the robot (assuming minimal friction) is 76.6 in/s, which is quite fast, but not so fast that it's uncontrollable. We know this from using 80-100 RPM drivetrains in past seasons.

There are two primary ways you can arrange the wheels on a tank drivetrain:

#figure(
align(center,
table(
columns: 2,
rows: 4,
[Omni], [Omni],
[Traction], [Traction],
[Traction], [Traction],
[Omni], [Omni]
  
)))

#figure(
align(center,
table(
columns: 2,
rows: 4,
[Omni], [Omni],
[Traction], [Traction],
[Empty], [Empty],
[Omni], [Omni]
  
)))

The first table is the layout of an 8-wheel tank drivetrain with two central traction wheels and two outer omni wheels. This drivetrain has a large ground contact surface, meaning it has low wheel slippage and cannot be easily pushed laterally by other bots. However, these advantages come at the cost of slower turns due to higher friction as well as slightly longer acceleration times.

The second table is the layout of a 6-wheel tank drivetrain that trades a traction wheel pair for higher turn and acceleration speeds.

Due to the nature of Override being a low-acceleration, slow-turning game, we are choosing to use the 8-wheel drivetrain layout, which will grant us more defense from other robots pushing when scoring.