@echo off
REM ------------------------------
REM ArcGIS Pro 3.5 �̈ꊇ�C���X�g�[��
REM ------------------------------

REM 
REM �ȉ����Q�l�ɂ��ĕҏW���܂���
REM �Q�l�Fhttps://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat
REM 


REM �o�b�`�ł�.NET Framework �̃o�[�W�����`�F�b�N�͈ȉ����Q�l�ɂ��܂����B
REM �Q�l:https://www.atmarkit.co.jp/ait/articles/1210/26/news086.html
REM 
REM ���W�X�g���̒l��MS�̃T�C�g�ɂ���܂��B
REM �Q�l:https://docs.microsoft.com/ja-jp/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
REM   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full
REM   .NET Framework 4.8 �̏ꍇ�� Release REG_DWORD �l 528040
REM 


REM Pro 3.0 ��.NET 6 Desktop Runtime x64 ���K�v�ƂȂ邽�߁A.NET Core version �̃o�[�W�����`�F�b�N�̕��������������i2022�N8���j
REM Pro 3.3 ��.NET 8 Desktop Runtime x64 ����� Microsoft Edge WebView2 Runtime �̑O�������2�ɑ������i2024�N7���j
REM 
REM �Q�l: winget �ł�.NET �f�X�N�g�b�v �����^�C�� ��winget �ŃC���X�g�[������ꍇ
REM   >winget install Microsoft.DotNet.DesktopRuntime.6
REM   https://docs.microsoft.com/ja-jp/dotnet/core/install/windows?tabs=net60
REM 
REM �Q�l�F ���W�X�g���̒l���`�F�b�N������@
REM   https://stackoverflow.com/questions/73336550/is-there-a-way-to-determine-via-registry-net-core-version-with-nsis
REM   HKEY_LOCAL_MACHINE\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost
REM   Version REG_SZ �l 6.0.x
REM 
REM   x64�̃��W�X�g���ňꗗ���擾�ix64�̃��W�X�g���ňꗗ���擾���āAREG_DWORD�̃L�[���`�F�b�N�j
REM   HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\dotnet\Setup\InstalledVersions\x64\sharedfx\Microsoft.WindowsDesktop.App
REM   5.0.x REG_DWORD �l 1
REM   6.0.x REG_DWORD �l 1 (x >= 5 : Pro ��6.0.5 �ȏオ�K�v)
REM   8.0.x REG_DWORD �l 1 (Pro 3.3 ��8.0.0 �ȏオ�K�v: 2024�N7��9�����_�̍ŐV�� 8.0.6 )
REM 
REM �Q�l�F .NET SDK ���C���X�g�[�����Ă�����ł���΁Adotnet --list-runtimes �Ń����^�C���̈ꗗ���擾���ă`�F�b�N������@�𗘗p�\
REM   >dotnet --list-runtimes
REM   Microsoft.AspNetCore.All 2.1.28 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.All]
REM   �`�ȗ��`
REM   Microsoft.NETCore.App 2.1.28 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 3.1.15 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 5.0.6 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 6.0.8 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 8.0.6 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   �`�ȗ��`
REM   Microsoft.WindowsDesktop.App 5.0.6 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM   Microsoft.WindowsDesktop.App 6.0.8 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM   Microsoft.WindowsDesktop.App 8.0.6 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM   
REM   �擾����Runtime�̈ꗗ���� Microsoft.WindowsDesktop.App 6.0.x �����݂��邩���`�F�b�N����
REM   ���ӎ����F�o�b�`�t�@�C����for���̒��ŕϐ��𑀍삵�Ă����҂��������ɂȂ�Ȃ��Ƃ��ɂ́u�x�����ϐ��̓W�J�Ƃ������̂��g���v�Ƃ悢�炵��
REM     �Q�l�Fhttp://dalmore.blog7.fc2.com/blog-entry-79.html
REM 
REM   dotnet �R�}���h�̎Q�l�F
REM     .NET �����ɃC���X�g�[������Ă��邱�Ƃ��m�F������@�Fhttps://docs.microsoft.com/ja-jp/dotnet/core/install/how-to-detect-installed-versions?pivots=os-windows


REM 
REM �o�b�`�t�@�C���Ɋ܂߂Ă���v���_�N�g
REM 
REM �o�b�`�t�@�C���Ɋ܂߂ăv���_�N�g�� My Esri ����_�E�����[�h���鎟�̂��̂ł��B
REM 
REM ---�v���_�N�g �R���|�[�l���g---
REM ArcGIS Pro 3.5
REM ArcGIS Pro 3.5 Patch 1 �i3.5.1�j
REM ArcGIS Pro 3.5 Patch 2 �i3.5.2�j
REM ArcGIS Pro �I�t���C�� �w���v
REM ArcGIS Data Interoperability for Pro �i�p��j
REM ---�f�[�^�ƃR���e���c---
REM ArcGIS Coordinate Systems Data �i�p��j
REM 
REM ��L�̃_�E�����[�h�����t�@�C�����A���ꂼ��𓀐��{�o�b�`�t�@�C����u�����t�H���_�[�Ɏw�肵�ĉ𓀂��s���܂��B
REM �Q�l:ArcGIS Desktop �y�X�C���X�g�[�� �`�o�b�` �t�@�C���̍쐬���@�����Љ�`
REM https://blog.esrij.com/2018/03/30/post-29732/
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.5 �̈ꊇ�C���X�g�[�� �̑Ώ�
echo -----------------------------------
echo �EArcGIS Pro 3.5
echo �EArcGIS Pro 3.5 Patch 1 �i3.5.1�j
echo �EArcGIS Pro 3.5 Patch 2 �i3.5.2�j
echo �EArcGIS Pro �I�t���C�� �w���v
REM echo �EArcGIS Data Interoperability for Pro �i�p��j
echo �EArcGIS Coordinate Systems Data �i�p��j
echo.

set __COMPAT_LAYER=RunAsInvoker

REM ���΃p�X�ŏ������邽�߃o�b�`�t�@�C���̎��s�f�B���N�g����ݒ�
set curpath=%~dp0


REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Pro 3.5 �̃C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��C���X�g�[���`�F�b�N
REM 
REM Pro 3.3 �Ŏ��O�ɕK�v�Ȃ��̂�.NET 8 Desktop Runtime x64 ����� Microsoft Edge WebView2 Runtime
REM 
REM a) .NET SDK ���C���X�g�[�����Ă�����̏ꍇ
REM dotnet --list-runtimes �Ń����^�C���̈ꗗ���擾���ă`�F�b�N������@
REM   >dotnet --list-runtimes
REM   Microsoft.AspNetCore.All 2.1.28 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.All]
REM   �`�ȗ��`
REM   Microsoft.NETCore.App 2.1.28 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 3.1.15 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 5.0.6 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 6.0.8 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 8.0.6 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   �`�ȗ��`
REM   Microsoft.WindowsDesktop.App 5.0.6 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM   Microsoft.WindowsDesktop.App 6.0.8 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM   Microsoft.WindowsDesktop.App 8.0.6 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM 
REM   �擾����Runtime�̈ꗗ���� Microsoft.WindowsDesktop.App 6.0.x �����݂��邩���`�F�b�N����
REM   ���ӎ����F�o�b�`�t�@�C����for���̒��ŕϐ��𑀍삵�Ă����҂��������ɂȂ�Ȃ��Ƃ��ɂ́u�x�����ϐ��̓W�J�Ƃ������̂��g���v�Ƃ悢�炵��
REM     �Q�l�Fhttp://dalmore.blog7.fc2.com/blog-entry-79.html
REM 
REM setlocal enabledelayedexpansion
REM set /A FULLVERSION=605
REM set CHECK_DR=FALSE
REM FOR /F "tokens=2,4,5,6,* delims=. " %%I IN ('dotnet --list-runtimes') DO (
REM   REM �m�F�p
REM   REM echo %%I %%J %%K %%L
REM   REM   AspNetCore 5 0 6
REM   REM   NETCore 6 0 8
REM   REM   WindowsDesktop 5 0 6
REM   REM                        ���Əo�͂����͂�
REM   IF "%%I%%J"=="WindowsDesktop6" (
REM     SET /A FULLNETDRVAL=%%J%%K%%L
REM     REM �m�F�p
REM     REM echo !FULLNETDRVAL! ^>^= %FULLVERSION%
REM     IF !FULLNETDRVAL! geq %FULLVERSION% SET CHECK_DR=TRUE
REM   )
REM )

REM b) .NET SDK ���C���X�g�[�����Ă��Ȃ����̏ꍇ�ix64�̃��W�X�g���ňꗗ���擾���āAREG_DWORD�̃L�[���`�F�b�N�j
REM   reg query "HKLM\SOFTWARE\WOW6432Node\dotnet\Setup\InstalledVersions\x64\sharedfx\Microsoft.WindowsDesktop.App" /t "REG_DWORD"
REM   5.0.x REG_DWORD �l 1
REM   6.0.x REG_DWORD �l 1 (x >= 5 : Pro ��6.0.5 �ȏオ�K�v)
REM   8.0.x REG_DWORD �l 1 (Pro 3.3 ��8.0.0 �ȏオ�K�v: 2024�N7��9�����_�̍ŐV�� 8.0.6 )
REM 
setlocal enabledelayedexpansion
set /A FULLVERSION=800
set CHECK_DR=FALSE
FOR /F "tokens=1,2,3,* delims=. " %%I IN ('reg query "HKLM\SOFTWARE\WOW6432Node\dotnet\Setup\InstalledVersions\x64\sharedfx\Microsoft.WindowsDesktop.App" /t "REG_DWORD"') DO (
  REM �m�F�p
  REM echo %%I %%J %%K %%L
  REM 6 0 8 REG_DWORD 0x1 �ƕ\�������
  REM 6 0 25 REG_DWORD 0x1 �ƕ\�������
  REM 2024.8.2 - %%K ��2���̏ꍇ�͔��肪�������Ȃ��̂ŁA4���ڂ����O����悤�ɕύX
  REM SET /A FULLNETDRVAL=%%I%%J%%K
  SET M=%%K
  SET N=!M:~0,1!
  REM �m�F�p
  REM echo !M!
  REM echo !N!
  SET /A FULLNETDRVAL=%%I%%J!N!
  REM Microsoft.WindowsDesktop.App 8.0.0 �ȏオ�C���X�g�[������Ă���ꍇ
  IF !FULLNETDRVAL! geq %FULLVERSION% (
    REM �m�F�p
    REM echo !FULLNETDRVAL! ^>^= %FULLVERSION%
    SET CHECK_DR=TRUE
  )
)

IF %CHECK_DR%==TRUE (
  REM echo .NET 8 Desktop Runtime x64 ���m�F���܂����B�C���X�g�[���\�ł��B
  GOTO NETDROK
) ELSE (
  REM echo .NET 8 Desktop Runtime x64 ����������܂���B�ŏ��ɃC���X�g�[�����Ă��������B
  GOTO NETDRNG
)

endlocal

:NETDROK
echo .NET 8 Desktop Runtime x64 ���m�F���܂����B�C���X�g�[���\�ł��i���O���� 1/2 �j�B
echo.


REM c) Pro 3.3 �ŕK�v��Microsoft Edge WebView2 Runtime�̃`�F�b�N
REM �N�G��:
REM reg query "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" /v "pv"
REM ����:
REM HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}
REM pv    REG_SZ    126.0.2592.87
REM 3��ڂ��o�[�W�����̂悤�Ȃ̂ŁA"tokens=3 delims=. " �ōŏ��� 126 ������ϐ��Ɋi�[���� 
setlocal enabledelayedexpansion
set /A FULLWVVERSION=117
set CHECK_WV=FALSE
FOR /F  "tokens=3 delims=. " %%I IN ('reg query "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" /v "pv"') DO (
  REM �m�F�p
  REM echo %%I
  SET /A FULLWVVAL=%%I
  IF !FULLWVVAL! geq %FULLWVVERSION% (
    REM �m�F�p
    REM echo !FULLWVVAL! ^>^= %FULLWVVERSION%
    SET CHECK_WV=TRUE
  )
)

IF %CHECK_WV%==TRUE (
  GOTO WVOK
) ELSE (
  GOTO WVNG
)

endlocal

:WVOK
echo WebView2 ���m�F���܂����B�C���X�g�[���\�ł��i���O���� 2/2 �j�B
echo.


REM ArcGIS Pro �{�̂̃C���X�g�[��
REM 2.8 ����G���h ���[�U�[�g�p�����_�� (EULA)��ACCEPTEULA���K�{�p�����[�^�Ƃ��Ēǉ�
REM 3.3 ����AI���f���i�Z�}���e�B�b�N�̌����A�c�[���̒�āj�̑I�����I�v�V�����Ƃ��Ēǉ�
REM 3.4 ����AI���f���i���P�[�^�[�̍쐬�j�̑I�����I�v�V�����Ƃ��Ēǉ��i�o�b�`�t�@�C���̒��ł�3����� ADDLOCAL=ALL �j�B
REM ArcGIS Pro�̃T�C�����g�C���X�g�[�����̃p�����[�^�ڍׂ̓C���X�g�[���K�C�h�ɋL�ڂ���Ă��܂�
REM https://pro.arcgis.com/ja/pro-app/latest/get-started/arcgis-pro-installation-administration.htm
echo ArcGIS Pro 3.5 �{�̂̃C���X�g�[��... �C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 ACCEPTEULA=YES ADDLOCAL=ALL /norestart /passive /qb

REM ArcGIS Pro ���{��p�b�N�̃C���X�g�[��
echo ArcGIS Pro 3.5 ���{��p�b�N �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb


REM ArcGIS Help�C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISProHelp_Japanese\ArcGISProHelp_Japanese.msi" /norestart /passive /qb


echo ArcGIS Pro 3.5 �̃C���X�g�[���I��
echo.


REM �p�b�`�̃C���X�g�[��
echo �p�b�`�̃C���X�g�[���J�n

REM echo ArcGIS Pro 3.5 Patch 1 �̃C���X�g�[��...
%windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_351_195509.msp" /norestart /passive /qb

REM echo ArcGIS Pro 3.5 Patch 2 �̃C���X�g�[��...
%windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_352_195508.msp" /norestart /passive /qb

echo �p�b�`�̃C���X�g�[���I��
echo.

REM ArcGIS Coordinate Systems Data �̃C���X�g�[��
echo ArcGIS Coordinate Systems Data �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\CoordinateSystemsData\SetupFiles\CSD.msi" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data �̃C���X�g�[���I��
echo.

REM Data Interoperability �̃C���X�g�[��
REM echo ArcGIS Pro 3.5 Data Interoperability �̃C���X�g�[��...
REM %windir%\System32\msiexec.exe /I "%curpath%\ArcGISProDataInterop\DataInteropPro.msi" ALLUSERS=1 /norestart /passive /qb
REM %windir%\System32\msiexec.exe /I "%curpath%\ArcGISProDataInterop\DataInteropPro.msi" INSTALLDIR="F:\ArcGIS" ALLUSERS=1 /norestart /passive /qb
REM echo ArcGIS Pro 3.5 Data Interoperability �̃C���X�g�[���I��
REM echo.

REM Data Interoperability �p�b�`�̃C���X�g�[��
REM echo Data Interoperability �p�b�`�̃C���X�g�[���J�n
REM 
REM 
REM echo Data Interoperability �p�b�`�̃C���X�g�[���I��
REM echo.

REM ���̑�:ArcGIS Pro �p ST_Geometry ���C�u���� �� ODBC Driver�Ȃǂ͕K�v�ɉ�����
REM ���̑�:���{�p�n�}�V���{���Ȃ�
echo.
echo ��1)ArcGIS Pro 3.5 �p �f�[�^�x�[�X�T�|�[�g�t�@�C�� �͕K�v�ɉ�����My Esri������肵�ăC���X�g�[�����Ă�������
echo ��2)���̑��A�ϊ��c�[���A���{�p�n�}�V���{�� �͕K�v�ɉ�����ArcGIS ���\�[�X�W�ihttps://doc.esrij.com/pro/get-started/setup/user/�j���Q�Ƃ̏�A�C���X�g�[�����Ă�������
echo.

GOTO EXITEND

:NETDRNG
echo ���O������ .NET 8 Desktop Runtime x64 ���m�F�ł��Ȃ����߁A�C���X�g�[�����p���ł��܂���B
echo   Download .NET 8.0 �ihttps://dotnet.microsoft.com/en-us/download/dotnet/8.0�j ���� .NET Desktop Runtime - Windows x64 Installer ����肵�ăC���X�g�[�����邩�A
echo   winget install Microsoft.DotNet.DesktopRuntime.8 �ŃC���X�g�[�����Ă������� �ihttps://docs.microsoft.com/ja-jp/dotnet/core/install/windows?tabs=net80�j
GOTO EXITEND

:WVNG
echo ���O������ Microsoft Edge WebView2 Runtime ���m�F�ł��Ȃ����߁A�C���X�g�[�����p���ł��܂���B
echo   Download  �ihttps://developer.microsoft.com/en-us/microsoft-edge/webview2?form=MA13LH#download�j ���� 
echo   Evergreen Bootstrapper (x64) �������� Evergreen Standalone Installer (x64) ����肵�ăC���X�g�[�����Ă��������B
GOTO EXITEND

:EXITEND

pause
exit /b
