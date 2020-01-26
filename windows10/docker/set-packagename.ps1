# Check for .package_name file
if (Test-Path .package_name) {
    $package_name = Get-Content -Path ./.package_name
    echo "Using package name $package_name"
}
else {
    $datecode = Get-Date -Format "yyMMdd"
    $package_name = "modelbuilder-truchas-Windows-$datecode"
    echo "Created package name $package_name"
}

# Rerun cmake
cmake -DCMB_PACKAGE_FILE_NAME:STRING=${package_name} .
