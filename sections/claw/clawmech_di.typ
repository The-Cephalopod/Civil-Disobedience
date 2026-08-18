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
[Finn],[30/04/26],))])

= Intake Mechanism

== Design Problem

We need an intake mechanism that can quickly and reliably collect both Pins and Cups during early-season Override matches. The mechanism must be simple enough to build and tune quickly, but accurate enough to control game objects after contact. Since Pins and Cups are not identical shapes, the intake must be able to pick up objects without relying on perfectly centered alignment from the driver.

The main design decision is between a rolling intake and a claw-style intake. A rolling intake could potentially collect objects faster, but it may also rotate, twist, or misalign game objects before they enter the robot. This is a significant issue because poor object alignment can slow later scoring actions and create jams. A claw mechanism is likely slower in intake speed, but it gives the robot more control over how the object is held.

For early season, we are prioritizing reliability, simplicity, and controllable alignment over maximum intake speed.

== Possible Mechanisms

- *Rolling Intake:* Use powered rollers or compliant wheels (e.g., flex wheels) to pull Pins and Cups into the robot.
  - *Pros:* Potentially fast; can collect objects while the robot is still driving; proven concept in many VEX games; may allow faster cycling after tuning.
  - *Cons:* May not consistently align Pins and Cups; can pull objects in at awkward angles; requires tuning roller spacing, compression, wheel type, and guide geometry; may jam if game objects enter sideways.
- *Pneumatic Claw Intake:* Use a pneumatically actuated claw to open and close around Pins and Cups. The claw assembly may rotate up and down.
  - *Pros:* Mechanically simple; directly controls object position; more tolerant of object shape differences; easier to prototype quickly; less likely to misalign objects during intake; uses pneumatics for gripping force instead of adding another motor.
  - *Cons:* Slower than a continuous roller intake; requires driver accuracy to position the claw around the object; uses pneumatic air; may struggle if the claw geometry does not match both Pins and Cups well.
- *Hybrid Roller-Claw Intake:* Use a small roller or passive roller to help center objects, then grip them with a claw.
  - *Pros:* Combines active alignment with secure holding; may improve intake speed without fully relying on rollers.
  - *Cons:* More complex; harder to build early season; adds tuning problems from both roller and claw mechanisms; may not be worth the added complexity until the robot’s scoring path is better understood.

== Mechanism Comparison

#table(
columns: 6,
align: left,
stroke: 0.5pt,
inset: 5pt,

[#strong[Mechanism]],
[#strong[Object Control]],
[#strong[Alignment Reliability]],
[#strong[Complexity]],
[#strong[Intake Speed]],
[#strong[Notes]],

[Rolling Intake], [Med], [Low-Med], [Med], [High], [Fast option, but likely requires significant tuning to avoid misaligned Pins and Cups.],
[Pneumatic Claw Intake], [High], [High], [Low], [Med], [Best early-season option because it is simple, controllable, and easier to iterate.],
[Hybrid Roller-Claw Intake], [High], [Med-High], [High], [High], [Possible later-season upgrade, but too complex for the first working version.],
)

== Best Option

Relying on the comparison above, we have decided to use a pneumatic claw intake for our early-season robot. The claw will open and close pneumatically to grip Pins and Cups, while the full claw assembly will rotate up and down using a motor.

This decision is mainly based on simplicity and game-object control. A rolling intake may become useful later because of its potential speed, but it introduces a major alignment risk. If the rollers pull Pins or Cups into the robot at inconsistent angles, we may waste time correcting the object’s position or fail to score cleanly. The claw design should give us more predictable control over each object because it grips the object directly instead of relying on rolling contact.

The first prototype should focus on making the claw geometry work reliably with both Pins and Cups. The claw should close firmly enough to hold objects during driving and arm rotation, but not so tightly that it causes damage to itself or the game objects. The motor should be geared for controlled motion, since the arm does not need to move extremely fast if it gains reliability and avoids overshooting.

If the claw proves too slow during driver practice or if it cannot collect objects from multiple approach angles, we will return to this design inquiry and reconsider a roller intake or hybrid roller-claw mechanism.

== Prototype Requirements

- The claw must be able to grip both Pins and Cups without changing parts between matches.
- The claw should hold the object securely while the robot drives, turns, and rotates the intake arm.
- The claw should release the object cleanly without the object sticking to the mechanism.
- The 11W motor should rotate the claw assembly between intake and carry/scoring positions without stalling.
- The mechanism should remain narrow enough to avoid unnecessary field contact.
- The claw should be easy to repair, adjust, or replace between matches.
- The pneumatic actuation should use as little air as possible while still gripping reliably.

== Test Data to Collect

#table(
columns: (1.6fr, 1fr, 2.1fr),
align: left,
stroke: 0.5pt,
inset: 5pt,

[#strong[Metric]], [#strong[Target]], [#strong[Reason]],

[Pin pickup success], [$>=$ 90%], [Measures whether the claw can reliably collect Pins during normal driving.],
[Cup pickup success], [$>=$ 90%], [Ensures the claw geometry works for both major game objects.],
[Object retained while driving], [$>=$ 95%], [Prevents dropped objects during cycles.],
[Clean release success], [$>=$ 95%], [Prevents objects from sticking in the claw or being released in the wrong orientation.],
[Average pickup time], [$<=$ 1.00 s], [Keeps cycle time competitive despite using a claw instead of rollers.],
[Arm raise/lower time], [$<=$ 0.75 s], [Checks whether the 11W motor can rotate the claw assembly quickly enough.],
[Approach-angle tolerance], [Works at $plus.minus 45$ degree yaw], [Reduces required driver precision when approaching Pins and Cups.],
[Pneumatic usage per cycle], [$<=$ 1 open/close cycle], [Conserves air for the rest of the match.],
[Motor stall during rotation], [0 stalls in 25 cycles], [Confirms the claw assembly is light enough and geared correctly.],
[Maintenance interval], [$>=$ 100 cycles without retune], [Ensures the mechanism can survive repeated match use.],
)

== Re-Evaluation Conditions

We will revisit this decision if one or more of the following problems appear during testing:

- The claw cannot pick up Pins and Cups with at least 90% reliability.
- The claw is too slow compared with the expected scoring cycle.
- The robot needs too much driver precision to collect objects.
- Objects frequently rotate or shift into unusable positions after being gripped.
- The 11W motor stalls or overheats while rotating the claw assembly.
- Pneumatic air usage becomes too high for match-length operation.
- A roller prototype demonstrates significantly faster pickup without alignment problems.

If these issues appear, the next design inquiry should compare the current pneumatic claw against a rolling intake or a hybrid roller-claw mechanism.
