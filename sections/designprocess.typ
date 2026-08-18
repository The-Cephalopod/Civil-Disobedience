#import "../template.typ": *
#set page(header: context[
  #align(center,pad(y: 3pt,image("resources/Cycle1Icon.png",height:80%)))
  #pad(y: -30pt, strong(counter(page).display("1")))
  #align(right, "86832A = Wait Look Wait")
      #line(length: 100%)],)
#set page(background: move(dy:390pt, dx: 130pt,
  text(80pt, fill: intcol.lighten(40%), font: "Roboto Mono")[
     *Preface* 
  ]))
  
#set page(footer:[#pad(y: -20pt, table(
  columns: 2,
  inset: 3pt,
  table.header([*Contributor*], [*Date*],
),
   [Finn],[25/04/26],))])

= The Design Process
The International School of Beijing (ISB) has a design process which 86832A has determined is suitable and applicable to the VEX Robotics Competition.

Throughout the rest of the notebook, these colors will represent the different phases of the ISB Design Process and can be found at the bottom of all pages in acronyms (#text(fill: nDI)[DI], #text(fill: nDP)[DP], #text(fill: nCI)[CI], #text(fill: norange)[RS]).

== #text(fill: nDI)[Define & Inquire (DI)]
- Clearly and concisely describe the design problem and design commitment.
- Analyze a wide range of precedents to inspire and inform solutions to the design problem.
- Define specific and thorough success criteria to meet the user’s needs.
- Describe all details about the end user relevant to the design problem.
*Applicable V5RC Standards:* Identify the problem, independent inquiry
== #text(fill: nDP)[Develop & Plan (DP)]
- Effectively apply design thinking practices to generate a wide range of divergent ideas.
- Develop selected ideas into distinct design concepts that vary in style and type and clearly justify decisions.
- Develop a highly detailed plan for creating the preferred design.
*Applicable V5RC Standards:* Brainstorm, diagram or prototype solutions, select best solution and plan
== #text(fill: nCI)[Create & Improve (CI)]
- Create a high-quality design that meets success criteria and responds to the stated problem.
- Apply extensive feedback to iterate and highly refine the design. Show evidence of this feedback and the team’s response.
- Demonstrate strong growth in technical and design skills.
*Applicable V5RC Standards:* Build and program the solution, Test Solution, Repeat design process
== #text(fill: nRS)[Reflect & Share (RS)]
- Document the design process in detail, sharing the product and learning with others.
- In detail, use the success criteria to explain the strengths and weaknesses of the process and product.
- Reflect specifically and meaningfully on what further improvements could be implemented to develop the product.
- Reflection must be consistent throughout all three stages of the design process. Share, Critique, and Impact must also be present during the entire design process.
*Applicable V5RC Standards:* Useability and completeness, record of team and project management.
