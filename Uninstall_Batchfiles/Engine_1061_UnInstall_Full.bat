@echo off
REM ArcGIS Engine 10.6.1 �̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Engine 10.6.1�̃A���C���X�g�[�����J�n���܂�


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

echo (1) 01_Buffering Degenerated Polygon Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{1AA6EBD3-A12F-422A-85BF-D01A8F43D795}" /norestart /passive /qb

echo (2) 02_Geoprocessing Service Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{AE23910B-E6C7-4378-925C-ED91D9449638}" /norestart /passive /qb

echo (3) 03_JPEG NoData Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{6D796814-1DFE-465F-B15F-918C9EBF0139}" /norestart /passive /qb


REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd


echo (1) 01_Buffering Degenerated Polygon Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{A897D6E4-A5F6-419A-9850-4B3E14871AAC}" /norestart /passive /qb

echo (2) 02_Geoprocessing Service Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{29B2E4DB-3919-4D8A-A28F-65C01C151235}" /norestart /passive /qb

echo (3) 03_JPEG NoData Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{53A67CE4-D316-4CA2-952A-72C5D57856E1}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Engine�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.6.1 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{A3C5F85D-2AB4-4051-BCB0-0C238CF5432B}" /norestart /passive /qb


REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Engine 10.6.1 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{BEB91F7C-CD24-40E8-8A17-C6B54470C9A6}" /norestart /passive /qb


echo ArcGIS Engine 10.6.1 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM uninstall ArcGIS Engine 10.6
%windir%\System32\msiexec.exe /X "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.6.1 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.6.1 �̃A���C���X�g�[���I��



pause
exit /b
