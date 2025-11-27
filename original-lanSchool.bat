@echo off
REM Set TEACHERMC variable to the teacher's machine name (use uppercase only)
REM Set CHANNEL variable to the unique room channel number (numeric value 1 - 16000)

SET TEACHERMC=CLASSROOM-H3
SET CHANNEL=803

REM Check if this is the teacher's machine
IF "%COMPUTERNAME%" == "%TEACHERMC%" GOTO :TEACHER

:STUDENT
REM Install LanSchool Student if not already installed
IF NOT EXIST "C:\Program Files (x86)\LanSchool\student.exe" (
	msiexec.exe /i "\\sccm2\Deployment\Software\LanSchool\latest\Student.msi" /qn ADVANCED_OPTIONS=1 STEALTH_MODE=1 NO_KEYBOARD_MONITORING_MODE=1 NO_INTERNET_MONITORING_MODE=1 CHANNEL=%CHANNEL% LCS=192.168.254.20
	IF %ERRORLEVEL% EQU 0 (
		echo [%DATE% %TIME%] LanSchool Student install succeeded on %COMPUTERNAME% >> C:\LanSchoolInstall.log 2>nul
	) ELSE (
		echo [%DATE% %TIME%] LanSchool Student install failed on %COMPUTERNAME% >> C:\LanSchoolInstall.log 2>nul
	)
)
GOTO :END

:TEACHER
REM Install LanSchool Teacher if not already installed
IF NOT EXIST "C:\Program Files (x86)\LanSchool\teacher.exe" (
	msiexec.exe /i "\\sccm2\Deployment\Software\LanSchool\latest\Teacher.msi" /qn ADVANCED_OPTIONS=1 CHANNEL=%CHANNEL% LCS=192.168.254.20
	IF %ERRORLEVEL% EQU 0 (
		echo [%DATE% %TIME%] LanSchool Teacher install succeeded on %COMPUTERNAME% >> C:\LanSchoolInstall.log 2>nul
	) ELSE (
		echo [%DATE% %TIME%] LanSchool Teacher install failed on %COMPUTERNAME% >> C:\LanSchoolInstall.log 2>nul
	)
)
:END