# Hard-coded to build modelbuilder with truchas plugin

$ErrorActionPreference = "Stop"

# Generate package name and write to local file
$datecode = Get-Date -Format "yyMMdd"
$package_name = "modelbuilder-truchas-windows-$datecode"
Write-Output "using package name $package_name"
Set-Content -Path ./.package_name -Value $package_name -NoNewline

# Build docker images
docker build -f tools.dockerfile -t johnkit:cmb-win-tools -m 20g .
docker build -f base.dockerfile -t johnkit:cmb-truchas-win-base -m 20g --no-cache .
docker build -f paraview.dockerfile -t johnkit:cmb-truchas-win-paraview -m 20g --no-cache .
docker build -f smtk.dockerfile -t johnkit:cmb-truchas-win-smtk -m 20g --no-cache .
docker build -f projectmanager.dockerfile -t johnkit:cmb-truchas-win-projectmanager -m 20g --no-cache .
docker build -f truchas.dockerfile -t johnkit:cmb-truchas-win-truchas -m 20g --no-cache .
docker build -f cmb.dockerfile -t johnkit:cmb-truchas-win-modelbuilder -m 20g --no-cache .

# Remove any package file and extand container
$ErrorActionPreference = "Continue"
Remove-Item *.zip
docker container rm temp

# Create container so we can copy the package file
$ErrorActionPreference = "Stop"
docker create -it --name temp johnkit:cmb-truchas-win-modelbuilder powershell
docker cp temp:C:/Users/ContainerUser/build/cmb-superbuild/$package_name.zip . ; exit 0
docker container rm -f temp
