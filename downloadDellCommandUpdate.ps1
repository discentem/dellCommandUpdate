# (1) Disables firstrunCustomize for Internet Explorer
# (to prevent failure if IE hasn't ever been launched)
# ------------------------
$registryPath = "HKCU:\Software\Policies\Microsoft\Internet Explorer\Main\"
$Name = "DisablefirstrunCustomize"
$value = 1
# -force is needed in case the registry path doesn't exist
New-Item -Path $registryPath -Name $name -Value $value -force





# (2) Downloads latest Dell Command | Update
# ------------------------
# This link leads to a non-current version of Dell Command | Update. This way
#   we can grab a direct link to the latest version under "Other Versions"
#   and be future proof.
$oldDellCommandUpdate = "http://www.dell.com/support/home/us/en/19/Drivers/DriversDetails?driverId=FXD2R"


$version_list = (Invoke-WebRequest -Uri $base_url ) | Where innerText -like "*.*.*,A**"
#$latest_executable = $links | Where outerText -eq "Other Versions" | Select-Object
#$specific_url = $links | Where outerText -eq "Download File" | Select-Object -Expand href
#Invoke-WebRequest -Uri $specific_url -outFile "dellCommandUpdate.exe"
