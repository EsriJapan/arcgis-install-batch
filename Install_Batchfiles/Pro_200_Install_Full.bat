REM ArcGIS Pro 2.0�̈ꊇ�C���X�g�[��

@echo off
REM �ȉ����Q�l�ɂ��ĕҏW���܂���
REM �Q�l�Fhttps://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

set __COMPAT_LAYER=RunAsInvoker

REM ���΃p�X�ŏ������邽�߃o�b�`�t�@�C���̎��s�f�B���N�g����ݒ�
set curpath=%~dp0


REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Pro 2.0 �̃C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��C���X�g�[��
REM Pro�͎��O�ɕK�v�Ȃ��̂�.NET Framework 4.6.1


REM ArcGIS Pro �{�̂̃C���X�g�[��
echo ArcGIS Pro 2.0 �{�̂̃C���X�g�[��... �C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 /norestart /passive /qb

REM ArcGIS Pro ���{��p�b�N�̃C���X�g�[��
echo ArcGIS Pro 2.0 ���{��p�b�N �̃C���X�g�[��...
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb


REM ArcGIS Help�C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃C���X�g�[��...
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\ArcGISProHelp_Japanese\ArcGISProHelp_Japanese.msi" /norestart /passive /qb


echo ArcGIS Pro 2.0 �̃C���X�g�[���I��



REM �p�b�`�̃C���X�g�[��
echo �p�b�`�̃C���X�g�[���J�n

echo ArcGIS Pro 2.0 Patch 1�̃C���X�g�[�� 
C:\WINDOWS\system32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_201_158434.msp" /norestart /passive /qb


echo �p�b�`�̃C���X�g�[���I��

REM ���̑�:ArcGIS Pro 2.0 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{���Ȃǂ̓o�b�`�ł́H
echo ��1)ArcGIS Pro 2.0 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăC���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăC���X�g�[�����Ă�������


pause
exit /b
