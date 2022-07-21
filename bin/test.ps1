function verify_exercise ($practiceExerciseDir) {
    $dir=[System.IO.Path]::GetFullPath($practiceExerciseDir)
    $slug=Split-Path $dir -Leaf
    $implementationFile="$dir/.meta/proof.ci.cob"
    $stubFile="$dir/src/$slug.cob"
    $stubBackupFile="$stubFile.bak"
    Copy-Item $stubFile -Destination $stubBackupFile
    Copy-Item $implementationFile -Destination $stubFile

    Invoke-Expression "$dir/test.ps1"

    if ($Lastexitcode -ne 0) {
        Write-Output $slug": proof solution did not pass the tests"
        exit 1
    }

    Copy-Item $stubBackupFile -Destination $stubFile
}

Get-ChildItem -Directory ./exercises/concept/ |
    ForEach-Object {
        Write-Output "Checking $_ exercise..."$_
        verify_exercise $_
    }
Get-ChildItem -Directory ./exercises/practice/ |
    ForEach-Object {
        Write-Output "Checking $_ exercise..."
        verify_exercise $_
    }