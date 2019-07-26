@echo off
REM ArcGIS Desktop 10.7 �̈ꊇ�A���C���X�g�[��
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
echo ArcGIS Desktop 10.7 �̃A���C���X�g�[�����J�n���܂�


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

REM 2019/07/25 �����[�X���_
echo 01_Network Analyst Function Evaluator Patch
%windir%\System32\msiexec.exe /I "{BFB4F32E-38DF-4E8F-8180-C99FC9A14BBE}" MSIPATCHREMOVE="{4EB90006-654E-4593-8888-7894A72E1327}" /norestart /passive /qb

echo 02_Mosaic Dataset Compatibility Patch
%windir%\System32\msiexec.exe /I "{BFB4F32E-38DF-4E8F-8180-C99FC9A14BBE}" MSIPATCHREMOVE="{75A5452E-05CB-46BC-BF9A-B656E2B55E11}" /norestart /passive /qb



REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

echo 01_Network Analyst Function Evaluator Patch
%windir%\System32\msiexec.exe /I "{F4A727FC-1E11-4380-8171-5E4FF508E6CB}" MSIPATCHREMOVE="{162C01D8-EE12-4A0F-9272-B0A17FD0047E}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Dektop�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.7 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{16AE78AE-7070-44BF-981A-829DE3525727}" /norestart /passive /qb

REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.7 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{E14E7647-76BC-4874-9F4F-32D7543209B2}" /norestart /passive /qb

echo ArcGIS Desktop 10.7 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /X "{BFB4F32E-38DF-4E8F-8180-C99FC9A14BBE}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.7 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{F4A727FC-1E11-4380-8171-5E4FF508E6CB}" /norestart /passive /qb

echo ArcGIS Desktop 10.7 64-bit �����Ή��p�b�N�̃A���C���X�g�[�� ...
REM �����Ή��p�b�N 64-bit �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /X "{DE968464-F04D-4608-A99F-7411CF877173}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.7 �̃A���C���X�g�[���I��



pause
exit /b
