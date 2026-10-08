# Viewing the monetary-rules dashboard locally

Double-click `view-dashboard.cmd`. It starts a local-only web server, opens the dashboard in the default browser, and displays the address:

`http://127.0.0.1:8765/`

Keep the launcher window open while viewing the dashboard. Press Enter in that window to stop the server.

The dashboard opens on the latest available estimate without a historical selector.
The **Published benchmarks** view contains the benchmark selector and distinguishes
a provisional estimate recalculated from newer original-source observations from
the frozen quarterly vintages used for reports, citations, and downloadable
workbooks. When no newer provisional estimate exists, the latest estimate and most
recent published benchmark are the same. Use the benchmark selector to inspect any
of the 59 reconstructed quarterly observations, compare each rule
benchmark with the prior snapshot, and review its historical target range. The
Latest estimate view's **Data as of** date follows the freshest verified current
information displayed, normally the latest available New York Fed EFFR observation;
the technical-methodology drawer retains the separate rule-input dates.
current lollipop chart and model table show the six Federal Reserve neutral-rate
variants by default; **Show alternate neutral-rate estimates** reveals the six New
York Fed model variants. The selected snapshot is marked on the historical chart,
and the change panel decomposes each rule movement into its input contributions.
The historical chart can be exported as PNG or SVG, while the complete dashboard
dataset is available as an XLSX download. It opens to a five-year view with the
actual effective federal funds rate, Modified Taylor rule, and nominal GDP level
rule visible. Equations, input definitions, and source details are collected in
the expandable technical-methodology drawer.

Meeting releases are also preserved as immutable public JSON snapshots in
`data/archive`. The archive manifest records each release's cutoff, source vintage,
effective FFR date, URL, and SHA-256 hash.

The **Copy link** control preserves the selected vintage, historical period, and
visible chart series in the URL. Opening that URL restores the same view.

For the latest snapshot, the model-table changes compare with the actual
estimates in the last published Monetary Rules Report. Historical snapshot views
continue to compare with the preceding quarterly snapshot.

From PowerShell, the equivalent command is:

```powershell
.\serve.ps1
```

To choose another port:

```powershell
.\serve.ps1 -Port 9000
```
