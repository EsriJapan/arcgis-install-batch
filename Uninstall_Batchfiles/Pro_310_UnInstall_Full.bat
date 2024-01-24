@echo off
REM ------------------------------
REM ArcGIS Pro 3.1 �̈ꊇ�A���C���X�g�[��
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
REM �o�b�`�t�@�C���Ɋ܂߂ăv���_�N�g�� Pro_310_Install_Full.bat �Ɋ܂߂Ă��鎟�̂��̂ł��B
REM 
REM ---�v���_�N�g �R���|�[�l���g---
REM ArcGIS Pro
REM ArcGIS Pro 3.1 Patch 1 �i3.1.1�j
REM ArcGIS Pro 3.1 Patch 2 �i3.1.2�j
REM ArcGIS Pro 3.1 Patch 3 �i3.1.3�j
REM ArcGIS Pro 3.1 Patch 4 �i3.1.4�j
REM ArcGIS Pro �I�t���C�� �w���v
REM ArcGIS Data Interoperability for Pro �i�p��j
REM ---�f�[�^�ƃR���e���c---
REM ArcGIS Coordinate Systems Data �i�p��j
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.1 �̈ꊇ�A���A���C���X�g�[�� �̑Ώ�
echo -----------------------------------
echo �EArcGIS Pro
echo �EArcGIS Pro 3.1 Patch 4 �i3.1.4�j
echo �EArcGIS Pro 3.1 Patch 3 �i3.1.3�j
echo �EArcGIS Pro 3.1 Patch 2 �i3.1.2�j
echo �EArcGIS Pro 3.1 Patch 1 �i3.1.1�j
echo �EArcGIS Pro �I�t���C�� �w���v
REM echo �EArcGIS Data Interoperability for Pro �i�p��j
echo �EArcGIS Coordinate Systems Data �i�p��j
echo.

set __COMPAT_LAYER=RunAsInvoker


REM �f�X�N�g�b�v�̃A���C���X�g�[��
echo ArcGIS Pro 3.1 �̃A���C���X�g�[�����J�n���܂�


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 3.1 Patch 4 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{A61AD307-865F-429F-B2A3-5618BD333F7E}" MSIPATCHREMOVE="{A5BD739B-82EF-4639-AF9A-ECA8CD94D04F}" /norestart /passive /qb

echo ArcGIS Pro 3.1 Patch 3 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{A61AD307-865F-429F-B2A3-5618BD333F7E}" MSIPATCHREMOVE="{B7B84ECD-4C8C-4B4A-BD37-B74B1AAB6751}" /norestart /passive /qb

echo ArcGIS Pro 3.1 Patch 2 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{A61AD307-865F-429F-B2A3-5618BD333F7E}" MSIPATCHREMOVE="{F9AA4027-F2BC-41B9-8EBD-86F20AD15654}" /norestart /passive /qb

echo ArcGIS Pro 3.1 Patch 1 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{A61AD307-865F-429F-B2A3-5618BD333F7E}" MSIPATCHREMOVE="{71D98C4E-6A5B-4A9A-B637-D34D9284757E}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��
echo.

REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{3E750808-A79F-4E06-810A-112883E43B31}" /norestart /passive /qb
echo �I�t���C�� �w���v �̃A���C���X�g�[���I��
echo.

REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 3.1 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{0B7352D5-506E-48AF-BCBA-F30162CE206B}" /norestart /passive /qb
echo ���{��p�b�N �̃A���C���X�g�[���I��
echo.

REM ArcGIS Coordinate Systems Data �̃A���C���X�g�[��
echo ArcGIS Coordinate Systems Data �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{D79BA24A-E228-43C4-8FDE-751C2E923C66}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data �A���C���X�g�[���I��
echo.

REM Data Interoperability �̃A���C���X�g�[��
REM echo ArcGIS Pro 3.1 Data Interoperability �̃A���C���X�g�[��...
REM %windir%\System32\msiexec.exe /X "{D7189FF4-999B-4783-8B3D-01B900BFF16C}" /norestart /passive /qb
REM echo ArcGIS Pro 3.1 Data Interoperability �A���C���X�g�[���I��
REM echo.

REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 3.1 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{A61AD307-865F-429F-B2A3-5618BD333F7E}" /norestart /passive /qb
echo ArcGIS Pro 3.1 �̃A���C���X�g�[���I��
echo.


REM ���̑�:ArcGIS Pro �p ST_Geometry ���C�u���� �� ODBC Driver�Ȃǂ͕K�v�ɉ�����
REM ���̑�:���{�p�n�}�V���{���Ȃ�
echo.
echo ��1)ArcGIS Pro 3.1 �p �f�[�^�x�[�X�T�|�[�g�t�@�C�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���̑��A�ϊ��c�[���A���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo.

pause
exit /b
