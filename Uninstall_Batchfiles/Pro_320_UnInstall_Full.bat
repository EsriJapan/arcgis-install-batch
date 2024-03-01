@echo off
REM ------------------------------
REM ArcGIS Pro 3.2 �̈ꊇ�A���C���X�g�[��
REM ------------------------------

REM 
REM MSI�t�@�C���̃A���C���X�g�[�� �R�}���h
REM >msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM ��1)MSI��GUID�̒l�́uorca�v�� *.msi���J���A[Tables] > [Property] > [ProductCode]�̒l���w�肵�܂�
REM 
REM MSP�t�@�C���̃A���C���X�g�[�� �R�}���h
REM >msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
REM ��2)msp��GUID�̒l�́uorca�v�� *.msp���J���A[View]���j���[ > [Summary Information]�̉�ʂ�
REM [Targets]=<ProductGUID> �� [Patch Code]=<PatchGUID> �̒l���w�肵�܂�
REM 

REM 
REM �o�b�`�t�@�C���Ɋ܂߂Ă���v���_�N�g
REM 
REM �o�b�`�t�@�C���Ɋ܂߂ăv���_�N�g�� Pro_320_Install_Full.bat �Ɋ܂߂Ă��鎟�̂��̂ł��B
REM 
REM ---�v���_�N�g �R���|�[�l���g---
REM ArcGIS Pro
REM ArcGIS Pro 3.2 Patch 1 �i3.2.1�j
REM ArcGIS Pro 3.2 Patch 2 �i3.2.2�j
REM ArcGIS Pro �I�t���C�� �w���v
REM ArcGIS Data Interoperability for Pro �i�p��j
REM ---�f�[�^�ƃR���e���c---
REM ArcGIS Coordinate Systems Data �i�p��j
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.2 �̈ꊇ�A���A���C���X�g�[�� �̑Ώ�
echo -----------------------------------
echo �EArcGIS Pro
echo �EArcGIS Pro 3.2 Patch 1 �i3.2.1�j
echo �EArcGIS Pro 3.2 Patch 2 �i3.2.2�j
echo �EArcGIS Pro �I�t���C�� �w���v
REM echo �EArcGIS Data Interoperability for Pro �i�p��j
echo �EArcGIS Coordinate Systems Data �i�p��j
echo.

set __COMPAT_LAYER=RunAsInvoker


REM �f�X�N�g�b�v�̃A���C���X�g�[��
echo ArcGIS Pro 3.2 �̃A���C���X�g�[�����J�n���܂�


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 3.2 Patch 2 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{76DFAD3E-96C5-4544-A6B4-3774DBF88B4E}" MSIPATCHREMOVE="{4DB9A345-FC1D-4798-BF01-161C077EE73F}" /norestart /passive /qb

echo ArcGIS Pro 3.2 Patch 1 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{76DFAD3E-96C5-4544-A6B4-3774DBF88B4E}" MSIPATCHREMOVE="{2A5E0C4A-1C0D-429C-BEEF-C6D452DC51CB}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��
echo.

REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{2155C707-CEE9-4B4B-86FD-4393ED012765}" /norestart /passive /qb
echo �I�t���C�� �w���v �̃A���C���X�g�[���I��
echo.

REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 3.2 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{5406B1BB-6FB9-4334-87D1-A653D2A70610}" /norestart /passive /qb
echo ���{��p�b�N �̃A���C���X�g�[���I��
echo.

REM ArcGIS Coordinate Systems Data �̃A���C���X�g�[��
echo ArcGIS Coordinate Systems Data �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{E54143C4-7364-4146-9241-E04027429033}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data �A���C���X�g�[���I��
echo.

REM Data Interoperability �̃A���C���X�g�[��
REM echo ArcGIS Pro 3.2 Data Interoperability �̃A���C���X�g�[��...
REM %windir%\System32\msiexec.exe /X "{7FFFFCBC-0C97-4B5A-9A5D-74A79D0C43AF}" /norestart /passive /qb
REM echo ArcGIS Pro 3.2 Data Interoperability �A���C���X�g�[���I��
REM echo.

REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 3.2 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{76DFAD3E-96C5-4544-A6B4-3774DBF88B4E}" /norestart /passive /qb
echo ArcGIS Pro 3.2 �̃A���C���X�g�[���I��
echo.


REM ���̑�:ArcGIS Pro �p ST_Geometry ���C�u���� �� ODBC Driver�Ȃǂ͕K�v�ɉ�����
REM ���̑�:���{�p�n�}�V���{���Ȃ�
echo.
echo ��1)ArcGIS Pro 3.2 �p �f�[�^�x�[�X�T�|�[�g�t�@�C�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���̑��A�ϊ��c�[���A���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo.

pause
exit /b
