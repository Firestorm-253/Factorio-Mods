# copy-mods.ps1

# Stop on errors
$ErrorActionPreference = 'Stop'

# Paths
$srcDir  = Join-Path $PSScriptRoot '../src'
$distDir = Join-Path $PSScriptRoot '../dist'

# Create dist folder if it doesn't exist
if (-Not (Test-Path $distDir)) {
    New-Item -ItemType Directory -Path $distDir | Out-Null
}

# Process each mod
Get-ChildItem $srcDir -Directory | ForEach-Object {
    $modName  = $_.Name
    $modPath  = $_.FullName
    $infoFile = Join-Path $modPath 'info.json'

    if (-Not (Test-Path $infoFile)) {
        Write-Warning "Skipping $modName -> no info.json"
        return
    }

    # Read version
    $info    = Get-Content $infoFile -Raw | ConvertFrom-Json
    $version = if ($info.version) { $info.version } else { 'unknown' }

    # Build names/paths
    $destName = "$modName`_$version"
    $zipPath  = Join-Path $distDir "$destName.zip"

    # If Zip already exists, skip
    if (Test-Path $zipPath) {
        Write-Host "Skipping " -NoNewline
        Write-Host $destName -ForegroundColor Yellow -NoNewline
        Write-Host " -> already zipped.`n"
        return
    }

    # Create temp folder
    $tempPath = Join-Path $distDir $destName
    Copy-Item $modPath $tempPath -Recurse -Force

    # Zip the temp folder
    Compress-Archive -Path (Join-Path $tempPath '*') -DestinationPath $zipPath
    Write-Host "Zipped -> dist\" -NoNewline
    Write-Host $destName -ForegroundColor Yellow -NoNewline
    Write-Host ".zip"

    # Remove temp folder
    Remove-Item $tempPath -Recurse -Force
}
