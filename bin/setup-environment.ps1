$gnucobolDir = "${env:GITHUB_WORKSPACE}\gnucobol"
$env:Path = "$gnucobolDir\bin;${env:Path}"
[System.Environment]::SetEnvironmentVariable('COB_CONFIG_DIR', "${gnucobolDir}\config")
[System.Environment]::SetEnvironmentVariable('COB_COPY_DIR', "${gnucobolDir}\copy")
[System.Environment]::SetEnvironmentVariable('COB_CFLAGS', "-I ${gnucobolDir}\include")
[System.Environment]::SetEnvironmentVariable('COB_LDFLAGS', "-L ${gnucobolDir}\lib")
[System.Environment]::SetEnvironmentVariable('COB_LIBRARY_PATH', "${gnucobolDir}\lib")
[System.Environment]::SetEnvironmentVariable('COB_LIBS', "${gnucobolDir}\bin\libcob-4.dll")
