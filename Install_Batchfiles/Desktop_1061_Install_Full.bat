@echo off
REM 
REM ArcGIS Desktop 10.6.1�̈ꊇ�C���X�g�[��
REM 
REM �ȉ����Q�l�ɂ��ĕҏW���܂���
REM �Q�l�Fhttps://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

set __COMPAT_LAYER=RunAsInvoker

REM ���΃p�X�ŏ������邽�߃o�b�`�t�@�C���̎��s�f�B���N�g����ݒ�
set curpath=%~dp0


REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Desktop 10.6.1�̃C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��C���X�g�[��
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1�ł�MSXML�͊܂܂�Ă��Ȃ�
REM echo MSXML6 64-bit �̃C���X�g�[��...
REM install MSXML6
REM %windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Support\MSXML6\64-bit\msxml6_x64.msi" /norestart /passive /qb


:32BIT
REM echo MSXML6 �̃C���X�g�[��...
REM install MSXML6
REM %windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Support\MSXML6\32-bit\msxml6.msi" /norestart /passive /qb


REM 10.6����Microsoft Visual C++ 2017 �Ĕz�z�\(x86)�p�b�P�[�W���O�C���X�g�[�����ǉ����ꂽ�iSetup.exe���Ǝ����Ŕ��ʁj
REM Microsoft Visual C++ 20xx �Ĕz�z�\�p�b�P�[�W ����DLL�ꗗ
REM https://docs.microsoft.com/ja-jp/cpp/ide/install-a-missing-microsoft-visual-cpp-runtime-dll
REM 
REM 1) Microsoft Visual C++ 2017 �Ĕz�z�\(x86)�p�b�P�[�W �̂�������dll�̑��݃`�F�b�N
REM %windir%\System32\msvcp140.dll
REM 
REM 2)�umsvcp140.dll�v�� VC++2015 �� VC++ 2017 �Ɋ܂܂��t�@�C���̂��߂��� wmic �R�}���h�ŁAdll�� version �̃}�C�i�[�o�[�W�������`�F�b�N
REM VC++ 2015 �̏ꍇ version 14.0.xxxxx.0   (Major 14, Minor 0)
REM VC++ 2017 �̏ꍇ version 14.10.xxxxx.0  (Major 14, Minor 10)
REM 10.6.1�ł� �A�b�v�f�[�g5�ȍ~���K�v�F 
REM VC++ 2017 �i�A�b�v�f�[�g 5 �ȍ~�j�̏ꍇ version 14.12.25810 (Major 14, Minor 12)
REM 
REM [�Q�l�Fwmic���g���ăo�b�`�t�@�C���Ńo�[�W�������擾]:
REM https://stackoverflow.com/questions/25162348/find-the-version-of-a-installed-program-from-batch-file

REM VC�̃}�C�i�[�o�[�W������r�p
set VCVERSION=12

IF EXIST "%windir%\System32\msvcp140.dll" GOTO VC2017SKIP
echo Microsoft Visual C++ 2017 �Ĕz�z�\(x86)�p�b�P�[�W �̃C���X�g�[��...
"%curpath%\Desktop_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x86.exe" /norestart /passive /qb
GOTO VC2017END


:VC2017SKIP
REM 2)�̏ꍇ
REM dll �t�@�C������ version ���擾
setlocal ENABLEDELAYEDEXPANSION

REM version �̊m�F�������t�@�C����ݒ�
REM set "name='C:\Windows\System32\msvcp140.dll'"
set "name='%windir%\System32\msvcp140.dll'"

REM wmic�p�Ƀp�X��\����\\�ɕϊ�
REM set "name='C:\\Windows\\System32\\msvcp140.dll'"
set "name=%name:\=\\%"

REM wmic.exe �� version ���擾
FOR /F "tokens=2 delims==" %%I IN (
  'wmic datafile where "name=%name%" get version /format:list'
) DO SET "VERSION=%%I"
REM ECHO %VERSION%

REM VERSION���擾�ł��Ȃ������ꍇ
IF "%VERSION%"=="" GOTO GETVESIONERROR

REM version ���� major �� minor �𕪂���
FOR /F "tokens=1-2 delims=." %%J IN ("%VERSION%") DO (
  SET MAJOR=%%J
  SET MINOR=%%K
)
REM ECHO %MAJOR%
REM ECHO %MINOR%

endlocal


REM ���ʂ̕\��
IF MINOR gtr VCVERSION (
REM  ECHO "VC++2017��msvcp140.dll�������Ă���(MINOR 12 : UPDATE5)"
GOTO VC2017END
)
REM ELSE (
REM  ECHO "VC++2015��msvcp140.dll�������Ă���"
REM )
echo Microsoft Visual C++ 2017 �Ĕz�z�\(x86)�p�b�P�[�W �̃C���X�g�[��...
"%curpath%\Desktop_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x86.exe" /norestart /passive /qb



:VC2017END

REM ArcGIS Desktop�{�̂̃C���X�g�[��
echo ArcGIS Desktop 10.6.1 �̃C���X�g�[��... �C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\setup.msi" /norestart /passive /qb

REM ���{��p�b�N�̃C���X�g�[��
echo ArcGIS Desktop 10.6.1 ���{��p�b�N �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Supplement\DesktopJapanese.msi" /norestart /passive /qb


REM �����Ή��p�b�N�̃C���X�g�[��
echo ArcGIS Desktop 10.6.1 �����Ή��p�b�N �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_JpnPack\JpnPack_Desktop10_6_1.msi" /norestart /passive /qb


IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

REM 10.6����Microsoft Visual C++ 2017 �Ĕz�z�\(x64)�p�b�P�[�W���O�C���X�g�[�����ǉ����ꂽ�iSetup.exe���Ǝ����Ŕ��ʁj
IF EXIST "%windir%\System32\msvcp140.dll" GOTO VC201764SKIP
echo Microsoft Visual C++ 2017 �Ĕz�z�\(x64)�p�b�P�[�W �̃C���X�g�[��...
"%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x64.exe" /norestart /passive /qb
GOTO VC201764END


:VC201764SKIP
IF MINOR gtr VCVERSION (
REM ECHO "VC++2017��msvcp140.dll(MINOR 12 : UPDATE5)"
GOTO VC201764END
)
REM ELSE (
REM 
REM )
echo Microsoft Visual C++ 2017 �Ĕz�z�\(x64)�p�b�P�[�W �̃C���X�g�[��...
"%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x64.exe" /norestart /passive /qb

:VC201764END

echo ArcGIS Desktop 10.6.1 64-bit Background Geoprocessing �̃C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /I "%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\setup.msi" /norestart /passive /qb


REM �����Ή��p�b�N 64-bit �̃C���X�g�[��
echo ArcGIS Desktop 10.6.1 64-bit �����Ή��p�b�N�̃C���X�g�[�� ...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_JpnPack\JpnPack_Desktop10_6_1_Background.msi" /norestart /passive /qb

:64BITEND

echo ArcGIS Desktop 10.6.1�̃C���X�g�[���I��



REM �p�b�`�̃C���X�g�[��
echo �p�b�`�̃C���X�g�[���J�n

echo 01_Buffering Degenerated Polygon Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-BDP-Patch.msp" /norestart /passive /qb

echo 02_Geoprocessing Service Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-GS-Patch.msp" /norestart /passive /qb

echo 03_JPEG NoData Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-JN-Patch.msp" /norestart /passive /qb

echo 04_Buffer Wizard Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-BW-Patch.msp" /norestart /passive /qb

echo 05_Raster Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-R-Patch.msp" /norestart /passive /qb

REM 2018/12/14���J�p�b�`
echo 06_PostgreSQL Performance and Version 10 Support Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-PPVS-Patch.msp" /norestart /passive /qb

REM 2018/12/21���J�p�b�`
echo 07_Published Script Tools Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-PST-Patch.msp" /norestart /passive /qb

REM 2019/01/25���J�p�b�`
echo 08_Importing Raster to Enterprise Geodatabase Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-IREG-Patch.msp" /norestart /passive /qb

REM 2019/02/01���J�p�b�`
echo 09_TLS Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-TLS-Patch.msp" /norestart /passive /qb


REM 2019/02/19���J�p�b�`
echo 11_Dialog Initialization Performance Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-DIP-Patch.msp" /norestart /passive /qb

REM 2019/03/06���J�p�b�`
echo 13_Exporting Data From a Layer Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-EDL-Patch.msp" /norestart /passive /qb

REM 2019/04/15���J�p�b�`
echo 14_Spatial Analyst Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-SA-Patch.msp" /norestart /passive /qb

REM 2019/06/07���J�p�b�`
echo 15_NITF and NCDRD Quality Patch 1
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-NNQ1-Patch.msp" /norestart /passive /qb

REM 2019/06/07���J�p�b�`
echo 16_Text Performance Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-DT-TP-Patch.msp" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd


echo 01_Buffering Degenerated Polygon Patch 64-bit
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-BGDT-BDP-Patch.msp" /norestart /passive /qb

echo 02_Geoprocessing Service Patch 64-bit
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-BGDT-GS-Patch.msp" /norestart /passive /qb

echo 03_JPEG NoData Patch 64-bit
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-BGDT-JN-Patch.msp" /norestart /passive /qb

REM 2018/12/14���J�p�b�`
echo 06_PostgreSQL Performance and Version 10 Support Patch 64-bit
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-BGDT-PPVS-Patch.msp" /norestart /passive /qb

REM 2018/12/21���J�p�b�`
echo 07_Published Script Tools Patch 64-bit
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-BGDT-PST-Patch.msp" /norestart /passive /qb


REM 2019/04/15���J�p�b�`
echo 14_Spatial Analyst Patch 64-bit
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1061-BGDT-SA-Patch.msp" /norestart /passive /qb


echo 

:64BITPatchesEnd

echo �p�b�`�̃C���X�g�[���I��
GOTO EXITEND

:GETVESIONERROR
ECHO "Microsoft Visual C++ 2017 �Ĕz�z�\(x86)�p�b�P�[�W �� msvcp140.dll �o�[�W�����擾�Ɏ��s���܂����B"
ECHO "Desktop_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x86.exe �𒼐ڎ��s��A�ēx�o�b�`�t�@�C�������s���Ă�������"

:EXITEND

pause
exit /b
