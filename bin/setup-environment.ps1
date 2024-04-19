$gnucobolDir = "${env:GITHUB_WORKSPACE}\gnucobol"
$cobolcheckDir = "${env:GITHUB_WORKSPACE}\cobolcheck"
$env:Path = "${gnucobolDir}\bin;${cobolcheckDir};${env:Path}"
[System.Environment]::SetEnvironmentVariable('COB_CONFIG_DIR', "${gnucobolDir}\config")
[System.Environment]::SetEnvironmentVariable('COB_COPY_DIR', "${gnucobolDir}\copy")
[System.Environment]::SetEnvironmentVariable('COB_CFLAGS', "-I ${gnucobolDir}\include")
[System.Environment]::SetEnvironmentVariable('COB_LDFLAGS', "-L ${gnucobolDir}\lib")
[System.Environment]::SetEnvironmentVariable('COB_LIBRARY_PATH', "${gnucobolDir}\lib")
[System.Environment]::SetEnvironmentVariable('COB_LIBS', "${gnucobolDir}\bin\libcob-4.dll")
