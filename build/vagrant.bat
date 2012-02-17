@echo off

set ROOTDIR=%~dp0

if "%1"=="ssh" (
    %ROOTDIR%putty.exe -ssh -i %ROOTDIR%keys\vagrant -P 2222 vagrant@localhost
) else (
    java -jar %ROOTDIR%standalone-vagrant-1.0-SNAPSHOT.jar %*
)
