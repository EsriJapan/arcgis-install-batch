@echo off
REM ArcGIS Desktop 10.6 �̈ꊇ�A���C���X�g�[��
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
echo ArcGIS Desktop 10.6 �̃A���C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��A���C���X�g�[��
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

echo MSXML6 64-bit �̃A���C���X�g�[��...
REM install MSXML6
%windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
echo MSXML6 �̃A���C���X�g�[��...
REM install MSXML6
%windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo (3)  ArcGIS 10.6 (Desktop, Engine) ECW Patch
%windir%\System32\msiexec.exe /I "{F8206086-367E-44E4-9E24-92E9E057A63D}" MSIPATCHREMOVE="{319673B3-85AF-4A2C-B18C-32565DC02580}" /norestart /passive /qb



REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

echo (2)  ArcGIS (Desktop, Engine) Background Geoprocessing 64-bit Arcpy Exit and Shutdown Patch
%windir%\System32\msiexec.exe /I "{D9A37390-98EF-4DDD-BD1E-06BBADFE8CE6}" MSIPATCHREMOVE="{8DACF84A-3221-4BBE-887D-95F9E08CAB1E}" /norestart /passive /qb

echo (3)  ArcGIS 10.6 (Desktop, Engine) ECW Patch 64-bit
%windir%\System32\msiexec.exe /I "{D9A37390-98EF-4DDD-BD1E-06BBADFE8CE6}" MSIPATCHREMOVE="{EB32DE36-DEC7-4B6F-BBF9-E46EA5C3BBC3}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Dektop�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.6 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{9803548D-4631-423B-857F-09D32E7E6627}" /norestart /passive /qb

REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.6 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{FCEA04C0-BA4D-4351-B18E-DF626455A05A}" /norestart /passive /qb

echo ArcGIS Desktop 10.6 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /X "{F8206086-367E-44E4-9E24-92E9E057A63D}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.6 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{D9A37390-98EF-4DDD-BD1E-06BBADFE8CE6}" /norestart /passive /qb

echo ArcGIS Desktop 10.6 64-bit �����Ή��p�b�N�̃A���C���X�g�[�� ...
REM �����Ή��p�b�N 64-bit �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /X "{FBFF340D-8ECE-43A3-87FC-A694DB829614}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.6 �̃A���C���X�g�[���I��



pause
exit /b
