@echo off
REM ArcGIS Engine 10.8.1 �̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Engine 10.8.1 �̃A���C���X�g�[�����J�n���܂�


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

REM 2020/10/20 �����[�X���_�Ȃ�
REM echo 01_xxxx Patch
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

REM 2020/10/xx �����[�X���_
REM echo 01_xxx Patch 64-bit
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Engine�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.8.1 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{9F5EAB94-38E7-45B6-9967-64EFCEB11ECD}" /norestart /passive /qb


REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.8.1 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{6C888356-4ABF-44C1-A4C6-8AE170A2945C}" /norestart /passive /qb


echo ArcGIS Engine 10.8.1 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM UnInstall ArcGIS Engine 10.8
%windir%\System32\msiexec.exe /X "{F7B59921-A34C-42DB-87ED-DDEE8FCC7B45}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.8.1 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{2355C02B-A920-4B1E-8301-CC7830793A10}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.8.1 �̃A���C���X�g�[���I��



pause
exit /b
