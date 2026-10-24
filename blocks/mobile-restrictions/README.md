# iPad and iPhone Restrictions

- **Restrictions**: a baseline for every managed device, a CIS Level 1
  set, and a stricter set for shared devices. Devices whose Restrictions
  attribute is set to Unassigned are left out.
- **Lock screen** information: the serial number, prefixed with `SHARED-`
  on shared devices.
- A **passcode** policy for one-to-one devices.
- **Software update deferral**.

Needs the Fleet Foundation block. It sets its own passcode policy, so do not
combine it with the Mobile Passcode block.
