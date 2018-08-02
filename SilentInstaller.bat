@rem RightFax 10.6.3.6 Client Silent Installer /w Prereqs
@rem for Win7x64
@rem subst Z: \\Server\Share\InstallFiles /D
@rem Crystal reports not added in for the Enterprise Fax Reporter
@rem 

 cd .\Client\Prereqs

 "dotNetFx45_Full_x86_x64.exe" /q /norestart
 "VS2008_vcredist_x86.exe" /q /norestart
 "VS2010_vcredist_x86.exe" /q /norestart
 "VS2012_vcredist_x86.exe" /q /norestart
 "VS2013_vcredist_x86.exe" /q /norestart
 "VS2015_vcredist_x86.exe" /q /norestart
 "vstor40_x64.exe" /q /norestart
 "vcredist_x86.exe" /q /norestart
 "vstor_redist.exe" /q /norestart
 "NDP452-KB2901907-x86-x64-AllOS-ENU.exe" /q /norestart
 cd ..
 cd .\RightFax\Setup
 : PrinterProcessorx64
 msiexec.exe /i "RightFax Print Processor x64.msi" /qn RUNFROMSETUP=1 INSTALLDIR="C:\Program Files (x86)\RightFax\"
 cd ..
 cd ..
 : CoreInstall
 msiexec.exe /i "RightFax Product Suite - Client.msi" /qn /norestart RFSERVERNAME="RightFaxServer" RUNBYRIGHTFAXSETUP=2 CONFIGUREFAXCTRL=1 CONFIGUREFAXUTIL=1 ALLUSERS="1" ADDLOCAL="FaxUtil,FaxCtrl"

:DONE
