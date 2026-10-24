# Mac Provisioning

The first-run workflow for new Macs.

- **Enrollment** runs when enrollment completes on Macs whose first run has
  not completed and that came through one of the fleet PreStages. It calls
  the **First Run** policy (custom trigger `FirstRun`), which installs
  Rosetta 2 on Apple silicon, removes Apple apps the fleet does not use
  (GarageBand, iMovie, Keynote, Numbers, Pages), and records the date the
  first run finished. That date feeds the First Run attribute, which moves
  the Mac into All Managed. Its last step runs **Wait for Profiles**
  (custom trigger `WaitForProfiles`), which waits for the configuration
  profiles to arrive.
- **User-Initiated Enrollment** is a Self Service item ("Onboard your Mac")
  for Macs that enrolled without a fleet PreStage. It asks whether the Mac
  is one-to-one or shared, writes the answer to the Classification
  attribute, and starts the same workflow.

Needs the Fleet Foundation block. The Rosetta 2 block does the same install
on its own; selecting both is harmless.
