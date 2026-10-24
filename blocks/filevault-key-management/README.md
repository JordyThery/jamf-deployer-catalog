# FileVault Key Management

Keeps the FileVault recovery key that Jamf Pro holds usable.

- **Reissue FileVault 2 Recovery Key** runs at login (once a day) on Macs
  whose escrowed key is invalid or unknown: the user enters their password
  and a new key is escrowed.
- The same reissue is offered as a **Self Service** item to those Macs.
- **Rotate FileVault 2 Recovery Key** runs monthly at check-in on Macs with a
  valid key.

Needs the Fleet Foundation block, and a FileVault escrow profile on the Macs,
such as the one in the Mac Security block.
