@echo off
REM ArcGIS Engine 10.8 �̈ꊇ�A���C���X�g�[��

REM MSI�t�@�C���̃A���C���X�g�[�� �R�}���h
REM >msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM ��1)MSI��GUID�̒l�́uorca�v�� *.msi���J���A[Tables] > [Property] > [ProductCode]�̒l���w�肵�܂�
REM 
REM MSP�t�@�C���̃A���C���X�g�[�� �R�}���h
REM >msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
REM ��2)msp��GUID�̒l�́uorca�v�� *.msp���J���A[View]���j���[ > [Summary Information]�̉�ʂ�
REM [Patch Code]=<PatchGUID>��[Targets]=<ProductGUID>�̒l���w�肵�܂�
REM 

set __COMPAT_LAYER=RunAsInvoker



REM Engine�̃A���C���X�g�[��
echo ArcGIS Engine 10.8 �̃A���C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��A���C���X�g�[��
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1 �ł� MSXML �̃C���X�g�[�����Ȃ��Ȃ��Ă���
REM echo MSXML6 64-bit �̃A���C���X�g�[��...
REM uninstall MSXML6
REM %windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
REM 10.6.1 �ł� MSXML �̃C���X�g�[�����Ȃ��Ȃ��Ă���
REM echo MSXML6 �̃A���C���X�g�[��...
REM uninstall MSXML6
REM %windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

REM 2020/05/18 �����[�X���_
echo 01_ArcGIS (Desktop, Engine, Server) 10.8 SQL Server Enterprise Geodatabase Upgrade Patch
%windir%\System32\msiexec.exe /I "{C75EB22D-BD9B-4850-9D98-99473B0E3F42}" MSIPATCHREMOVE="{C182BDA4-F8D3-4054-9FCD-EF351CAFE39C}" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

REM 2020/05/18 �����[�X���_
echo 01_ArcGIS (Desktop, Engine, Server) 10.8 SQL Server Enterprise Geodatabase Upgrade Patch 64-bit
%windir%\System32\msiexec.exe /I "{CBFABCF9-946F-4819-84F7-96F9EC9F7435}" MSIPATCHREMOVE="{C9D5E5E8-4104-4451-8E77-7210DB4738F5}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Engine�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.8 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{2797681C-E72D-4C68-95C8-DBB4BD82CA6A}" /norestart /passive /qb


REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.8 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{0074B51C-EDD6-4A0F-96E3-797526B9209F}" /norestart /passive /qb


echo ArcGIS Engine 10.8 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM UnInstall ArcGIS Engine 10.8
%windir%\System32\msiexec.exe /X "{C75EB22D-BD9B-4850-9D98-99473B0E3F42}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.8 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{CBFABCF9-946F-4819-84F7-96F9EC9F7435}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.8 �̃A���C���X�g�[���I��



pause
exit /b
