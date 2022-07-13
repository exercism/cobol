if (![System.IO.File]::Exists("$PSScriptRoot/bin/cobolcheck.exe")){
  Write-Output "Cobolcheck not found, try to fetch it."
  & "$PSScriptRoot/bin/fetch-cobolcheck.ps1"
}

Write-Output "Run cobolcheck."
cd $PSScriptRoot

Invoke-Expression "bin/cobolcheck.exe -p hello-world"
    
if ($Lastexitcode -ne 0) {
  exit $Lastexitcode
}
