 #import "../../../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("../../resources/Cycle1Icon.png",height:80%)))
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
   [Imran],[03/08/26],[Finn],[15/06/26]))])
== Planning:
  There are two main ways to approach the design of a user interface in the VEX V5 exosystem. The first is to use the integrated PROS screen API , using functions like drawLine, drawPixel, drawText, etc. to draw the UI elements on the screen. The second is to use the integrated LVGL library, which is a more powerful and flexible way to create user interfaces, but requires more setup and configuration. 
  \ The two will be compared in the following aspects:

   - Ease of use and setup
   - Functionality and flexibility
   - Speed and resource usage
   - Image support and rendering
   - Cleanliness and maintainability of the code


  Here is the table I used to evaluate the two options, and the final decision on which option to use:
#table(
  columns: 6,
  inset: 8pt,
  align: (left, left, left, left, left, left),
  fill: (x, y) => {
    if y == 0 { return luma(240) }
    if x == 1 and y == 1 { return rgb(144, 238, 144) }
    if x == 2 and y == 2 { return rgb(144, 238, 144) }
    if x == 3 and y == 2 { return rgb(144, 238, 144) }
    if x == 4 and y == 2 { return rgb(144, 238, 144) }
    if x == 5 { return rgb(255, 255, 153) }
  },
  table.header([*Option*], [*Ease of use and setup*], [*Functionality and flexibility*], [*Speed and resource usage*], [*Image support and rendering*], [*Cleanliness and maintainability of the code*]),
  [PROS screen API],[Easy to use and setup, with a simple API for drawing UI elements on the screen.],[Limited functionality and flexibility, with a limited set of UI elements and no support for advanced features like animations or touch input.],[Slower due to the need to render images pixel-by-pixel.],[No support for images or advanced rendering features.],[Code can become messy and hard to maintain as the UI becomes more complex.],
  [LVGL library],[More complex to set up and use, with a steeper learning curve.],[Highly flexible and powerful, with a wide range of UI elements and support for advanced features like animations and touch input.],[Faster at rendering more complex images/diagrams/icons.],[Supports images and advanced rendering features like anti-aliasing and transparency.],[Code still messy if the UI gets complex.]
  
)
\ \ \
From the results of the evaluation, it is clear that the LVGL library is the better option for creating a user interface for the robot. It is more powerful and flexible, with support for advanced features like animations and touch input, and it is faster at rendering more complex images/diagrams/icons. Even though it is more complex and has a steeper learning curve, I have enough time to get used to it before we start building.

However, the code does get messy despite what ui  you are using, so in order to keep the code organized, I will use a modular approach, with separate files for different parts of the UI, and use functions to encapsulate common UI elements and behaviors. This will make the code easier to read, understand, and maintain.


#figure(
  image("../../../Photos/Modular_code.png", width: 100%, height: auto), caption: [Modular code structure for the user interface])
The diagram above shows the modular code structure for the user interface, with separate files and their interactions. The only parts connecting the different branches *before* the linking stage are the header *.h* files, which are used to include the necessary files and functions in the main file. The main file is the entry point for the user interface, and it is responsible for initializing the LVGL library, creating the main screen, and linking the different parts of the UI together.
\ \ The other files are responsible for creating specific parts of the UI, such as the autonomous selection screen, the debug screen, and the PID calibration screen. Each of these files contains functions that create the UI elements and handle user input for that specific part of the UI.

== Prototypes:

To ensure the understanding of what I want to achieve with the user interface apart from the success criteria, I created a few prototypes of the UI screens on paper.

#grid(
  columns: (2.5fr, 1fr),
  gutter: 20pt,
  [
    #figure(
      image("../../../Photos/AutonsUiPrototype.jpg", width: 100%),
      caption: [Prototype 1: Autonomous selection screen],
    )
  ],
  [
    Autonomous selection screen with buttons to select the autonomous, and a description of the autonomous. I also added the trajectory coordinates of the autonomous to the description, so that the user can see the exact path of the auton. The run button at the bottom runs the autonomous without a competition switch/timed run, allowing an auton to be run multiple times without restarting the program.
  ],
  [
    #figure(
      image("../../../Photos/DebugUiPrototype.jpg", width: 100%),
      caption: [Prototype 2: Debug screen],
    )
  ],
  [
    Debug screen with a lot of information about the robot, including the temperature of the motors, sensor readings, heading,assumed position, height of the lift, and whether the claw is open or closed. The temperature of the motors is displayed as a number, not just a shade change, but a shade change is still present.
  ],
  [
    #figure(
      image("../../../Photos/PIDUiPrototype.jpg", width: 100%),
      caption: [Prototype 3: PID calibration screen],
    )
  ],
  [
   PID control screen with a sidebar to select the type of movement. The PID constants can be modified from the brain, and there are multiple buttons to test the movoment for short, medium and long distances. For swing controls specifically, there are buttons to selece to swing to the right or the left.
  ],
  [
    #figure(
      image("../../../Photos/AltUiPrototype.jpg", width: 100%),
      caption: [Prototype 4: Alternative design],
    )
  ],
  [
    I didn't like how the sidebar looked more like a menu for Autonomous selection, due to it being located wight underneath it, so here's an alternative deesign with rounded buttons instead of block-type design.
  ],
)

== Color Palette:
The only thing left to plan is the color palette of the future UI. Here is the one we decided on:\ \ 
#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    #figure(
      image("../../../Photos/ColorPalette.png", width: 100%),
      caption: [Color palette screenshot],
    )
  ],
  [
    \ \ FINN JUSTIFY THIS MONSTROCITY...
  ],
)



