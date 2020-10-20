@echo off
REM ArcGIS Desktop 10.8.1 �̈ꊇ�A���C���X�g�[��
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



REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Desktop 10.8.1 �̃A���C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��A���C���X�g�[��
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1�ł�MSXML�̓C���X�g�[���ɂȂ�
REM echo MSXML6 64-bit �̃A���C���X�g�[��...
REM install MSXML6
REM %windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
REM echo MSXML6 �̃A���C���X�g�[��...
REM install MSXML6
REM %windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

REM 2020/10/20 �����[�X���_�Ȃ�

REM echo 01_xxxx Patch
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb



REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

REM 2020/10/20 �����[�X���_�Ȃ�
REM echo 01_xxx Patch 64-bit
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Dektop�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.8.1 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{843FEFEF-1999-4001-AE4B-A17087321697}" /norestart /passive /qb

REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.8.1 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{30C370B7-CFD0-4A12-A5E8-59DF8D4A2368}" /norestart /passive /qb

echo ArcGIS Desktop 10.8.1 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM UnInstall ArcGIS Desktop 10.8.1
%windir%\System32\msiexec.exe /X "{7C4FF945-CE6A-415E-8EB9-2B61B0B35DCD}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.8.1 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{1EBC0FD8-8A64-4E8C-9565-F9784A3B96D2}" /norestart /passive /qb

echo ArcGIS Desktop 10.8.1 64-bit �����Ή��p�b�N�̃A���C���X�g�[�� ...
REM �����Ή��p�b�N 64-bit �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /X "{00CDF114-54AE-4DF9-AB58-E12C9B6E8EBA}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.8.1 �̃A���C���X�g�[���I��



pause
exit /b
