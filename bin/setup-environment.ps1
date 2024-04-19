$env:Path = "${env:GITHUB_WORKSPACE}\gnucobol\bin;${env:GITHUB_WORKSPACE}\bin;${env:Path}"
[System.Environment]::SetEnvironmentVariable('COB_CONFIG_DIR', "${env:GITHUB_WORKSPACE}\gnucobol\config")
[System.Environment]::SetEnvironmentVariable('COB_COPY_DIR', "${env:GITHUB_WORKSPACE}\gnucobol\copy")
[System.Environment]::SetEnvironmentVariable('COB_CFLAGS', "-I ${env:GITHUB_WORKSPACE}\gnucobol\include")
[System.Environment]::SetEnvironmentVariable('COB_LDFLAGS', "-L ${env:GITHUB_WORKSPACE}\gnucobol\lib")
[System.Environment]::SetEnvironmentVariable('COB_LIBRARY_PATH', "${env:GITHUB_WORKSPACE}\gnucobol\lib")
[System.Environment]::SetEnvironmentVariable('COB_LIBS', "${env:GITHUB_WORKSPACE}\gnucobol\bin\libcob-4.dll")
