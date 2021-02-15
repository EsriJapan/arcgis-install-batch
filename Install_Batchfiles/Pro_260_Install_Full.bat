@echo off
REM 
REM ArcGIS Pro 2.6�̈ꊇ�C���X�g�[��
REM 

REM �ȉ����Q�l�ɂ��ĕҏW���܂���
REM �Q�l�Fhttps://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

REM �o�b�`�ł�.NET Framework �̃o�[�W�����`�F�b�N�͈ȉ����Q�l�ɂ��܂����B
REM �Q�l:https://www.atmarkit.co.jp/ait/articles/1210/26/news086.html

REM ���W�X�g���̒l��MS�̃T�C�g�ɂ���܂��B
REM �Q�l:https://docs.microsoft.com/ja-jp/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
REM   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full
REM   .NET Framework 4.8 �̏ꍇ�� Release REG_DWORD �l 528040

set __COMPAT_LAYER=RunAsInvoker

REM ���΃p�X�ŏ������邽�߃o�b�`�t�@�C���̎��s�f�B���N�g����ݒ�
set curpath=%~dp0


REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Pro 2.6 �̃C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��C���X�g�[���`�F�b�N
REM Pro 2.6 �Ŏ��O�ɕK�v�Ȃ��̂�.NET Framework 4.8
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
REM echo .NET Framework 4.8 ���m�F���܂����B�C���X�g�[���\�ł��B


REM ArcGIS Pro �{�̂̃C���X�g�[��
echo ArcGIS Pro 2.6 �{�̂̃C���X�g�[��... �C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 /norestart /passive /qb

REM ArcGIS Pro ���{��p�b�N�̃C���X�g�[��
echo ArcGIS Pro 2.6 ���{��p�b�N �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb


REM ArcGIS Help�C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃C���X�g�[��...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISProHelp_Japanese\ArcGISProHelp_Japanese.msi" /norestart /passive /qb


echo ArcGIS Pro 2.6 �̃C���X�g�[���I��



REM �p�b�`�̃C���X�g�[��
echo �p�b�`�̃C���X�g�[���J�n


REM echo ArcGIS Pro 2.6 Patch 1 �̃C���X�g�[�� 
REM %windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_261_175064.msp" /norestart /passive /qb
echo ArcGIS Pro 2.6 Patch 4 �̃C���X�g�[�� 
%windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_264_176708.msp" /norestart /passive /qb

echo �p�b�`�̃C���X�g�[���I��

REM ���̑�:ArcGIS Pro 2.0 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{���Ȃǂ̓o�b�`�ł́H
echo ��1)ArcGIS Pro 2.6 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăC���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăC���X�g�[�����Ă�������


:NETNG
echo ���O������ .NET Framework 4.8 ���m�F�ł��Ȃ����߁A�C���X�g�[�����p���ł��܂���B
GOTO EXITEND

:EXITEND

pause
exit /b
