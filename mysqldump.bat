@echo off

set BACKUP_NAME=mysqldump
set BACKUP_DATABASE=--all-databases
set BACKUP_FOLDER=c:\Users\user\Documents
set MYSQL_HOST=localhost
set MYSQL_PORT=3306
set MYSQL_USER=root
set MYSQL_PASS=password
set ZIP_PASSWORD=password


SET datetime=%DATE:~-4%-%DATE:~-10,2%-%DATE:~-7,2%.%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

mysqldump.exe -h %MYSQL_HOST% -P %MYSQL_PORT% -u %MYSQL_USER% -p%MYSQL_PASS% --hex-blob %BACKUP_DATABASE% > %BACKUP_NAME%.%datetime%.sql
7z.exe a -ttar -so -an -sdel %BACKUP_NAME%.%datetime%.sql | 7z a -si -p%ZIP_PASSWORD% %BACKUP_FOLDER%\%BACKUP_NAME%.%datetime%.tar.7z
