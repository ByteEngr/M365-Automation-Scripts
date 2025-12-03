<#
.SYNOPSIS
Assigns a Microsoft 365 license to a user.

#>

Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Identity.DirectoryManagement

Connect-MgGraph -Scopes "User.ReadWrite.All","Directory.ReadWrite.All"

$UPN = Read-Host "Enter UserPrincipalName"
$Sku = Read-Host "Enter SKU ID (e.g. ENTERPRISEPACK)"

$license = @{
    addLicenses = @(@{ skuId = $Sku })
    removeLicenses = @()
}

Set-MgUserLicense -UserId $UPN -BodyParameter $license

Write-Host "License $Sku assigned to $UPN." -ForegroundColor Green
