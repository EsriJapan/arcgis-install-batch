@echo off
REM ArcGIS Engine 10.7.1 �̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Engine 10.7.1�̃A���C���X�g�[�����J�n���܂�


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

echo 01_Security Update Compatibility Patch
%windir%\System32\msiexec.exe /I "{69262D87-3697-492B-ABED-765DDC15118B}" MSIPATCHREMOVE="{01005F75-83AA-4E7F-8018-989AFA007F33}" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

REM �Ȃ�echo 01_
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Engine�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.7.1 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{387950BD-0BB6-4EDF-9D42-493212554066}" /norestart /passive /qb


REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.7.1 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{15FF51A8-F46D-415D-8B03-5EB1ADAA7E26}" /norestart /passive /qb


echo ArcGIS Engine 10.7.1 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM uninstall ArcGIS Engine 10.7.1
%windir%\System32\msiexec.exe /X "{E06EB984-F5AD-4339-A7C3-5D9035191843}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.7.1 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{1AD97CB6-412C-49FC-85D7-14002C369D01}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.7.1 �̃A���C���X�g�[���I��



pause
exit /b
