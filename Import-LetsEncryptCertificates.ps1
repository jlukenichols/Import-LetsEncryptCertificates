<#
    # Last updated 2024-08-01.1556
    # Author: Luke Nichols
#>

#Requires -RunAsAdministrator

### Begin Variables ###

# To be assigned by the user

$PathToRootCertificatesFolder = "$PSScriptRoot\certificates\root"
$PathToIntermediateCertificatesFolder = "$PSScriptRoot\certificates\intermediate"

### End Variables ###

### Begin Modules ###

# No modules :(

### End Modules ###

### Begin Functions ###

# No functions :(

### End Functions ###

### Begin Constants ###

# Don't screw with these unless you know what you are doing

### End Constants ###

### Begin Main Script Body ###

Write-Host "This script requires administrator permissions. If you did not run this as administrator, please close now and run it as administrator."
pause

# Find all certificates in root folder and import them
Foreach ($Certificate in Get-ChildItem ($PathToRootCertificatesFolder)) {
    #$Certificate
    Import-Certificate -FilePath "$PathToRootCertificatesFolder\$($Certificate.Name)" -CertStoreLocation "Cert:\LocalMachine\Root"
}

# Find all certificates in intermediate folder and import them
Foreach ($Certificate in Get-ChildItem ($PathToIntermediateCertificatesFolder)) {
    #$Certificate
    Import-Certificate -FilePath "$PathToIntermediateCertificatesFolder\$($Certificate.Name)" -CertStoreLocation "Cert:\LocalMachine\CA"
}

### End Main Script Body ###

break
exit