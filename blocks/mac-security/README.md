# Mac Security

Security settings for every managed Mac, with separate profiles for one-to-one
and shared Macs.

- **Firewall** turned on, and a **password required** to unlock the screen.
- **Restrictions**: a baseline for every Mac and a stricter set for shared
  Macs. Macs whose Restrictions attribute is set to Unassigned are left out.
- **Login window**: settings for one-to-one Macs and for shared Macs.
- **FileVault** through configuration profiles: enforced for one-to-one Macs,
  managed for shared Macs, and the recovery key escrowed to Jamf Pro.

Needs the Fleet Foundation block. It turns on FileVault itself, so do not
combine it with the FileVault block. The FileVault Key Management block
complements it.
