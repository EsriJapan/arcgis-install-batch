@echo off
REM ArcGIS Engine 10.6 �̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Engine 10.6�̃A���C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��A���C���X�g�[��
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

echo MSXML6 64-bit �̃A���C���X�g�[��...
REM uninstall MSXML6
%windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
echo MSXML6 �̃A���C���X�g�[��...
REM uninstall MSXML6
%windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo (3)  ArcGIS 10.6 (Desktop, Engine) ECW Patch
%windir%\System32\msiexec.exe /I "{D2CD36EF-5E54-4E2F-A26A-0D99999C25D1}" MSIPATCHREMOVE="{6A6C2BCE-F201-4346-A3DB-D0B096DEFCF4}" /norestart /passive /qb

REM 07/17 ���J�̃p�b�`
echo (4)  ArcGIS 10.6 (Desktop, Engine, Server) File Deletion and Lookup Patch
%windir%\System32\msiexec.exe /I "{D2CD36EF-5E54-4E2F-A26A-0D99999C25D1}" MSIPATCHREMOVE="{BDB63730-B238-4638-A7C2-9C130A77F0CD}" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

echo (2)  ArcGIS (Desktop, Engine) Background Geoprocessing 64-bit Arcpy Exit and Shutdown Patch
%windir%\System32\msiexec.exe /I "{D635F9C0-3E5A-4D55-BEE6-36C67194D33A}" MSIPATCHREMOVE="{2F5391D2-55B2-4632-89ED-87392FF205F2}" /norestart /passive /qb

echo (3)  ArcGIS 10.6 (Desktop, Engine) ECW Patch 64-bit
%windir%\System32\msiexec.exe /I "{D635F9C0-3E5A-4D55-BEE6-36C67194D33A}" MSIPATCHREMOVE="{CDAA0C3C-511B-4D4D-ABAF-8A4C981A1FB5}" /norestart /passive /qb

REM 07/17 ���J�̃p�b�`
echo (4)  ArcGIS 10.6 (Desktop, Engine, Server) File Deletion and Lookup Patch 64-bit
%windir%\System32\msiexec.exe /I "{D635F9C0-3E5A-4D55-BEE6-36C67194D33A}" MSIPATCHREMOVE="{18CA2386-0B48-4143-A4E6-416CFBD110CE}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Engine�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.6 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{DA01F20F-26B3-4583-922D-BB173524A01E}" /norestart /passive /qb

REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.6 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{EE98CB93-7A67-4806-B628-06E0CDC9544C}" /norestart /passive /qb

echo ArcGIS Engine 10.6 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM uninstall ArcGIS Engine 10.6
%windir%\System32\msiexec.exe /X "{D2CD36EF-5E54-4E2F-A26A-0D99999C25D1}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.6 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{D635F9C0-3E5A-4D55-BEE6-36C67194D33A}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.6 �̃A���C���X�g�[���I��



pause
exit /b
