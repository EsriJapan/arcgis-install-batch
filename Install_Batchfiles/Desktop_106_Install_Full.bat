@echo off
REM 
REM ArcGIS Desktop 10.6�̈ꊇ�C���X�g�[��
REM 
REM �ȉ����Q�l�ɂ��ĕҏW���܂���
REM �Q�l�Fhttps://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

set __COMPAT_LAYER=RunAsInvoker

REM ���΃p�X�ŏ������邽�߃o�b�`�t�@�C���̎��s�f�B���N�g����ݒ�
set curpath=%~dp0


REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Desktop 10.6�̃C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��C���X�g�[��
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

echo MSXML6 64-bit �̃C���X�g�[��...
REM install MSXML6
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Support\MSXML6\64-bit\msxml6_x64.msi" /norestart /passive /qb


:32BIT
echo MSXML6 �̃C���X�g�[��...
REM install MSXML6
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Support\MSXML6\32-bit\msxml6.msi" /norestart /passive /qb


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
REM 
REM [�Q�l�Fwmic���g���ăo�b�`�t�@�C���Ńo�[�W�������擾]:
REM https://stackoverflow.com/questions/25162348/find-the-version-of-a-installed-program-from-batch-file

IF EXIST "%windir%\System32\msvcp140.dll" GOTO VC2017SKIP
echo Microsoft Visual C++ 2017 �Ĕz�z�\(x86)�p�b�P�[�W �̃C���X�g�[��...
"%curpath%\Desktop_Japanese\SetupFiles\Support\VCREDIST\vc_redist.x86.exe" /norestart /passive /qb
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
IF MINOR gtr 10 (
REM  ECHO "VC++2017��msvcp140.dll�������Ă���"
) ELSE (
REM  ECHO "VC++2015��msvcp140.dll�������Ă���"
  echo Microsoft Visual C++ 2017 �Ĕz�z�\(x86)�p�b�P�[�W �̃C���X�g�[��...
  "%curpath%\Desktop_Japanese\SetupFiles\Support\VCREDIST\vc_redist.x86.exe" /norestart /passive /qb
)

:VC2017END

REM ArcGIS Desktop�{�̂̃C���X�g�[��
echo ArcGIS Desktop 10.6 �̃C���X�g�[��... �C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\setup.msi" /norestart /passive /qb

REM ���{��p�b�N�̃C���X�g�[��
echo ArcGIS Desktop 10.6 ���{��p�b�N �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Supplement\DesktopJapanese.msi" /norestart /passive /qb


REM �����Ή��p�b�N�̃C���X�g�[��
echo ArcGIS Desktop 10.6 �����Ή��p�b�N �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_JpnPack\JpnPack_Desktop10_6.msi" /norestart /passive /qb


IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

REM 10.6����Microsoft Visual C++ 2017 �Ĕz�z�\(x64)�p�b�P�[�W���O�C���X�g�[�����ǉ����ꂽ�iSetup.exe���Ǝ����Ŕ��ʁj
IF EXIST "%windir%\System32\msvcp140.dll" GOTO VC201764SKIP
echo Microsoft Visual C++ 2017 �Ĕz�z�\(x64)�p�b�P�[�W �̃C���X�g�[��...
"%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\Support\VCREDIST\vc_redist.x64.exe" /norestart /passive /qb
GOTO VC201764END


:VC201764SKIP
IF MINOR gtr 10 (
REM ECHO "VC++2017��msvcp140.dll"
) ELSE (
  echo Microsoft Visual C++ 2017 �Ĕz�z�\(x64)�p�b�P�[�W �̃C���X�g�[��...
  "%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\Support\VCREDIST\vc_redist.x64.exe" /norestart /passive /qb
)

:VC201764END

echo ArcGIS Desktop 10.6 64-bit Background Geoprocessing �̃C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /I "%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\setup.msi" /norestart /passive /qb


REM �����Ή��p�b�N 64-bit �̃C���X�g�[��
echo ArcGIS Desktop 10.6 64-bit �����Ή��p�b�N�̃C���X�g�[�� ...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_JpnPack\JpnPack_Desktop10_6_Background.msi" /norestart /passive /qb

:64BITEND

echo ArcGIS Desktop 10.6�̃C���X�g�[���I��



REM �p�b�`�̃C���X�g�[��
echo �p�b�`�̃C���X�g�[���J�n

echo (2)  ArcGIS 10.6 (Desktop, Engine) ECW Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-106-DT-ECW-Patch.msp" /norestart /passive /qb

REM 7/5 ���J�̍����Ή��c�[���p�b�`
echo (3)  ArcGIS Desktop 10.6 �����Ή��p�b�N �ϊ��c�[�� �p�b�`
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\JpnPack_Desktop10_6_patch1.msp" /norestart /passive /qb




REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

echo (1)  ArcGIS (Desktop, Engine) Background Geoprocessing 64-bit Arcpy Exit and Shutdown Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-106-BGDT-AES-Patch.msp" /norestart /passive /qb

echo (2)  ArcGIS 10.6 (Desktop, Engine) ECW Patch 64-bit
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-106-BGDT-ECW-Patch.msp" /norestart /passive /qb

REM 7/5 ���J�̍����Ή��c�[���p�b�` 64-bit
echo (3)  ArcGIS Desktop 10.6 �����Ή��p�b�N �ϊ��c�[�� �p�b�` 64-bit
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\JpnPack_Desktop10_6_patch1_BG.msp" /norestart /passive /qb



echo 

:64BITPatchesEnd

echo �p�b�`�̃C���X�g�[���I��
GOTO EXITEND

:GETVESIONERROR
ECHO "Microsoft Visual C++ 2017 �Ĕz�z�\(x86)�p�b�P�[�W �� msvcp140.dll �o�[�W�����擾�Ɏ��s���܂����B"
ECHO "Desktop_Japanese\SetupFiles\Support\VCREDIST\vc_redist.x86.exe �𒼐ڎ��s��A�ēx�o�b�`�t�@�C�������s���Ă�������"

:EXITEND

pause
exit /b
