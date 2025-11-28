# LanSchool Deployment Technical Documentation

## Overview
This project provides a batch script and supporting documentation for the automated, unattended deployment of the LanSchool Student client to Windows 11 computers in a classroom or lab environment. The deployment is designed to be executed via Group Policy or similar machine-based automation tools.

## Components
* **LanSchool.bat**: Main batch script for installing the LanSchool Student client.
* **README.md**: User-facing documentation for setup, usage, and channel numbering.
* **installation-overview.md**: High-level summary of the deployment process and options.

## Script Logic
1. **Channel Assignment**
   - The script uses a `CHANNEL` variable to assign each room a unique channel number, based on the room's letter and number (see README for formula).
2. **Installation Check**
   - Checks if the LanSchool Student client is already installed by verifying the presence of `C:\Program Files (x86)\LanSchool\student.exe`.
3. **Silent Installation**
   - If not installed, runs `msiexec.exe` with the following options:
     - `/i "\\sccm2\deployment\Software\LanSchool-GPO-Files\Student.msi"` — UNC path to the MSI
     - `/qn` — Quiet mode (no UI)
     - `ADVANCED_OPTIONS=1` — Enables advanced configuration
     - `STEALTH_MODE=1` — Hides the LanSchool icon
     - `NO_KEYBOARD_MONITORING_MODE=1` — Disables keystroke monitoring
     - `NO_INTERNET_MONITORING_MODE=1` — Disables internet history monitoring
     - `CHANNEL=<channel>` — Sets the classroom channel
     - `LCS=192.168.254.20` — Sets the LanSchool Connection Service IP
4. **Logging**
   - Logs both success and failure to `C:\LanSchoolInstall.log`, suppressing errors on log file creation.

## Deployment Workflow
1. Set the `CHANNEL` variable in `LanSchool.bat` for each room.
2. Deploy the script as a machine startup script using Group Policy or similar tools.
3. The script will install the LanSchool Student client if not already present and log the result.

## Best Practices
- Use absolute paths for all file and network locations.
- Run the script as SYSTEM or with administrator privileges for full access.
- Maintain a backup of the original script for reference.
- Document channel assignments for each room to avoid conflicts.

## Troubleshooting
- Check `C:\LanSchoolInstall.log` for installation results and errors.
- Ensure network connectivity to the MSI location (`\\sccm2\deployment\Software\LanSchool-GPO-Files\Student.msi`).
- Verify the `CHANNEL` variable is set correctly for each deployment group.
- Confirm the script is running with sufficient privileges.

## Security & Privacy
- The script disables keystroke and internet monitoring for student privacy.
- Stealth mode hides the LanSchool icon from students.
- Only the Student client is installed; teacher logic has been removed for clarity and security.

## References
- [LanSchool Mass Deployment Documentation](https://helpdesk.lanschool.com/portal/en/kb/articles/mass-deploying-lanschool-student-for-windows)
- [Microsoft: Group Policy Startup Scripts](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/startup-scripts)

---

For further customization or advanced deployment scenarios, see the official LanSchool documentation or contact your IT administrator.
