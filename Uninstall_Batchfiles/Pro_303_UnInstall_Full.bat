@echo off
REM ------------------------------
REM ArcGIS Pro 3.0 �̈ꊇ�A���C���X�g�[��
REM ------------------------------

REM 
REM MSI�t�@�C���̃A���C���X�g�[�� �R�}���h
REM >msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM ��1)MSI��GUID�̒l�́uorca�v�� *.msi���J���A[Tables] > [Property] > [ProductCode]�̒l���w�肵�܂�
REM 
REM MSP�t�@�C���̃A���C���X�g�[�� �R�}���h
REM >msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
REM ��2)msp��GUID�̒l�́uorca�v�� *.msp���J���A[View]���j���[ > [Summary Information]�̉�ʂ�
REM [Patch Code]=<PatchGUID> �� [Targets]=<ProductGUID> �̒l���w�肵�܂�
REM 

REM 
REM �o�b�`�t�@�C���Ɋ܂߂Ă���v���_�N�g
REM 
REM �o�b�`�t�@�C���Ɋ܂߂ăv���_�N�g�� Pro_300_Install_Full.bat �Ɋ܂߂Ă��鎟�̂��̂ł��B
REM 
REM ---�v���_�N�g �R���|�[�l���g---
REM ArcGIS Pro
REM ArcGIS Pro 3.0 Patch 1 �i3.0.1�j
REM ArcGIS Pro �I�t���C�� �w���v
REM ArcGIS Data Interoperability for Pro �i�p��j
REM ---�f�[�^�ƃR���e���c---
REM ArcGIS Coordinate Systems Data �i�p��j
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.03 �̈ꊇ�A���A���C���X�g�[�� �̑Ώ�
echo -----------------------------------
echo �EArcGIS Pro
echo �EArcGIS Pro 3.0 Patch 5 �i3.0.5�j
echo �EArcGIS Pro 3.0 Patch 4 �i3.0.4�j
echo �EArcGIS Pro �I�t���C�� �w���v
echo �EArcGIS Data Interoperability for Pro �i�p��j
echo �EArcGIS Coordinate Systems Data �i�p��j
echo.

set __COMPAT_LAYER=RunAsInvoker


REM �f�X�N�g�b�v�̃A���C���X�g�[��
echo ArcGIS Pro 3.03 �̃A���C���X�g�[�����J�n���܂�


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 3.0 Patch 5 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{690B606E-8A38-4CB9-B088-241F60A86072}" MSIPATCHREMOVE="{403EA9FB-5C29-4EB8-BDA2-702D71AB1F92}" /norestart /passive /qb

echo ArcGIS Pro 3.0 Patch 4 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{690B606E-8A38-4CB9-B088-241F60A86072}" MSIPATCHREMOVE="{C7381E1E-48E6-47D4-9071-13B46A7F91BC}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��
echo.

REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{F99779CB-33F4-4356-8BE5-6AED1619DF37}" /norestart /passive /qb
echo �I�t���C�� �w���v �̃A���C���X�g�[���I��
echo.

REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 3.03 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{0862710F-7945-4B24-A6E2-8CAF11A565DA}" /norestart /passive /qb
echo ���{��p�b�N �̃A���C���X�g�[���I��
echo.

REM ArcGIS Coordinate Systems Data �̃A���C���X�g�[��
echo ArcGIS Coordinate Systems Data �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{C338A9BB-6D4C-4033-B78B-803D53B73F63}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data �A���C���X�g�[���I��
echo.

REM Data Interoperability �̃A���C���X�g�[��
REM echo ArcGIS Pro 3.0 Data Interoperability �̃A���C���X�g�[��...
REM %windir%\System32\msiexec.exe /X "{78E79722-2A97-4CA9-A3FF-B45D3DD7D7FA}" /norestart /passive /qb
REM echo ArcGIS Pro 3.0 Data Interoperability �A���C���X�g�[���I��
REM echo.

REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 3.03 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{690B606E-8A38-4CB9-B088-241F60A86072}" /norestart /passive /qb
echo ArcGIS Pro 3.03 �̃A���C���X�g�[���I��
echo.


REM ���̑�:ArcGIS Pro �p ST_Geometry ���C�u���� �� ODBC Driver�Ȃǂ͕K�v�ɉ�����
REM ���̑�:���{�p�n�}�V���{���Ȃ�
echo.
echo ��1)ArcGIS Pro 3.03 �p �f�[�^�x�[�X�T�|�[�g�t�@�C�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���̑��A�ϊ��c�[���A���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo.

pause
exit /b
