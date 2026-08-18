#import "@preview/glossarium:0.3.0": *
#import "@preview/cetz:0.2.0": *

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!

//colors
#let nDI = rgb(213, 45, 0) //DI
#let nCI = rgb(0, 168, 213) //CI
#let nRS = rgb(209, 98, 164) //RS
#let norange = rgb(239, 118, 39) //others
#let nDP = rgb(163, 2, 98) //DP
// intcol is "intro color" use intcol.lighten(40%) used for preface and postface
#let intcol = rgb(255, 154, 86)

#let project(title: "Civil Disobedience", authors: (
  (
    name        : "Finn Clayton",
  ),
  (
    name        : "Patrick Young",
  ),
  (
    name        : "Imran Abdulkhakov",
  ),
  (
    name        : "Kevin Li",
  ),
  (
    name        : "Ethan Jong",
  ),
),  
  logo: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: start, header: align(right)[86832A = Wait Look Wait #line(length: 100%)], background: move(dy:390pt, dx: 85pt,
  text(80pt, fill: intcol.lighten(40%), font: "Roboto Mono")[
     *Et Cetera* 
  ]
))
  set text(font: "Libertinus Serif", lang: "en",)

  // Set paragraph spacing.
  // show par: set block(above: 1.2em, below: 1.2em)

  set par(leading: 0.75em)

  // // Title page.
  // // The page can contain a logo if you pass one with `logo: "logo.png"`.
  // v(0.6fr)
  // v(9.6fr)
  // text(2em, weight: 700, title)

  // // Author information.
  // pad(
  //   top: 0.7em,
  //   right: 20%,
  //   grid(
  //     columns: (1fr,) * calc.min(3, authors.len()),
  //     gutter: 1em,
  //     ..authors.map(author => align(start, strong(author))),
  //   ),
  // )

  // v(2.4fr)
  // pagebreak()


  // // Main body.
  // set par(justify: true)

  body
}