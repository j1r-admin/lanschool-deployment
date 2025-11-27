@echo off
REM Set TEACHERMC variable to the teacher's machine name (use uppercase only)
REM Set CHANNEL variable to the unique room channel number ( numeric value 1 - 16000 )

SET TEACHERMC=CLASSROOM-H3
SET CHANNEL=803

IF "%COMPUTERNAME%" == "%TEACHERMC%" GOTO :TEACHER

:STUDENT
If not exist "C:\Program Files (x86)\LanSchool\student.exe" msiexec.exe /i "\\sccm2\Deployment\Software\LanSchool\latest\Student.msi" /qn ADVANCED_OPTIONS=1 STEALTH_MODE=1 NO_KEYBOARD_MONITORING_MODE=1  NO_INTERNET_MONITORING_MODE=1 CHANNEL=%CHANNEL%
GOTO :END

:TEACHER
If not exist "C:\Program Files (x86)\LanSchool\teacher.exe" msiexec.exe /i "\\sccm2\Deployment\Software\LanSchool\latest\Teacher.msi" /qn ADVANCED_OPTIONS=1 CHANNEL=%CHANNEL%
:END