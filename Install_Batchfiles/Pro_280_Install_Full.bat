@echo off
REM ------------------------------
REM ArcGIS Pro 2.8 �̈ꊇ�C���X�g�[��
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

REM 
REM �o�b�`�t�@�C���Ɋ܂߂Ă���v���_�N�g
REM 
REM �o�b�`�t�@�C���Ɋ܂߂ăv���_�N�g�� My Esri ����_�E�����[�h���鎟�̂��̂ł��B
REM 
REM ---�v���_�N�g �R���|�[�l���g---
REM ArcGIS Pro
REM ArcGIS Pro 2.8 Patch 1 �i2.8.1�j
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
echo ArcGIS Pro 2.8 �̈ꊇ�C���X�g�[�� �̑Ώ�
echo -----------------------------------
echo �EArcGIS Pro
echo �EArcGIS Pro 2.8 Patch 1 �i2.8.1�j
echo �EArcGIS Pro �I�t���C�� �w���v
REM echo �EArcGIS Data Interoperability for Pro �i�p��j
echo �EArcGIS Coordinate Systems Data �i�p��j
echo.

set __COMPAT_LAYER=RunAsInvoker

REM ���΃p�X�ŏ������邽�߃o�b�`�t�@�C���̎��s�f�B���N�g����ݒ�
set curpath=%~dp0


REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Pro 2.8 �̃C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��C���X�g�[���`�F�b�N
REM Pro 2.8 �Ŏ��O�ɕK�v�Ȃ��̂�.NET Framework 4.8
REM ���W�X�g���l���`�F�b�N
REM reg query "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" /v "Release"
REM .NET �ł� Release �l��MS�̃T�C�g�ɋL�ڂ���Ă���
REM https://docs.microsoft.com/ja-jp/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
REM 528040(80ea8) - .NET 4.8
set /A COMPNET = 528040
echo .NET Framework �̃o�[�W�������`�F�b�N���܂�...
FOR /F "tokens=1,2,*" %%I IN ('REG QUERY "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" /v "Release"') DO (
  REM SET /A VAL = %%K �Ő��l�Ƃ��Ċi�[
  IF "%%I"=="Release" SET /A NETVAL=%%K
)

IF %NETVAL% geq %COMPNET% (
  GOTO NETOK
) else (
  GOTO NETNG
)

:NETOK
echo .NET Framework 4.8 ���m�F���܂����B�C���X�g�[���\�ł��B
echo.

REM ArcGIS Pro �{�̂̃C���X�g�[��
REM 2.8 ����G���h ���[�U�[�g�p�����_�� (EULA)��ACCEPTEULA���K�{�p�����[�^�Ƃ��Ēǉ�
REM ArcGIS Pro�̃T�C�����g�C���X�g�[�����̃p�����[�^�ڍׂ̓C���X�g�[���K�C�h�ɋL�ڂ���Ă��܂�
REM https://pro.arcgis.com/ja/pro-app/latest/get-started/arcgis-pro-installation-administration.htm
echo ArcGIS Pro 2.8 �{�̂̃C���X�g�[��... �C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 ACCEPTEULA=YES /norestart /passive /qb

REM ArcGIS Pro ���{��p�b�N�̃C���X�g�[��
echo ArcGIS Pro 2.8 ���{��p�b�N �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb


REM ArcGIS Help�C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISProHelp_Japanese\ArcGISProHelp_Japanese.msi" /norestart /passive /qb


echo ArcGIS Pro 2.8 �̃C���X�g�[���I��
echo.


REM �p�b�`�̃C���X�g�[��
echo �p�b�`�̃C���X�g�[���J�n


echo ArcGIS Pro 2.8 Patch 1 �̃C���X�g�[��...
%windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_281_177644.msp" /norestart /passive /qb


echo �p�b�`�̃C���X�g�[���I��
echo.

REM ArcGIS Coordinate Systems Data �̃C���X�g�[��
echo ArcGIS Coordinate Systems Data �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\CoordinateSystemsData\SetupFiles\CSD.msi" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data �̃C���X�g�[���I��
echo.

REM Data Interoperability �̃C���X�g�[��
REM echo ArcGIS Pro 2.8 Data Interoperability �̃C���X�g�[��...
REM %windir%\System32\msiexec.exe /I "%curpath%\ArcGISProDataInterop\DataInteropPro.msi" ALLUSERS=1 /norestart /passive /qb

REM echo ArcGIS Pro 2.8 Data Interoperability �̃C���X�g�[���I��
REM echo.



REM ���̑�:ArcGIS Pro �p ST_Geometry ���C�u���� �� ODBC Driver�Ȃǂ͕K�v�ɉ�����
REM ���̑�:���{�p�n�}�V���{���Ȃ�
echo.
echo ��1)ArcGIS Pro 2.8 �p �f�[�^�x�[�X�T�|�[�g�t�@�C�� �͕K�v�ɉ�����My Esri������肵�ăC���X�g�[�����Ă�������
echo ��2)���̑��A�ϊ��c�[���A���{�p�n�}�V���{�� �͕K�v�ɉ�����ArcGIS ���\�[�X�W�ihttps://doc.esrij.com/pro/get-started/setup/user/�j���Q�Ƃ̏�A�C���X�g�[�����Ă�������
echo.

GOTO EXITEND

:NETNG
echo ���O������ .NET Framework 4.8 ���m�F�ł��Ȃ����߁A�C���X�g�[�����p���ł��܂���B
GOTO EXITEND

:EXITEND

pause
exit /b
