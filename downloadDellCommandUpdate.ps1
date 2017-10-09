$base_url = "http://www.dell.com/support/home/us/en/19/Drivers/DriversDetails?driverId=FXD2R"
$version_history = (Invoke-WebRequest -Uri $base_url )
$Latest = ($version_history.links | Where innerText -like "*.*.*,A**")[0]

$latest

$Latest_URL = "http://www.dell.com" + $Latest.href
$latest_executable = (Invoke-WebRequest $Latest_URL).links | Where outerText -eq "Download File"
Start-BitsTransfer -source $latest_executable.href -destination "."
