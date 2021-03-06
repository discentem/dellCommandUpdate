### Purpose

These scripts download the latest version of `Dell Command | Update` from http://www.dell.com/support/home/us/en/19/drivers/driversdetails?driverId=X79N4 and in the future they will silently install it.

### Usage

#### downloadDellCommandUpdate.py (Note: this script is incomplete)

Written for Python3.

`python downloadDellCommandUpdate.py`

#### downloadDellCommandUpdate.ps1

Launch Powershell as an administrator.
Execute `set-executionpolicy bypass`. Select `[A] Yes to all`.
Navigate to the directoy where you downloaded/cloned this repository.
Execute `.\downloadDellCommandUpdate.ps1`. The installer will be downloaded in the same directory where the script lives.


### Description of Dell Command | Update

From http://www.dell.com/support/article/us/en/19/how10760/Dell_Command_%7C_Update:

> Dell Command | Update (DCU) is a Dell utility that allows you to automate driver, BIOS and firmware updates on your system. The Dell Command | Update tool allows you to keep your system up to date without you having to know every driver or update needed. It will automatically interrogate your system and compare it to the available updates on dell.com/support for your specific system.


### Future enhancements
- [x] ~~Change `$parent_url` to a page which contains a true listing of all DCU versions.~~
  - Shoutout to https://github.com/Gyrferret!!
- [ ] Write this into a salt module
- [ ] Silently install, as per:
  - http://www.dell.com/support/manuals/us/en/19/dell-command-update-v2.3/dcu_ug_2.3/silent-installation?guid=guid-72c8f511-c7a5-4729-bf86-f92837841289&lang=en-us
- [ ] Verify integrity of download
