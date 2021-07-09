# escape=`
#FROM mcr.microsoft.com/windows/servercore:1607
FROM mcr.microsoft.com/windows/servercore/iis
EXPOSE 52773 51773 23 80
WORKDIR C:\IRISKit
COPY IRISHealth-2021.1.0.215.0-win_x64.exe InstallerManifest.cls %ZSTART.mac iris.key applicationHost.config C:\IRISKit\
RUN IRISHealth-2021.1.0.215.0-win_x64.exe /instance IRIS /qn INSTALLDIR=C:\IRISSys `
 ADDLOCAL=ALL INITIALSECURITY=Normal `
 IRISUSERPASSWORD=isc INSTALLERMANIFEST=C:\IRISKit\InstallerManifest.cls UNICODE=0`
 && C:\IRISSys\bin\iris.exe stop iris quietly `
 && copy C:\IRISKit\iris.key C:\IrisSys\mgr\iris.key `
 && copy C:\IRISKit\applicationHost.config C:\Windows\System32\inetsrv\config\applicationHost.config `
 && powershell [Environment]::SetEnvironmentVariable('PATH', 'C:\IRISSys\bin;'+$env:PATH, [EnvironmentVariableTarget]::Machine); 

CMD powershell Get-Content -path 'c:\IRISSys\mgr\messages.log' -Tail 1 -Wait 