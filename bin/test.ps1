Get-ChildItem -Directory ./exercises/concept/ |
    ForEach-Object {
        Write-Output "Checking $_ exercise..."$_
        & "$_/test.ps1"
    }
Get-ChildItem -Directory ./exercises/practice/ |
    ForEach-Object {
        Write-Output "Checking $_ exercise..."
        & "$_/test.ps1"
    }