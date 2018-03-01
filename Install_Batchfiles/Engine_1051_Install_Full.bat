REM ArcGIS Engine 10.5.1�̈ꊇ�C���X�g�[��

@echo off
REM �ȉ����Q�l�ɂ��ĕҏW���܂���
REM �Q�l�Fhttps://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

set __COMPAT_LAYER=RunAsInvoker

REM ���΃p�X�ŏ������邽�߃o�b�`�t�@�C���̎��s�f�B���N�g����ݒ�
set curpath=%~dp0


REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Engine 10.5.1�̃C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��C���X�g�[��
IF not EXIST "C:\Program Files (x86)" GOTO 32BIT

echo MSXML6 64-bit �̃C���X�g�[��...
REM install MSXML6
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_Japanese\SetupFiles\Support\Msxml6\x64\msxml6_x64.msi" /norestart /passive /qb



:32BIT
echo MSXML6 �̃C���X�g�[��...
REM install MSXML6
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_Japanese\SetupFiles\Support\Msxml6\x86\msxml6.msi" /norestart /passive /qb



REM ArcGIS Engine�{�̂̃C���X�g�[��
echo ArcGIS Engine 10.5.1 �̃C���X�g�[��... �C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM Install ArcGIS Engine 10.5.1
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_Japanese\SetupFiles\setup.msi" /norestart /passive /qb

REM ���{��p�b�N�̃C���X�g�[��
echo ArcGIS Engine 10.5.1 ���{��p�b�N �̃C���X�g�[��...
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_Japanese\SetupFiles\Supplement\EngineJapanese.msi" /norestart /passive /qb


REM �����Ή��p�b�N�̃C���X�g�[��
echo ArcGIS Engine 10.5.1 �����Ή��p�b�N �̃C���X�g�[��...
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_JpnPack\JpnPack_Engine10_5_1.msi" /norestart /passive /qb


IF not EXIST "C:\Program Files (x86)" GOTO 64BITEND

echo ArcGIS Engine 10.5.1 64-bit Background Geoprocessing �̃C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\EngineBackgroundGP_Japanese\SetupFiles\setup.msi" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.5.1�̃C���X�g�[���I��



REM �p�b�`�̃C���X�g�[��
echo �p�b�`�̃C���X�g�[���J�n

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch
C:\WINDOWS\system32\msiexec.exe /p "%curpath%\Engine_Patches\ArcGIS-1051-E-SAIAT-Patch.msp" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch 64-bit
C:\WINDOWS\system32\msiexec.exe /p "%curpath%\Engine_Patches\ArcGIS-1051-BGE-SAIAT-Patch.msp" /norestart /passive /qb

:64BITPatchesEnd

echo �p�b�`�̃C���X�g�[���I��

pause
exit /b
