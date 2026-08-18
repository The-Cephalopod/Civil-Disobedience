#import "../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("resources/Cycle1Icon.png",height:80%)))
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
   [Finn],[25/04/26],))])

   
== Strategy
=== Scoring Priority
#figure(
align(center,
  table(
    columns: 2,
    rows: auto, 
    inset: 3pt,
     [Autonomous Bonus], [12],
     [Scored Pin (Team Color)], [5],
     [Scored Pin (Yellow, Toggle to Team Color)], [10],
     [Scored Pin (Center, Endgame Bonus)], [10],
     [Midfield Control Bonus (Per Robot)], [8],
)))
As shown by the table, scoring yellow pins and claiming them either with toggles or by ending in the midfield allows for the most points to be scored. However, using yellow pins as the primary scoring object is risky as most yellow pins can be descored at any time by rotating the toggle. On the other hand, rule SG10 specifies that pins cannot be removed from neutral or opposing Alliance-colored Goals, meaning scoring alliance-colored pins is the safest way to play the game as they cannot be descored. It is also important to note that by controlling the midfield at the end of the game, you sacrifice defense of color toggles. This means that while a theoretical maximum of 86 points can be scored if both robots from an alliance control the midfield and 7 yellow pins are stacked, 520 total points can be scored by the opponents by simply switching toggle colors if all pins with at least one yellow side are scored with their yellow side visible. However, both of these options will likely be difficult to pull off during a game. Therefore, I have made the following table to determine the priority of each scoring scenario. The "Prioritization Index" is calculated by dividing the raw number of achievable points of a given action by the difficulty of completing the action. The higher the "Prioritization Index", the more we should prioritize accomplishing the respective objective. Note that this does have some level of subjectivity to it, but it helps as a general guide as to which game objectives are actually worth prioritizing.
#figure(
align(center,
  table(
    columns: 4,
    rows: auto, 
    inset: 3pt,
    table.header(
      [Game Objective], [Raw Point Value], [Difficulty (1 Easiest, 10 Hardest)], [Prioritization Index]
    ),
     [Autonomous Bonus], [12], [4], [3],
     [Scored Pin (Team Color)], [5], [1], [5],
     [Scored Pin (Yellow, Toggle to Team Color)], [10], [2], [5],
     [Scored Pin (Center, Endgame Bonus)], [10], [6], [2],
     [Midfield Control Bonus (Per Robot)], [8], [4], [2],
)))
This year, the autonomous bonus is quite low compared to simply scoring pins (it accounts for only 2 points more than 2 colored pins or one color-toggled yellow pin). It also may be relatively difficult to autonomously align the robot with the pins, increasing the difficulty of achieving the autonomous bonus. This is why the autonomous bonus has a relatively low prioritization.

I believe the compounding difficulty of both scoring the center goal and controlling the midfield makes attaining the pin score from midfield control quite difficult in comparison to other scoring mechanics.

Although scoring the yellow pins is equally as easy as scoring colored pins, changing the toggle to the alliance color and defending adds difficulty, bringing down the prioritization index. I believe it is very likely that teams will score a few yellow pins and then spend the game defending the toggles, so it is possible that scoring colored objects may take priority over neutral objects, especially early-on. This also explains the equally high prioritization of scoring colored pins.

Due to the 55W subsystem 1 limit, defending the midfield to prevent balancing the score bonus may be difficult. While drivetrain braking mechanisms may be implemented to stand ground, if all robots are within the midfield at the end of the game, the bonuses balance out, meaning time may have been better spent changing toggles to your alliance's color. Therefore, the midfield control bonus has a low priority. 