@ECHO off
SETLOCAL
SET "HOSTS_FILE=%WinDir%\System32\drivers\etc\hosts"
SET "TEMP_HOSTS_FILE=%TEMP%\%RANDOM%__hosts"
GOTO start
:start

echo   ______ _______ ______ _____  _   _          _       _____  	  _____          _____  ______  _____ 
echo  |  ____|__   __|  ____|  __ \| \ | |   /\   | |     / ____| 	 / ____|   /\   |  __ \|  ____|/ ____|
echo  | |__     | |  | |__  | |__) |  \| |  /  \  | |    | (___   	| |       /  \  | |__) | |__  | (___  
echo  |  __|    | |  |  __| |  _  /| . ` | / /\ \ | |     \___ \  	| |      / /\ \ |  ___/|  __|  \___ \ 
echo  | |____   | |  | |____| | \ \| |\  |/ ____ \| |____ ____) | 	| |____ / ____ \| |    | |____ ____) |
echo  |______|  |_|  |______|_|  \_\_| \_/_/    \_\______|_____/  	 \_____/_/    \_\_|    |______|_____/ 
                                                                                                   
                                                                                                  
GOTO checkperms

:options

    ECHO Choose an action. (write the coresponding number)
    ECHO 1) Install (Install Eternals Capes)
    ECHO 2) UnInstall (Remove Eternals Capes)
    ECHO 3) Exit
    SET /p choice=Type the number representing an option:

    if '%choice%'=='' (
        ECHO "%choice%" is not a valid option, try again.
        GOTO options
    )
    if '%choice%'=='1' GOTO install
    if '%choice%'=='2' GOTO uninstall
    if '%choice%'=='3' EXIT

:checkperms

    REG ADD HKLM /F>nul 2>&1
    if %ERRORLEVEL% == 0 (
        GOTO options
    ) else (
        ECHO 
        ECHO NO ADMIN PERMISSIONS
        ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        ECHO Please run this installer again with admin permisions.
        ECHO To do it, right click on this file and click on 
        ECHO "Run as administrator"
        PAUSE
        EXIT
    )

:install
    FINDSTR /V "129.151.148.92 s.optifine.net" "%HOSTS_FILE%" > "%TEMP_HOSTS_FILE%"
    ECHO 129.151.148.92 s.optifine.net >> "%TEMP_HOSTS_FILE%"
    COPY /b/v/y "%TEMP_HOSTS_FILE%" "%HOSTS_FILE%"
    ECHO Finished installing.
    PAUSE
    EXIT

:uninstall
    FINDSTR /V "129.151.148.92 s.optifine.net" "%HOSTS_FILE%" > "%TEMP_HOSTS_FILE%"
    COPY /b/v/y "%TEMP_HOSTS_FILE%" "%HOSTS_FILE%"
    ECHO Finished uninstalling.
    PAUSE
    EXIT
