$slug=Split-Path $PSScriptRoot -Leaf
$cobolcheck = Join-Path -Path "${HOME}" "cobolcheck" "cobolcheck.exe"
$cobolcheckCmd = Get-Command "cobolcheck.exe" -ErrorAction SilentlyContinue

if ($cobolcheckCmd) {
  $cobolcheck = $cobolcheckCmd.Path
  Write-Output "Found cobolcheck, using $cobolcheck"
} elseif (![System.IO.File]::Exists("$cobolcheck")){
  $fetchCobolcheckPath = Join-Path -Path "${PSScriptRoot}" "bin" "fetch-cobolcheck.ps1"
  echo $fetchCobolcheckPath
  Write-Output "Cobolcheck not found. Trying to fetch it."
  & "${fetchCobolcheckPath}"
}

Write-Output "Run cobolcheck."
Set-Location $PSScriptRoot

Invoke-Expression "$cobolcheck -p $slug"
Invoke-Expression "cobc -xj test.cob"

if ($Lastexitcode -ne 0) {
  exit $Lastexitcode
}
