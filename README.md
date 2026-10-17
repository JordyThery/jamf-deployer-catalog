# Jamf Deployer Catalog

The official building-block catalog for [Jamf Deployer](https://github.com/JordyThery/jamf-deployer): best-practice baselines for Jamf tenants, versioned by release tag.

## Using it

In Jamf Deployer, open **Building Blocks → Add Git Catalog…** and enter this repository's URL. The app pins each tenant to a release tag, so a published update never changes a tenant until you opt in (**Baseline Updates…** on the tenant).

## Blocks

| Block | Summary |
| --- | --- |
| Enrollment | Computer PreStage for Automated Device Enrollment |
| FileVault | FileVault with escrowed recovery keys, enforced at login |
| Software Updates | Declarative update settings via a Jamf Blueprint |
| Compliance — CIS Level 1 | CIS Level 1 benchmark, starting in monitor mode |
| Rosetta 2 | Rosetta 2 install script and check-in policy |
| App Catalog | Jamf App Catalog apps, picked in the app |
| Jamf Protect Baseline | Report-only endpoint-security starting point |
| Security Cloud | UEM Connect and a Mac activation profile |

The **Foundation** block (categories, device groups, extension attributes) ships inside the app itself — every baseline depends on it.

## Presets

- **Standard** — enrollment, FileVault, software updates, CIS Level 1 (monitor), Rosetta 2
- **Minimal** — foundation and software updates

## Format

Each block is a folder with a `block.json` manifest and the OpenTofu module that implements it. See [Building Blocks](https://github.com/JordyThery/jamf-deployer/blob/main/docs/building-blocks.md) for the format and how to publish a catalog of your own.

## License

MIT — see [LICENSE](LICENSE). Not affiliated with or endorsed by Jamf.
