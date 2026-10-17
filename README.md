# Jamf Deployer Demo Catalog

A demo building-block catalog for [Jamf Deployer](https://github.com/JordyThery/jamf-deployer): a worked example of a best-practice baseline, versioned by release tag. Use it to evaluate the app and as the reference for **publishing a catalog of your own** — for real fleets, your own catalog (private or public) is the intended setup.

## Using it

In Jamf Deployer, the Building Blocks library offers this catalog on first visit, or add any catalog repository via **Add Git Catalog…**. The app pins each tenant to a release tag, so a published update never changes a tenant until you opt in (**Baseline Updates…** on the tenant).

## Blocks

| Block | Summary |
| --- | --- |
| Device Groups | Pilot (static) plus smart groups for all Macs, laptops, desktops and Apple silicon |
| Categories | Applications, Enrollment, Maintenance and Security |
| Extension Attributes | Baseline Marker and Deployment Ring |
| Enrollment | Computer PreStage for Automated Device Enrollment |
| FileVault | FileVault with escrowed recovery keys, enforced at login |
| Software Updates | Declarative update settings via a Jamf Blueprint |
| Compliance — CIS Level 1 | CIS Level 1 benchmark, starting in monitor mode |
| Rosetta 2 | Rosetta 2 install script and check-in policy |
| Check-in & Inventory | Check-in frequency, startup and login policies, inventory collection |
| Re-enrollment | What Jamf Pro clears when a Mac enrolls again |
| Local Admin Password Rotation | Scheduled rotation, and rotation after a password is viewed |
| Self Service App | Installs Self Service everywhere; landing page and notifications |
| Self Service Maintenance | "Update inventory" and "Flush DNS cache" Self Service items |
| macOS Version Groups | Smart groups for Macs on current macOS and Macs below your minimum |

The four settings blocks (check-in, re-enrollment, local admin passwords, Self Service app) set tenant-wide settings. A setting can belong to one block only, and removing such a block keeps the current values in Jamf.

These blocks carry configuration opinions, which is exactly why they live in a catalog: your organization's FileVault or update policy — or its group and category layout — should come from **your** catalog, not from an app. The connector-style blocks that carry no configuration of their own — **App Catalog**, **Jamf Protect Baseline** and **Security Cloud** — ship inside the app.

## How blocks connect

Every block is optional. A block that applies to a group or files objects under a category lets you pick, per tenant, one created by another selected block or, for Jamf Pro groups and categories, one that already exists in Jamf. Platform-scoped blocks (Software Updates, CIS Level 1) use a group another selected block creates. **Device Groups** and **Categories** create the usual ones, and the other blocks here default to them when both are selected — FileVault to Pilot and Security, Rosetta 2 to Apple Silicon Macs and Applications. In a block's `block.json`, a default reads `"device-groups/Pilot"`: the providing block's ID and the object's name from its `provides` list.

## Presets

- **Minimal** — device groups, categories and software updates
- **Standard** — device groups, categories, extension attributes, enrollment, FileVault, software updates, CIS Level 1 (monitor), Rosetta 2
- **Complete** — everything in the catalog

## Publishing your own catalog

A catalog is a repository with `catalog.json` at the root, one folder per block under `blocks/` (a `block.json` manifest plus the OpenTofu module), optional `presets/`, and release tags. Fork or copy this repository, replace the blocks with yours, tag a release, and add it in the app. Capturing objects from a tenant in Jamf Deployer produces blocks in exactly this format. See [Building Blocks](https://github.com/JordyThery/jamf-deployer/blob/main/docs/building-blocks.md).

## License

MIT — see [LICENSE](LICENSE). Not affiliated with or endorsed by Jamf.
