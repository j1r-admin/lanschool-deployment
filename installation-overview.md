# LanSchool Student for Windows: Mass Deployment Overview

## 1. Download the MSI Installer
- Use the `student.msi` installer for deployment.

## 2. Command-Line Deployment
- Deploy using a tool like Group Policy, SCCM, or PDQDeploy.
- Example silent install command:
  ```
  msiexec.exe /i "student.msi" /qn ADVANCED_OPTIONS=1 SECURE_MODE=1 PASSWORD=test PASSWORD_CONFIRM=test CHANNEL=3 LCS=192.168.2.3
  ```
  - Replace values as needed:
    - `CHANNEL`: Teacher channel (1-16000)
    - `LCS`: IP address of LanSchool Connection Service
    - `SECURE_MODE`, `PASSWORD`, `PASSWORD_CONFIRM`: For password-secured deployments
    - Other options available for advanced configuration (see below).

## 3. Common Parameters
- `STEALTH_MODE=1`: Hide LanSchool icon on student device.
- `NO_KEYBOARD_MONITORING_MODE=1`: Do not capture keystrokes.
- `NO_INTERNET_MONITORING_MODE=1`: Do not capture internet history.
- `INSTALL_CHROME_EXTENSION=1`: Install Chrome extension for web limiting.
- `INSTALL_EDGE_EXTENSION=1`: Install Edge extension for web limiting.
- Many more options are available for fine-tuning deployment.

## 4. Deploying Browser Extensions via Group Policy
- **Chrome**:  
  - Use GPO: `User Configuration > Administrative Templates > Google > Google Chrome > Extensions`
  - Add: `honjcnefekfnompampcpmcdadibmjhlk;http://clients2.google.com/service/update2/crx`
- **Edge**:  
  - Use GPO: `User Configuration > Administrative Templates > Microsoft Edge > Extensions`
  - Add: `hbonijggfojboimdmhilgnikbkeodiha`

## 5. Additional Resources
- [Installing LanSchool Student for Windows](https://helpdesk.lanschool.com/portal/en/kb/articles/installing-lanschool-student-for-windows)
- [Deploying LanSchool Classic Using Intune](https://helpdesk.lanschool.com/portal/en/kb/articles/deploying-lanschool-classic-using-intune)
