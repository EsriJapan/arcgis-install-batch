@echo off
REM ArcGIS Engine 10.8.2 �̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Engine 10.8.2 �̃A���C���X�g�[�����J�n���܂�


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

REM 2022/06/xx �����[�X���_�Ȃ�
REM echo 01_xxxx Patch
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

REM 2022/06/xx �����[�X���_�Ȃ�
REM echo 01_xxx Patch 64-bit
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Engine�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.8.2 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{3DEAF8E6-8B11-4499-8EBF-4582A5051499}" /norestart /passive /qb


REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.8.2 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{71AB0946-4208-4D11-B0BD-E270D642F809}" /norestart /passive /qb


echo ArcGIS Engine 10.8.2 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM UnInstall ArcGIS Engine 10.8.2
%windir%\System32\msiexec.exe /X "{CDD2DD75-7054-4BBA-AA76-11378B4F5556}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.8.2 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{D14CDD57-312A-4611-AE0C-7F63354413AC}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.8.2 �̃A���C���X�g�[���I��



pause
exit /b
