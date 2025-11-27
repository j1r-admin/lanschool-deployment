# LanSchool Deployment Usage Guide

## Overview
This guide explains how to configure and use the LanSchool Student deployment script with Group Policy in a Windows 11 environment. It covers script customization, channel assignment, and best practices for Group Policy deployment.

## 1. Script Configuration

### Set the Channel Number
- Open `LanSchool.bat` in a text editor.
- Set the `CHANNEL` variable to match your room, using the channel numbering convention (see project documentation).
  - Example for room H3:
    ```bat
    SET CHANNEL=803
    ```

### Save and distribute the customized script for each room as needed.

## 2. Group Policy Deployment

### Naming Convention
- Use the following naming convention for your Group Policy Objects (GPOs):
  - `[Software Installation] LanSchool <Room>`
  - Example: `[Software Installation] LanSchool H3`

### Steps to Deploy via Group Policy
1. **Open Group Policy Management Console (GPMC):**
   - On your domain controller, run `gpmc.msc`.
2. **Create a New GPO:**
   - Right-click the appropriate OU (Organizational Unit) and select "Create a GPO in this domain, and Link it here..."
   - Name the GPO using the convention above.
3. **Edit the GPO:**
   - Right-click the new GPO and select "Edit".
   - Navigate to: `Computer Configuration > Policies > Windows Settings > Scripts (Startup/Shutdown)`
   - Double-click "Startup", then click "Add..."
   - Browse to and select your customized `LanSchool.bat` script.
4. **Ensure Script Accessibility:**
   - The script and MSI must be accessible to all target computers (use a UNC path).
5. **Apply and Close:**
   - Click OK to save changes and close the GPO editor.
6. **Force Group Policy Update (optional):**
   - On a target machine, run `gpupdate /force` to apply the new policy immediately.

## 3. Best Practices
- Use a separate GPO for each room.
- Double-check the `CHANNEL` variable for each script to avoid channel conflicts.
- Keep a record of channel assignments and GPO names for troubleshooting.
- Monitor `C:\LanSchoolInstall.log` on client machines for installation results.
- Ensure scripts are run with sufficient privileges (machine startup, not user logon).

## 4. Troubleshooting
- If installation fails, check:
  - Network connectivity to the MSI share
  - Permissions on the script and MSI files
  - The log file at `C:\LanSchoolInstall.log`
  - That the script is running as a startup script (not logon)

## References
- [LanSchool Mass Deployment Documentation](https://helpdesk.lanschool.com/portal/en/kb/articles/mass-deploying-lanschool-student-for-windows)
- [Microsoft: Group Policy Startup Scripts](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/startup-scripts)

---

For further assistance, contact your IT administrator or refer to the technical documentation in this repository.
