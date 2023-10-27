$apps = @(
    @{name = "7zip.7zip" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "Git.Git" },
    @{name = "Google.Chrome" },
    @{name = "Greenshot.Greenshot" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "JetBrains.Toolbox" },
    @{name = "JohnMacFarlane.Pandoc" },
    @{name = "Microsoft.dotnet" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.PowerToys" },
    @{name = "Microsoft.SQLServerManagementStudio" }, 
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Microsoft.WindowsTerminal" },
    @{name = "Mozilla.Firefox.DeveloperEdition" },
    @{name = "Mozilla.Firefox" },
    @{name = "Notepad++.Notepad++" },
    @{name = "OpenJS.NodeJS.LTS" },
    @{name = "TimKosse.FileZilla.Client" },
    @{name = "VideoLAN.VLC" },
    @{name = "WiresharkFoundation.Wireshark"},
    @{name = "Insecure.Nmap" },
    @{name = "Microsoft.NuGet" },
    @{name = "angryziber.AngryIPScanner" },
    @{name = "Rufus.Rufus" },
    @{name = "Microsoft.AzureCLI" },   
    @{name = "OpenJS.NodeJS" },  
    @{name = "cURL.cURL" },   
    @{name = "Spotify.Spotify" },  
    @{name = "Yarn.Yarn" },
    @{name = "Obsidian.Obsidian" },
    @{name = "Cisco.WebexTeams" },
    @{name = "Python.Python.3.11" },
    @{name = "Microsoft.Edge" },
    @{name = "VMware.WorkstationPlayer" },
    @{name = "Microsoft.WindowsTerminal" }
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
