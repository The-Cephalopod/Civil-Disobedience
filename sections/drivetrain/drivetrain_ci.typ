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
[Patrick],[23/08/26],))])

= Drivetrain

#figure(
  image("assets/drivetrainprogress3.jpg", width: 80%),
)
#figure(
  image("assets/drivetrainprogress4.jpg", width: 80%),
)