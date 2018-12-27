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
echo ArcGIS Desktop 10.6.1 �̃A���C���X�g�[�����J�n���܂�


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

echo 01_Buffering Degenerated Polygon Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{70E7DEB8-4A1B-4381-81B9-BE28D7337428}" /norestart /passive /qb

echo 02_Geoprocessing Service Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{0E1A2EDB-F55E-475C-B5CE-31736BD15B6C}" /norestart /passive /qb

echo 03_JPEG NoData Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{4EEC5CFB-4D59-4240-8D7B-F818CC70CD72}" /norestart /passive /qb

echo 04_Buffer Wizard Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{C60D7F0E-BF3A-4D38-B406-FFC600ACCAE2}" /norestart /passive /qb

echo 05_Raster Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{FDDBE7B8-16B9-4E29-BF34-0D64BF4CB384}" /norestart /passive /qb

REM 2018/12/14���J�p�b�`
echo 06_PostgreSQL Performance and Version 10 Support Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{550BB9FA-A975-43D0-816F-57402BDEE06A}" /norestart /passive /qb

REM 2018/12/21���J�p�b�`
echo 07_Published Script Tools Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{8AFF43C7-6136-4CAD-AA65-D56C652AD0F4}" /norestart /passive /qb

REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

echo 01_Buffering Degenerated Polygon Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{5CEBD126-1C98-4B90-BA5C-191EA0C17A25}" /norestart /passive /qb

echo 02_Geoprocessing Service Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{0187A1E4-96D0-44FE-B70E-B789BA16FC9C}" /norestart /passive /qb

echo 03_JPEG NoData Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{880FF969-6CC6-4AF7-8672-F55865FE871D}" /norestart /passive /qb

REM 2018/12/14���J�p�b�`
echo 06_PostgreSQL Performance and Version 10 Support Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{C71BA958-91E9-4846-86AF-1583FFD04C15}" /norestart /passive /qb

REM 2018/12/21���J�p�b�`
echo 07_Published Script Tools Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{1D40BDE0-B6D8-402B-82F5-47869A5946ED}" /norestart /passive /qb

:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Dektop�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.6.1 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{78D30A4B-0615-4FD5-85F2-0C24685CE644}" /norestart /passive /qb

REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.6.1 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{712C033E-5E24-4493-9E65-90F715E39348}" /norestart /passive /qb

echo ArcGIS Desktop 10.6.1 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /X "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.6.1 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" /norestart /passive /qb

echo ArcGIS Desktop 10.6.1 64-bit �����Ή��p�b�N�̃A���C���X�g�[�� ...
REM �����Ή��p�b�N 64-bit �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /X "{CC15B695-CA16-4ED7-8736-1DEB499A9204}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.6.1 �̃A���C���X�g�[���I��



pause
exit /b
