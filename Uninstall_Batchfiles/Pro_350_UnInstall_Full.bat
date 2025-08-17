@echo off
REM ------------------------------
REM ArcGIS Pro 3.5 �̈ꊇ�A���C���X�g�[��
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
REM �o�b�`�t�@�C���Ɋ܂߂ăv���_�N�g�� Pro_340_Install_Full.bat �Ɋ܂߂Ă��鎟�̂��̂ł��B
REM 
REM ---�v���_�N�g �R���|�[�l���g---
REM ArcGIS Pro 3.5
REM ArcGIS Pro 3.5 Patch 1 �i3.5.1�j
REM ArcGIS Pro 3.5 Patch 2 �i3.5.2�j
REM ArcGIS Pro �I�t���C�� �w���v
REM ArcGIS Data Interoperability for Pro �i�p��j
REM ---�f�[�^�ƃR���e���c---
REM ArcGIS Coordinate Systems Data �i�p��j
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.5 �̈ꊇ�A���A���C���X�g�[�� �̑Ώ�
echo -----------------------------------
echo �EArcGIS Pro 3.5
echo �EArcGIS Pro 3.5 Patch 1 �i3.5.1�j
echo �EArcGIS Pro 3.5 Patch 2 �i3.5.2�j
echo �EArcGIS Pro �I�t���C�� �w���v
REM echo �EArcGIS Data Interoperability for Pro �i�p��j
echo �EArcGIS Coordinate Systems Data �i�p��j
echo.

set __COMPAT_LAYER=RunAsInvoker


REM �f�X�N�g�b�v�̃A���C���X�g�[��
echo ArcGIS Pro 3.5 �̃A���C���X�g�[�����J�n���܂�


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 3.5 Patch 2 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{6AB7A2E6-6E45-4A2D-8E88-6B0856B4CB48}" MSIPATCHREMOVE="{EBD7F7C5-A67F-4DCC-8788-B3EF0CC8B67E}" /norestart /passive /qb

echo ArcGIS Pro 3.5 Patch 1 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{6AB7A2E6-6E45-4A2D-8E88-6B0856B4CB48}" MSIPATCHREMOVE="{445D07CE-22C4-4660-810D-2630E89A3F76}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��
echo.

REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{E07AD655-7F15-4749-BE12-B985CC7A8569}" /norestart /passive /qb
echo �I�t���C�� �w���v �̃A���C���X�g�[���I��
echo.

REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 3.5 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{F9AABA07-05B4-4DF7-B8CB-83EC7D13AE5E}" /norestart /passive /qb
echo ���{��p�b�N �̃A���C���X�g�[���I��
echo.

REM ArcGIS Coordinate Systems Data �̃A���C���X�g�[��
echo ArcGIS Coordinate Systems Data �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{C93A12BB-D4A1-4324-9F82-44B0772408D5}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data �A���C���X�g�[���I��
echo.

REM Data Interoperability �̃A���C���X�g�[��
REM echo ArcGIS Pro 3.5 Data Interoperability �̃A���C���X�g�[��...
REM %windir%\System32\msiexec.exe /X "{50DC0AD9-A7DB-4093-ADD1-78A12841873D}" /norestart /passive /qb
REM echo ArcGIS Pro 3.5 Data Interoperability �A���C���X�g�[���I��
REM echo.

REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 3.5 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{6AB7A2E6-6E45-4A2D-8E88-6B0856B4CB48}" /norestart /passive /qb
echo ArcGIS Pro 3.5 �̃A���C���X�g�[���I��
echo.


REM ���̑�:ArcGIS Pro �p ST_Geometry ���C�u���� �� ODBC Driver�Ȃǂ͕K�v�ɉ�����
REM ���̑�:���{�p�n�}�V���{���Ȃ�
echo.
echo ��1)ArcGIS Pro 3.5 �p �f�[�^�x�[�X�T�|�[�g�t�@�C�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���̑��A�ϊ��c�[���A���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo.

pause
exit /b
