@ECHO OFF

FOR /F "usebackq delims==" %%i IN (`type command.tmp`) DO %%i /?>>result.txt
