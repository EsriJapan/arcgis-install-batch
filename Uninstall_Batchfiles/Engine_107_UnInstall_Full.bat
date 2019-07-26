@echo off
REM ArcGIS Engine 10.7 �̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Engine 10.7�̃A���C���X�g�[�����J�n���܂�


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

echo 01_Network Analyst Function Evaluator Patch
%windir%\System32\msiexec.exe /I "{F95F3DF6-7674-43C2-8567-2C668DC7C837}" MSIPATCHREMOVE="{E186BD72-41E7-4B27-BC21-C9CBDB0EC35A}" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd


echo 01_Network Analyst Function Evaluator Patch 64-bit
%windir%\System32\msiexec.exe /I "{F07405DD-739A-4DF0-BE53-34573E1BECF7}" MSIPATCHREMOVE="{DABC78F4-0E23-477A-9F65-9B03B3A09DD3}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Engine�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.7 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{F504250C-93B9-4731-8076-0955922286C8}" /norestart /passive /qb


REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.7 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{C636CA4E-1960-4D09-99A0-A4A9151E865C}" /norestart /passive /qb


echo ArcGIS Engine 10.7 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM uninstall ArcGIS Engine 10.7
%windir%\System32\msiexec.exe /X "{F95F3DF6-7674-43C2-8567-2C668DC7C837}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.7 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{F07405DD-739A-4DF0-BE53-34573E1BECF7}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.7 �̃A���C���X�g�[���I��



pause
exit /b
