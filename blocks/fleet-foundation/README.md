# Fleet Foundation

The groups, extension attributes and categories the other fleet blocks build
on. The fleet is split into **one-to-one** devices (one person, one device)
and **shared** devices, for Macs and for iPads and iPhones.

- **Extension attributes** (Mac and mobile): Classification (1:1 or Shared),
  First Run (a script that reports when the first-run workflow finished),
  Restrictions, Administrator Rights, Testing and Notes.
- **Smart groups**: All Managed, All 1:1, All Shared, All Laptops, All
  Desktops, All Apple silicon and Intel, FileVault key valid or not,
  first run complete or not, User Approved MDM (with macOS 13 and 15
  variants), Administrator Rights, Restrictions and Testing; on mobile also
  All Unsupervised, All Migrated and Last Enrollment More Than 1 Day.
- **PreStage groups** match the PreStages from the Mac PreStages and
  iPad and iPhone PreStages blocks by name (`<prefix>PreStage - 1:1` and
  `<prefix>PreStage - Shared`). Devices enrolled another way are classified
  through the Classification attribute instead.
- **Static groups**: Excluded (Mac and mobile). Every fleet block leaves out
  devices you add here.
- **Categories**: Applications, Global, Managed Login Items, PPPC and
  Provisioning.

On Macs, **All Managed** means "first run complete": the profiles, apps and
policies of the other blocks reach a Mac once the first-run workflow in the
Mac Provisioning block has finished on it.

Computer and mobile groups share names in Jamf. Blocks reference the mobile
ones as `"<name> (mobile)"`.
