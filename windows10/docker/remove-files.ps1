# Because rm -rf doesn't reliably work in powershell (really)
param ($RemovePath = $(throw"RemovePath parameter is required."))

Get-ChildItem -Path $RemovePath -Recurse -Force `
| Sort-Object -Property FullName -Descending `
| ForEach-Object {
    # Keep any CMakeCache files for debugging
    if ($_.ToString() -ne "CMakeCache.txt") {
        try {
            Remove-Item -Path $_.FullName -Force -ErrorAction Stop;
        }
        catch {}
    }
}
