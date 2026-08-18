
#import "/template.typ": *
#import "/sections/glossary.typ": *

#show: project.with()

//content
#include "sections/designprocess.typ"
#pagebreak()
#include "sections/analysis.typ"
#pagebreak()
#include "sections/strategy.typ"
#pagebreak()
#include "sections/driver_strategy.typ"
#pagebreak()
#include "sections/lift/lift_di.typ"
#pagebreak()
#include "sections/roller/rollermech_di.typ"
#show: make-glossary
#pagebreak()
#include "sections/claw/clawmech_di.typ"
#pagebreak()
#include "sections/claw/clawmech_dp.typ"
#pagebreak()
#include "sections/prog/pathfinding.typ"
#pagebreak()
#bibliography("sections/resources/bibliography.bib", style: "ieee", full: true)