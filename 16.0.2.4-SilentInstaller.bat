@rem RightFax 16.2.0.4 Client Silent Installer /w Prereqs
@rem for Windows 7 x64 and higher
@rem subst Z: \\Server\Share\InstallFiles /D

@After over 50 revisions attempting to use the GUID's for each RightFax client version I eventually gave up for this practice that has proven so far successful. 
@Copy the previous client install media used on the client workstations to a \OldClient folder off of the root folder.

cd \OldClient

msiexec.exe /x "RightFax Product Suite - Client.msi" RUNBYRIGHTFAXSETUP=2 CONFIGUREFAXCTRL=2 /qb

cd ..

 cd .\Prereqs
 "dotNetFx45_Full_x86_x64.exe" /q /norestart
 "wusa.exe" Windows6.1-KB2921916-x64.msu /quiet /norestart
 "VS2008_vcredist_x86.exe" /q /norestart
 "VS2010_vcredist_x86.exe" /q /norestart
 "VS2012_vcredist_x86.exe" /q /norestart
 "VS2013_vcredist_x86.exe" /q /norestart
 "VS2015_vcredist_x86.exe" /q /norestart
@rem Use if Operating system is 32 bit "vcredist_x86.exe" /q /norestart
 "vstor_redist.exe" /q /norestart
 "NDP462-KB3151800-x86-x64-AllOS-ENU.exe" /q /norestart
 "C:\Windows\System32\Rundll32.exe" PRINTUI.EXE /ia /K /m "RightFax PostScript" /h "x64" /v 2 /f \Drivers\rfps.inf /F \Drivers
 @rem ---Not working---certmgr.exe /add comodorsacertificationauthority.crt

 cd ..
 cd .\RightFax\Setup

 msiexec.exe /i "RightFax Print Processor x64.msi" /qn RUNFROMSETUP=1 INSTALLDIR="C:\Program Files (x86)\RightFax\"
 cd ..
 cd ..
 
 msiexec.exe /i "RightFax Product Suite - Clientx64.msi" /qn /norestart RFSERVERNAME="Quartz" RUNBYRIGHTFAXSETUP=2 CONFIGUREFAXCTRL=1 CONFIGUREFAXUTIL=1 ALLUSERS="1" ADDLOCAL="FaxUtil,FaxCtrl"
:DONE


@rem 