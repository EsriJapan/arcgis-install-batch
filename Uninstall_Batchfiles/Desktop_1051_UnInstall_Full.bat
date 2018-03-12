REM ArcGIS Desktop 10.5.1�̈ꊇ�A���C���X�g�[��

@echo off
REM �R�}���h�ł̎��s�̏ꍇ
REM MSI�t�@�C���̃A���C���X�g�[��
REM msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM MSP�t�@�C���̃A���C���X�g�[��
REM msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>

set __COMPAT_LAYER=RunAsInvoker



REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Desktop 10.5.1�̃A���C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��A���C���X�g�[��
IF not EXIST "C:\Program Files (x86)" GOTO 32BIT

echo MSXML6 64-bit �̃A���C���X�g�[��...
REM install MSXML6
C:\WINDOWS\system32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
echo MSXML6 �̃A���C���X�g�[��...
REM install MSXML6
C:\WINDOWS\system32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch
C:\WINDOWS\system32\msiexec.exe /I "{4740FC57-60FE-45BB-B513-3309F6B73183}" MSIPATCHREMOVE="{047113C9-BFDD-4E66-AA4B-EC9D988E4B22}" /norestart /passive /qb

REM 2018/02/18���J�p�b�`
echo (6)  ArcGIS 10.5.1 (Desktop, Server) NITF and NCDRD Quality Patch 1
C:\WINDOWS\system32\msiexec.exe /I "{4740FC57-60FE-45BB-B513-3309F6B73183}" MSIPATCHREMOVE="{C34D5F69-4CF9-4780-8148-04B43A69D2AE}" /norestart /passive /qb

REM 2018/03/07���J�p�b�`
echo (8) ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Zonal Statistics Tool Patch
C:\WINDOWS\system32\msiexec.exe /I "{4740FC57-60FE-45BB-B513-3309F6B73183}" MSIPATCHREMOVE="{30D7F1D5-5ADD-45A1-ACA7-FC9A46BAED0C}" /norestart /passive /qb

REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch 64-bit
C:\WINDOWS\system32\msiexec.exe /I "{C444EB5E-7CC1-4F05-A17E-0632F3F20071}" MSIPATCHREMOVE="{154C2436-869F-4436-8561-B79E683639A1}" /norestart /passive /qb

REM 2018/02/28���J�p�b�`
echo (7) ArcGIS (Desktop, Engine) Background Geoprocessing 64-bit Arcpy Exit and Shutdown Patch
C:\WINDOWS\system32\msiexec.exe /I "{C444EB5E-7CC1-4F05-A17E-0632F3F20071}" MSIPATCHREMOVE="{7616FB80-AAB3-4F23-9D9F-E3E32BCB577D}" /norestart /passive /qb

REM 2018/03/07���J�p�b�`
echo (8) ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Zonal Statistics Tool Patch 64-bit
C:\WINDOWS\system32\msiexec.exe /I "{C444EB5E-7CC1-4F05-A17E-0632F3F20071}" MSIPATCHREMOVE="{1035065C-4329-4F03-935C-4FA27E736343}" /norestart /passive /qb

:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Dektop�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.5.1 �����Ή��p�b�N �̃A���C���X�g�[��...
C:\WINDOWS\system32\msiexec.exe /X "{E9BDD1F8-59BC-4432-BAA4-F00E7EC9C817}" /norestart /passive /qb

REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.5.1 ���{��p�b�N �̃A���C���X�g�[��...
C:\WINDOWS\system32\msiexec.exe /X "{782A3F72-D49F-4233-A6B6-A699558A8E44}" /norestart /passive /qb

echo ArcGIS Desktop 10.5.1 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM Install ArcGIS Desktop 10.5.1
C:\WINDOWS\system32\msiexec.exe /X "{4740FC57-60FE-45BB-B513-3309F6B73183}" /norestart /passive /qb



IF not EXIST "C:\Program Files (x86)" GOTO 64BITEND

echo ArcGIS Desktop 10.5.1 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
C:\WINDOWS\system32\msiexec.exe /X "{C444EB5E-7CC1-4F05-A17E-0632F3F20071}" /norestart /passive /qb

echo ArcGIS Desktop 10.5.1 64-bit �����Ή��p�b�N�̃A���C���X�g�[�� ...
REM �����Ή��p�b�N 64-bit �̃A���C���X�g�[��
C:\WINDOWS\system32\msiexec.exe /X "{8B2AF548-1E76-4DFB-ACE2-FDD4EF829E27}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.5.1�̃A���C���X�g�[���I��



pause
exit /b
