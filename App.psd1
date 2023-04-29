@{
    PackageInformation = @{
        # Whether the app uses a .exe or a .msi installer
        SetupType = ''
        <# Valid values
            MSI
            EXE
        #>

        # Top-level directory containing all the files the app's installer needs
        SourceFolder = 'Source'

        # Path to the app's installer, relative to the SourceFolder path
        SetupFile = ''

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
            ''
            ''
            ''
        )
    }

    Program = @{
        # Install command used by Intune. Only required for SetupType of EXE.
        InstallCommand = '< Only required for SetupType of EXE >'

        # Uninstall command used by Intune. Only required for SetupType of EXE.
        UninstallCommand = '< Only required for SetupType of EXE >'

        # Whether to install the app system-wide or per-user
        InstallExperience = '< System | User >'

        # Set how restarts are handled for the install of this app
        DeviceRestartBehavior = ''
        <# Valid values
            Suppress - Stop any installer-initiated restarts
            Force - Intune will force a restart after installation
            BasedOnReturnCode
            Allow - Allows app installers to initiate a restart
        #>
    }

    RequirementRule = @{
        # Minmum version of Windows the app can be installed on.
        MinimumSupportedWindowsRelease = '< ... >'
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
        Architectures = '< All | x64 | x86 >'
    }

    CustomRequirementRule = @{}
    DetectionRule = @(
        @{
            # Example

            Type = 'Registry'
            DetectionMethod = 'VersionComparison'
            KeyPath = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\123'
            ValueName = 'DisplayVersion'
            Operator = 'GreaterThanOrEqual'
            Value = '1.0.0'
            Check32BitOn64System = $false
        }
        @{
            # Example

            Type = 'Registry'
            DetectionMethod = 'Existence'
            KeyPath = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\123'
            ValueName = 'DisplayVersion'
            DetectionType = 'exists'
            Check32BitOn64System = $false
        }
        @{
            # Example

            Type = 'MSI'
            ProductCode = '<guid>'
            ProductVersionOperator = 'notConfigured'
        }
        @{
            # Example

            Type = 'Script'
            ScriptFile = 'detection.ps1'
            EnforceSignatureCheck = $false
            RunAs32Bit = $false
        }
    )

    TenantInformation = @{
        # The site's Intune tenant ID
        TenantID = ''

        # Application ID with which to access Graph with; it will need the appropriate permissions granted to it
        ClientID = ''
    }
}
