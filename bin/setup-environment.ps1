Get-Command "cobc" -ErrorAction SilentlyContinue
Get-Command "cobc.exe" -ErrorAction SilentlyContinue
ls ${env:GITHUB_WORKSPACE}
ls ${env:GITHUB_WORKSPACE}\bin
ls ${env:GITHUB_WORKSPACE}\gnucobol
ls ${env:GITHUB_WORKSPACE}\gnucobol\bin
$env:Path = "${env:GITHUB_WORKSPACE}\gnucobol\bin;${env:GITHUB_WORKSPACE}\bin;${env:Path}"
printenv
[System.Environment]::SetEnvironmentVariable('COB_CONFIG_DIR', "${gnucobolDir}\config")
[System.Environment]::SetEnvironmentVariable('COB_COPY_DIR', "${gnucobolDir}\copy")
[System.Environment]::SetEnvironmentVariable('COB_CFLAGS', "-I ${gnucobolDir}\include")
[System.Environment]::SetEnvironmentVariable('COB_LDFLAGS', "-L ${gnucobolDir}\lib")
[System.Environment]::SetEnvironmentVariable('COB_LIBRARY_PATH', "${gnucobolDir}\lib")
[System.Environment]::SetEnvironmentVariable('COB_LIBS', "${gnucobolDir}\bin\libcob-4.dll")
