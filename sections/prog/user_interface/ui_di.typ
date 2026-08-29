 #import "../../../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("../../resources/Cycle1Icon.png",height:80%)))
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
   [Imran],[27/07/26],))])

= User interface
== Design problem:
- As it is still too early for calibtrating autonomous movements due to the robot design not being completely finalized, I decided to focus on the user interface for the robot. The user interface is a crucial part of the robot. I decided to design a user interface that is intuitive and easy to use, helping us calibrate the autonomous without re-uploading the code, and also providing the pit crew with all the necessary information about the robot's status and performance including temperature, battery voltage and sensor readings.
== Analyzing precedents:
- The UI layout is heavily inspired by the VEX teams 21S and EZ 2025-2026 V5RC Push Back code, which have a very clean and intuitive layout.

=== Precedent 1: 21S Autonomous selection screen
#grid(
  columns: (1.2fr, 1fr),
  gutter: 20pt,
  align: horizon,
  [
    #figure(
      image("../../../Photos/EZ_autons.png", width: 100%),
      caption: [EZ-Autons Autonomous Selection screen Reference],
    )
  ],
  [
    #table(
      columns: 2,
      inset: 8pt,
      align: (left, left),      fill: (x, y) => {
        if y == 0 { return luma(240) }
        if x == 0 { return rgb(144, 238, 144) }
        if x == 1 { return rgb(255, 127, 127) }
      },      table.header([*Liked*], [*Disliked*]),
      [The Intuitive  buttons to select an autonomous], [The visualization taking up too much space and unnecessary as the description on top could replace it],
      [Scrollability with buttons because the V5 brain struggles to recognize swipes], [The lack of "run" button to start the autonomous, useful for testing]
      
    )
  ]
)
\ \ 
The autonomous selection screen is very intuitive and easy to use, with buttons to select the autonomous and a visualization of the autonomous. However, the visualization takes up too much memory and is unnecessary as the description on top could replace it. The scrollability with buttons is also a good idea because the V5 brain struggles to recognize swipes. However, the lack of a "run" button to start the autonomous is a downside, as it would be useful for testing.

=== Precedent 2: 21S Debug screen
#grid(
  columns: (1.2fr, 1fr),
  gutter: 20pt,
  align: horizon,
  [
    #figure(
      image("../../../Photos/EZ_debug.png", width: 100%),
      caption: [EZ-Autons Debug Screen Reference],
    )
  ],
  [
    #table(
      columns: 2,
      inset: 8pt,
      align: (left, left),      fill: (x, y) => {
        if y == 0 { return luma(240) }
        if x == 0 { return rgb(144, 238, 144) }
        if x == 1 { return rgb(255, 127, 127) }
      },      table.header([*Liked*], [*Disliked*]),
      [Change of shade to signify the temperature of the motor], [Lack of precise numbers for the temperature of the motor, only a shade change],
      [Scrollability with buttons because the V5 brain struggles to recognize swipes], [Debug screen and PID calibration crammed into the same tab]
      
    )
  ]
)
\ \
The debug screen has a change of shade in motor icons to signify the temperature of the motor. However, the lack of precise numbers for the temperature of the motor is a downside, as it would be useful for testing. However, the debug screen and PID calibration being crammed into the same tab is a downside, as their uses are very different: one is for monitoring by the builders and should be visible even during matches, and the other is for tuning and an accidental change can ruin everything.
=== Precedent 3: 21S PID calibration
#grid(
  columns: (1.2fr, 1fr),
  gutter: 20pt,
  align: horizon,
  [
    #figure(
      image("../../../Photos/EZ_pid.png", width: 100%),
      caption: [EZ-Autons PID Calibration Reference],
    )
  ],
  [
    #table(
      columns: 2,
      inset: 8pt,
      align: (left, left),      fill: (x, y) => {
        if y == 0 { return luma(240) }
        if x == 0 { return rgb(144, 238, 144) }
        if x == 1 { return rgb(255, 127, 127) }
      },      table.header([*Liked*], [*Disliked*]),
      [Plotting the PID error graph over time], [Lack of the ability to modify the values of the PID constants from the brain.],
      [Tab-like design for different types of movement]
      
    )
  ]
)
\ \
Overall, a brilliant imprementation of a PID calibration screen, with a plotting of the PID error graph over time and a tab-like design for different types of movement. However, the lack of the ability to modify the values of the PID constants from the brain is a downside, as it requires to have a controller on your hands all the time, and can result in its battery draining.
\ \ \ \ \ \ \ 
=== 21S: Conclusions
21S UI is a very clean user-interface, with a lot of thought put into the design. However, in some aspects it is too focused on the aesthetics and not the functionality. Examples include the lack of the exact temperature values, but intense focus on making the motor icons detailed; Autonomous selection visualization being purely cosmetic in most cases; and the PID calibration screen not having the ability to modify the values of the PID constants from the brain. 

Another thing that could be improved is a more convenient way to switch between the "tabs" of the UI. It uses 2 small arrows to switch between the two screens, but since we might want to add more tabs in the future, it would be better to have a more convenient way to switch between the tabs, such as a tab bar at the top of the screen, and move the movement type selection into the sidebar.

== Design specifications and success criteria:


 With building on the pros and cons of the precedents, here is the finalized list of specifications and success criteria with the justifications and priority levels for each of them: 


- *3 main tabs*: Autonomous selection, Debug screen, PID calibration. PID and debug must be separated.

- *Selection of the tab*: Buttons to switch to the desired tab, NOT to the next one (no arrows).

- *Autonomous selection*: Buttons to select the autonomous, with a "run" button to start the autonomous, and a text description. No visualization of the autonomous, as it is unnecessary and takes up too much memory.

- *Debug screen*: Display the temperature of the motors, battery voltage, sensor readings, heading and assumed position. The temperature of the motors must be displayed as a number, not just a shade change, but a shade change could be added as a secondary indicator.
- *PID calibration*: The main objective at the monment would be to support multiple types of movement, change the PID vaalues without reuploading the code, and a run button to test the selected type of movement. The PID error graph over time could be added as a secondary feature, but it is not a priority at the moment.
#table(
  columns: 4,
  inset: 8pt,
  align: (left, left, left, left),
  fill: (x, y) => {
    if y == 0 { return luma(240) }
    if x == 2 {
      let priority = ("Peak", "High", "Peak", "High", "Low", "Low")
      let p = priority.at(y - 1, default: "")
      if p == "Peak" { return rgb(255, 100, 100) }
      if p == "High" { return rgb(255, 200, 100) }
      if p == "Low" { return rgb(200, 255, 200) }
    }
    if x == 3 {
      let difficulty = ("Effortless", "Moderate", "Low", "Moderate", "High", "Moderate")
      let d = difficulty.at(y - 1, default: "")
      if d == "Effortless" { return rgb(100, 255, 100) }
      if d == "Low" { return rgb(150, 255, 150) }
      if d == "Moderate" { return rgb(255, 220, 100) }
      if d == "High" { return rgb(255, 120, 120) }
    }
  },
  table.header([*Success Criterion*], [*Justification*], [*Priority*], [*Difficulty*]),
  [Tabs for the screen selection, no arrows], [More screens to be added, so arrows are just not viable], [Peak], [Effortless],
  [Autonomous selection with text description], [Clear indication of selected autonomous], [High], [Moderate],
  [Debug screen with all required information], [Comprehensive monitoring capabilities], [Peak], [Low],
  [PID calibration with multiple movement types and adjustable PID values], [Facilitates tuning without code re-uploading], [High], [Moderate],
  [PID error graph over time], [Visual representation of PID performance], [Low], [High],
  [Detailed icons for everything (Aesthetics)], [Enhances visual appeal and user experience], [Low], [Moderate]
)
