$slug=Split-Path $PSScriptRoot -Leaf
$cobolcheck = "$PSScriptRoot\bin\cobolcheck.exe"
$cobolcheckCmd = Get-Command "cobolcheck.exe" -ErrorAction SilentlyContinue

if ($cobolcheckCmd) {
  $cobolcheck = $cobolcheckCmd.Path
  Write-Output "Found cobolcheck, using $cobolcheck"
} elseif (![System.IO.File]::Exists("$cobolcheck")){
  Write-Output "Cobolcheck not found. Trying to fetch it."
  & "$PSScriptRoot\bin\fetch-cobolcheck.ps1"
}

Write-Output "Run cobolcheck."
Set-Location $PSScriptRoot

Invoke-Expression "$cobolcheck -p $slug"
Invoke-Expression "cobc -xj test.cob"

if ($Lastexitcode -ne 0) {
  exit $Lastexitcode
}
