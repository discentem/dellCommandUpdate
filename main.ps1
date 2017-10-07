# Disables firstrunCustomize for Internet Explorer
# (to prevent failure if IE hasn't ever been launched)
# ------------------------
$registryPath = "HKCU:\Software\Policies\Microsoft\Internet Explorer\Main\"
$Name = "DisablefirstrunCustomize"
$value = 1
# -force is needed in case the registry path doesn't exist
New-Item -Path $registryPath -Name $name -Value $value -force


# Downloads latest Dell Command | Update
# ------------------------
$parent_url = "http://www.dell.com/support/home/us/en/19/drivers/driversdetails?driverId=X79N4"
$links = (Invoke-WebRequest -Uri $parent_url ).Links
$specific_url = $links | Where outerText -eq "Download File" | Select-Object -Expand href
Invoke-WebRequest -Uri $specific_url -outFile "dellCommandUpdate.exe"
