# Deploy-to-Azure Button Generator (PowerShell)

Generates **Markdown** and **HTML** snippets for the "Deploy to Azure" button for an ARM template.  
**Output is via `Write-Host` only (no files are written).**

Read more at: [Use a deployment button to deploy remote templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-to-azure-button)

## Prerequisites

- PowerShell 5.1 or 7+
- Public raw URL to an ARM template (JSON), e.g. `https://raw.githubusercontent.com/...`

## Usage

    .\DeployToAzureButtonGen.ps1 -TemplateUrl "<RAW_TEMPLATE_URL>"

## Parameter

- `-TemplateUrl` (String, required): Direct link to the raw JSON file.

## Example

    .\DeployToAzureButtonGen.ps1 -TemplateUrl "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json"

## Console Output

**Markdown**

```powershell
    [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/<URL-ENCODED-TEMPLATE-URL>)
```

**HTML**

```powershell
    <a href="https://portal.azure.com/#create/Microsoft.Template/uri/<URL-ENCODED-TEMPLATE-URL>">
        <img src="https://aka.ms/deploytoazurebutton" alt="Deploy to Azure" />
    </a>
```

## Notes

- The template URL is URL-encoded internally (`[uri]::EscapeDataString`).
- If your script contains a hardcoded assignment to `$TemplateUrl`, remove it to allow the `-TemplateUrl` parameter to take effect.
