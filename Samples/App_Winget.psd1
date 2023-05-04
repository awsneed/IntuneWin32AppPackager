@{
    PackageInformation = @{
        # Whether the app uses a .exe or a .msi installer
        SetupType = 'EXE'
        <# Valid values
            MSI
            EXE
        #>

        # Top-level directory containing all the files the app's installer needs
        SourceFolder = 'Source'

        # Path to the app's installer, relative to the SourceFolder path
        SetupFile = 'install.ps1'

        # Directory to store the .intunewin in
        OutputFolder = 'Package'

        # Path to an icon to display for the app in Intune, relative to Create-IntuneWin32App.ps1's directory
        IconFile = 'Icon.png'
    }

    Information = @{
        # Display name of the app for Intune / Company Portal
        DisplayName = ''

        # Description of the app. Supports Markdown formatting and newlines with `n
        Description = ""

        # Publisher of the app
        Publisher = ''

        # Notes for other admins in Intune. Supports newlines with `n
        Notes = ""

        # Scope tags to assign to the app. You must have permission to use any tags specified, and your org may
        # require at least one to be specified.
        ScopeTagNames = @(
            '<Scope Tag 1>'
            '<Scope Tag 2>'
            '<Scope Tag 3>'
        )
    }

    Program = @{
        # Install command used by Intune. Only required for SetupType of EXE.
        InstallCommand = 'powershell.exe -ExecutionPolicy Bypass -File .\Install.ps1'

        # Uninstall command used by Intune. Only required for SetupType of EXE.
        UninstallCommand = 'powershell.exe -ExecutionPolicy Bypass -File .\Uninstall.ps1'

        # Whether to install the app system-wide or per-user
        InstallExperience = 'System'

        # Set how restarts are handled for the install of this app
        DeviceRestartBehavior = 'Suppress'
        <# Valid values
            Suppress - Stop any installer-initiated restarts
            Force - Intune will force a restart after installation
            BasedOnReturnCode
            Allow - Allows app installers to initiate a restart
        #>
    }

    RequirementRule = @{
        # Minmum version of Windows the app can be installed on.
        MinimumSupportedWindowsRelease = 'W10_1607'
        <# Valid values
            W10_1607
            W10_1703
            W10_1709
            W10_1803
            W10_1809
            W10_1903
            W10_1909
            W10_2004
            W10_20H2
            W10_21H1
            W10_21H2
            W10_22H2
            W11_21H2
            W11_22H2
        #> 
        Architecture = 'All'
    }

    CustomRequirementRule = @{}
    DetectionRule = @(
        @{
            # Example

            Type = 'Script'
            ScriptFile = "detection.ps1"
            EnforceSignatureCheck = $false
            RunAs32Bit = $false
        }
    )

    TenantInformation = @{
        # The site's Intune tenant ID
        TenantID = '00000000-0000-0000-0000-000000000000'

        # Application ID with which to access Graph with; it will need the appropriate permissions granted to it
        ClientID = '00000000-0000-0000-0000-000000000000'
    }
}
