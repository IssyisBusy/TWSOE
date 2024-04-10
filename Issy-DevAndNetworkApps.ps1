Write-Output "Installing Apps"
$apps = @(
    @{name = "OpenJS.NodeJS" },
    @{name = "dotPDNLLC.paintdotnet" },
    @{name = "Famatech.AdvancedIPScanner" },
    @{name = "Git.Git" },
    @{name = "AutoHotkey.AutoHotkey" },
    @{name = "Insecure.Nmap" },
    @{name = "Insecure.Npcap" },
    @{name = "WiresharkFoundation.Wireshark" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "GitHub.GitHubDesktop" },
    @{name = "JohnMacFarlane.Pandoc" },
    @{name = "OpenJS.NodeJS" },
    @{name = "Famatech.AdvancedIPScanner" },
    @{name = "Git.Git" }
    @{name = "Insecure.Nmap" },
    @{name = "Insecure.Npcap" },
    @{name = "WiresharkFoundation.Wireshark" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "RingCentral.RingCentral" },
    @{name = "Microsoft.NuGet" },
    @{name = "Obsidian.Obsidian" }
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
