$registryPath = "HKCU:\Software\Policies\Microsoft\Internet Explorer\Main\"
$Name = "DisablefirstrunCustomize"
$value = 1
# -force is needed in case the registry path doesn't exist
New-Item -Path $registryPath -Name $name -Value $value -force



$base_url = "http://www.dell.com/support/home/us/en/19/Drivers/DriversDetails?driverId=FXD2R"
$version_history = (Invoke-WebRequest -Uri $base_url )
$Latest = ($version_history.links | Where innerText -like "*.*.*,A**")[0]

$Latest_URL = "http://www.dell.com" + $Latest.href
$latest_executable = (Invoke-WebRequest $Latest_URL).links | Where outerText -eq "Download File"
Start-BitsTransfer -source $latest_executable.href -destination "."
