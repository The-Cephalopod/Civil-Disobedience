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

   
= Game Analysis and Strategy
== Game Summary
Override is played on an open field with 63 double-ended cones ("pins") and 56 double-ended cups used as the primary game scoring objects. The pins can be scored into 9 goals in the field, and the cups can be stacked on top of the pins to allow for more pins to be scored. Only visible pins are counted towards the score.
#figure(
  align(center,
    pad(y: 4pt,image("resources/overridefield.png",height:50%)
)),
caption: [The Override Field Setup])

#pagebreak()
== Game Elements
Each team starts with 10 cups and 11 pins (10x yellow-[alliance color] and 1x yellow-yellow) at the driver station.
=== Pins
- 63 total.
  - 20 blue-yellow.
  - 20 red-yellow.
  - 4 red-blue.
  - 19 yellow-yellow.
- Colored pins (visible) worth 5 points each.
- Yellow pins (visible) worth 10 points each.
  - Point allocation determined by toggle.
=== Cups
- 56 total.
  - One translucent side and one opaque side.
  - Pins visible through the translucent side are counted as scored.
=== Goals
Pins can be scored in goals before cups are used to stack additional pins.
- 9 total goals.
  - 1 center goal.
  - 2 red goals.
    - Only the red alliance may score in red goals.
  - 2 blue goals.
    - Only the blue alliance may score in blue goals.
  - 5 neutral goals.
- Maximum of 7 pins scored on any non-center goal due to 50" height limit.
=== Chargers (Loaders)
- 4 total.
  - 2 for each alliance.
- Pins and cups can be introduced to the game with loaders.
  - Can be introduced individually or together.
    - Pins must be inside cups if introduced together.
=== Midfield
- Alternate rules active in the last 15 seconds of a match.
  - Blocks can be scored in the midfield at any time during a match, but maximum height limit changes throughout a match (see *Alternate Rules (Applicable During Last 15 Seconds)*)
==== Alternate Rules (Applicable During Last 15 Seconds)
- 18" height limit
  - Maximum of 2 pins scored on the center goal due to 18" height limit.
    - Color of yellow pins in center goal determined by the alliance with the majority of robots in the midfield zone at the end of the game.
- 8 Points for each robot inside or intersecting the plane of the midfield.