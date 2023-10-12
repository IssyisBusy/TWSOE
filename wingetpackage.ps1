$apps = @(
    @{name = "7zip.7zip" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "Git.Git" },
    @{name = "Google.Chrome" },
    @{name = "Greenshot.Greenshot" },
    @{name = "Inkscape.Inkscape" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "JetBrains.Toolbox" },
    @{name = "JohnMacFarlane.Pandoc" },
    @{name = "Microsoft.dotnet" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.PowerToys" },
    @{name = "Microsoft.SQLServerManagementStudio" }, # Includes AzureDataStudio
    @{name = "Microsoft.VisualStudio.2022.Community" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Microsoft.WindowsTerminal" },
    @{name = "Mozilla.Firefox.DeveloperEdition" },
    @{name = "Mozilla.Firefox" },
    @{name = "NickeManarin.ScreenToGif" },
    @{name = "Notepad++.Notepad++" },
    @{name = "OpenJS.NodeJS.LTS" },
    @{name = "TimKosse.FileZilla.Client" },
    @{name = "VideoLAN.VLC" },
    @{name = "Zoom.Zoom" }
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
    }
    else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}
