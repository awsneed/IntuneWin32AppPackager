# IntuneWin32AppPackager Framework Overview
This project aims at making it easier to package, create and at the same time document Win32 applications for Microsoft Intune. A manifest file name App.json needs to be configured to control how the application is created. Configurations such as application name, description, requirement rules, detection roles and other is defined within the manifest file. Create-Win32App.ps1 script file is used to start the creation of the application, based upon configuration specified in the manifest file, App.json.

# File and folder structure
For each application that has to be packaged as a Win32 app, a specific application folder should be created with the IntuneWin32AppPackager files and folder residing inside it. Below is an example of how the folder structure could look like:

- Root
  - Application 1.0.0 (Folder where the IntuneWin32AppPackager is contained within)
    - Package (Folder)
    - Source (Folder)
    - Scripts (Folder)
    - Create-Win32App.ps1
    - Icon.png
    - App.json

## Package folder
A required folder where the packaged .intunewin file will be created in after execution of Create-Win32App.ps1.

## Source folder
A required folder that must contain the source files, meaning everything that's supposed to be packaged as a .intunewin file, else the packaging will fail if empty.

## Scripts folder
Use this folder for any custom created scripts used for either Requirement Rules or Detection Rules. This folder is only required when such custom script files are used.

## Create-Win32App.ps1 script
Main framework script that packages, retrieves the required information from the manifest file and constructs necessary objects that are passed on to Add-IntuneWin32App function from the IntuneWin32App module. This script has a -Validate switch that can be used to validate the manifest file configuration, which results in that the configuration is written as output to the console instead of creating a new Win32 application.

# First things first
Using this Win32 application packaging framework requires the IntuneWin32App module, minimum version 1.2.0, to be installed on the device where it's executed. Install the module from the PSGallery using:
```PowerShell
Install-Module -Name IntuneWin32App
```

# Manifest configuration (App.json)
Bla bla...

## PackageInformation
This section is used to 

```Json
"PackageInformation": {
    "SetupType": "MSI",
    "SetupFile": "7z1900-x64.msi",
    "SourceFolder": "Source",
    "OutputFolder": "Package",
    "IconFile": "Icon.png"
}
```

## Detection Rule sample

```Json
{
    "Type": "Registry",
    "DetectionMethod": "VersionComparison",
    "KeyPath": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\123",
    "ValueName": "DisplayVersion",
    "Operator": "greaterThanOrEqual",
    "Value": "1.0.0",
    "Check32BitOn64System": "false"
}
```

## MSI Example manifest

```Json
{
    "PackageInformation": {
        "SetupType": "MSI",
        "SetupFile": "7z1900-x64.msi",
        "SourceFolder": "Source",
        "OutputFolder": "Package",
        "IconFile": "Icon.png"
    },
    "Information": {
        "DisplayName": "7-Zip 19.0 x64",
        "Description": "Install 7-Zip archive compression application",
        "Publisher": "7-Zip",
        "Notes": "Core application"
    },
    "Program": {
        "InstallExperience": "system",
        "DeviceRestartBehavior": "suppress"
    },
    "RequirementRule": {
        "MinimumRequiredOperatingSystem": "1809",
        "Architecture": "x64"
    },
    "CustomRequirementRule": [
    ],
    "DetectionRule": [
        {
            "Type": "MSI",
            "ProductCode": "{23170F69-40C1-2702-1900-000001000000}",
            "ProductVersionOperator": "notConfigured",
            "ProductVersion": ""
        }
    ],
    "TenantInformation": {
        "Name": "tenant.onmicrosoft.com",
        "PromptBehavior": "Auto",
        "ApplicationID": "d1ddf0e4-d672-4dae-b554-9d5bdfd93547"
    }
}
```