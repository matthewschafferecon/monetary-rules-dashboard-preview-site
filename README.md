# Viewing the monetary-rules dashboard locally

Double-click `view-dashboard.cmd`. It starts a local-only web server, opens the dashboard in the default browser, and displays the address:

`http://127.0.0.1:8765/`

Keep the launcher window open while viewing the dashboard. Press Enter in that window to stop the server.

The dashboard opens on the latest available rule-data vintage. Use the vintage
selector to inspect any of the 59 reconstructed quarterly observations, compare
each prescription with the prior vintage, and review its historical target range.
The selected vintage is marked on the historical chart, and the What changed?
panel decomposes each rule movement into its input contributions.
The historical chart can be exported as PNG or SVG, while the complete dashboard
dataset is available as an XLSX download. Equations, input definitions, and source-
vintage notes are collected in the expandable methodology drawer.

Meeting releases are also preserved as immutable public JSON snapshots in
`data/archive`. The archive manifest records each release's cutoff, source vintage,
effective FFR date, URL, and SHA-256 hash.

The **Copy link** control preserves the selected vintage, historical period, and
visible chart series in the URL. Opening that URL restores the same view.

For the latest vintage, the Current Prescriptions changes compare with the actual
estimates in the last published Monetary Rules Report. Historical-vintage views
continue to compare with the preceding rule-data vintage.

From PowerShell, the equivalent command is:

```powershell
.\serve.ps1
```

To choose another port:

```powershell
.\serve.ps1 -Port 9000
```
