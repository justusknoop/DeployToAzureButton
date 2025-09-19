<#
    .SYNOPSIS
        Generates an "Deploy to Azure" button for an ARM template.
    .DESCRIPTION
        This script takes the URL of an ARM template and generates a markdown snippet for a "Deploy to Azure" button.
    .PARAMETER TemplateUrl
        The URL of the ARM template to deploy.  This should be a direct link to the raw JSON file.      
    .EXAMPLE
        .\DeployToAzureButtonGen.ps1 -TemplateUrl "https://raw.githubusercontent.com..."
    .NOTES
        Author: Justus Knoop
        Date: 2025-09-19
        Purpose: Generate "Deploy to Azure" button snippets for ARM templates

#>

params(
    # URL of the ARM template to deploy
    [Parameter(Mandatory=$true)]
    [string]$TemplateUrl,

    # Output file for the generated markdown snippet
    [Parameter(Mandatory=$false)]
    [string]$OutputFile
)


$TemplateUrl = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json"
$TemplateUri = [uri]::EscapeDataString($TemplateUrl)



# Generate the markdown snippet
$MarkdownSnippet = @"
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/$TemplateUri)
"@

# generate html snippet
$HtmlSnippet = @"
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/$TemplateUri">
    <img src="https://aka.ms/deploytoazurebutton" alt="Deploy to Azure" />
</a>
"@  

Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Write-Host "Generated Markdown Snippet:"
Write-Host ""
Write-Host $MarkdownSnippet -ForegroundColor GREEN
Write-Host ""
Write-Host ""
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Write-Host "Generated HTML Snippet:"
Write-Host ""
Write-Host $HtmlSnippet -ForegroundColor GREEN
Write-Host ""
Write-Host ""


<# Future feature: Azure DevOps

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fdev.azure.com%2Forgname%2Fprojectname%2F_apis%2Fgit%2Frepositories%2Freponame%2Fitems%3FscopePath%3D%2freponame%2fazuredeploy.json%26api-version%3D6.0)

#>
