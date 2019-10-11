@echo off
REM ArcGIS Desktop 10.7.1 �̈ꊇ�A���C���X�g�[��
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
echo ArcGIS Desktop 10.7.1 �̃A���C���X�g�[�����J�n���܂�


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

REM 2019/10/07 �����[�X���_
echo 01_Security Update Compatibility Patch
%windir%\System32\msiexec.exe /I "{69262D87-3697-492B-ABED-765DDC15118B}" MSIPATCHREMOVE="{01005F75-83AA-4E7F-8018-989AFA007F33}" /norestart /passive /qb





REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

REM 2019/10/07 �����[�X���_�Ȃ�
REM echo 01_xxxx
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Dektop�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.7.1 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{952B6FC6-0A81-41CD-8A57-B6E4D4881AFB}" /norestart /passive /qb

REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.7.1 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{69D31292-353F-41CC-9AE9-9F409B6D2E81}" /norestart /passive /qb

echo ArcGIS Desktop 10.7.1 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /X "{69262D87-3697-492B-ABED-765DDC15118B}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.7.1 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{39E26603-505E-4CE3-ABC6-5721CADF41D3}" /norestart /passive /qb

echo ArcGIS Desktop 10.7.1 64-bit �����Ή��p�b�N�̃A���C���X�g�[�� ...
REM �����Ή��p�b�N 64-bit �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /X "{2D39FEF7-82D8-4F25-A35E-FA55AA5A1D2F}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.7.1 �̃A���C���X�g�[���I��



pause
exit /b
