
#import "/template.typ": *
#import "/sections/glossary.typ": *

#show: project.with()
#include "sections/prog/innovate.typ"
#pagebreak()
//content
#include "sections/designprocess.typ"
#pagebreak()
#include "sections/analysis.typ"
#pagebreak()
#include "sections/strategy.typ"
#pagebreak()
#include "sections/driver_strategy.typ"
#pagebreak()
#include "sections/drivetrain/drivetrain_di.typ"
#pagebreak()
#include "sections/drivetrain/drivetrain_dp.typ"
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
#include "sections/prog/user_interface/ui_di.typ"
#pagebreak()
#bibliography("sections/resources/bibliography.bib", style: "ieee", full: true)