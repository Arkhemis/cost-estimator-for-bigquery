Cost Estimator for BigQuery
===

A Firefox (and Zen, LibreWolf, other Gecko browsers) extension that shows the estimated cost of a query in the BigQuery console, before you run it.

When BigQuery displays *"This query will process 1.2 TB when run."*, the extension appends the estimated cost and relabels the button:

- `This query will process 1.2 TB when run (Estimated Cost: $7.50)`
- `RUN for $0.12`, or `⚠️ RUN for $7.50` above $0.60

This is an unofficial port. It is not affiliated with Google.

## Limitations

- The cost uses the on-demand list price of **$6.25 per TB**, hardcoded in `scripts/content.js`. It is wrong if your project uses capacity (slot) pricing, a negotiated rate, or has free tier left.
- It matches the English message only. With the console in another language, nothing is shown.

## Install

Download the signed `.xpi` from the [releases](https://github.com/Arkhemis/cost-estimator-for-bigquery/releases), then open `about:addons` → ⚙️ → *Install Add-on From File…*.

On first use, Firefox may ask you to allow the extension on `console.cloud.google.com` (Manifest V3 host permissions).

## Build

```sh
make package
```

produces `package.zip`, ready to upload to [AMO](https://addons.mozilla.org/developers/) for signing. There is no build step: the files are shipped as-is.

## Credits

- [BigQuery Cost Estimator](https://github.com/carmignanivittorio/BigQuery-Cost-Estimator) by Vittorio Carmignani, the original extension and the repository this one is forked from.
- [BigQuery Easy](https://chromewebstore.google.com/detail/bigquery-easy/celfclgjkbhkankkndefbmfphedkdidj) by Anthony Fernandez (marshallino16), which added the RUN button label. Version 5.0.1 is the base of this port.

## Changes

Modified from BigQuery Easy 5.0.1 on 2026-09-29:

- Renamed to *Cost Estimator for BigQuery*.
- Removed the background script and the `scripting` permission (it injected a file path that does not exist; the declared content script does the work).
- Added `browser_specific_settings.gecko` for Firefox and AMO signing.
- Resized the icons to true 16×16, 48×48 and 128×128 squares.
- Set the RUN button label with `textContent` instead of `innerHTML`.
- Added a `Makefile` to build the package.

## License

GNU General Public License v3.0, see [LICENSE](LICENSE).
