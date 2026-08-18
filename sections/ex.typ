#import "../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("Cycle1Icon.png",height:80%)))
  #pad(y: -30pt, strong(counter(page).display("1")))
  #align(right, "86832A = Wait Look Wait")
      #line(length: 100%)],)
#set page(background: move(dy:390pt, dx: 255pt,
  text(80pt, fill: nDI.lighten(40%), font: "Roboto Mono")[
     *CI* 
  ]))
  
#set page(footer:[#pad(y: -20pt, table(
  columns: 2,
  inset: 3pt,
  table.header([*Contributor*], [*Date*],
),
   [Jason],[18/01/26],))])

   
= Hi
djsfjlsdkfjl
== Hello
dksjfksd