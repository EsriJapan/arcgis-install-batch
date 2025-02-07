@echo off
REM ------------------------------
REM ArcGIS Pro 3.4 �̈ꊇ�A���C���X�g�[��
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
REM ArcGIS Pro
REM ArcGIS Pro 3.4 Patch 1 �i3.4.1�j
REM ArcGIS Pro 3.4 Patch 2 �i3.4.2�j
REM ArcGIS Pro �I�t���C�� �w���v
REM ArcGIS Data Interoperability for Pro �i�p��j
REM ---�f�[�^�ƃR���e���c---
REM ArcGIS Coordinate Systems Data �i�p��j
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.4 �̈ꊇ�A���A���C���X�g�[�� �̑Ώ�
echo -----------------------------------
echo �EArcGIS Pro
echo �EArcGIS Pro 3.4 Patch 1 �i3.4.1�j
echo �EArcGIS Pro 3.4 Patch 2 �i3.4.2�j
echo �EArcGIS Pro �I�t���C�� �w���v
REM echo �EArcGIS Data Interoperability for Pro �i�p��j
echo �EArcGIS Coordinate Systems Data �i�p��j
echo.

set __COMPAT_LAYER=RunAsInvoker


REM �f�X�N�g�b�v�̃A���C���X�g�[��
echo ArcGIS Pro 3.4 �̃A���C���X�g�[�����J�n���܂�


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 3.4 Patch 2 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{F6FDD729-EC3F-4361-A98E-B592EEF0D445}" MSIPATCHREMOVE="{C54F2A9E-07DF-4245-8B34-CD7FBF02A649}" /norestart /passive /qb

echo ArcGIS Pro 3.4 Patch 1 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{F6FDD729-EC3F-4361-A98E-B592EEF0D445}" MSIPATCHREMOVE="{186A82E2-C57E-4922-A6D5-0AAE54F7985A}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��
echo.

REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{A984FEE4-6049-40E4-B5C7-ECBDFF33BCEB}" /norestart /passive /qb
echo �I�t���C�� �w���v �̃A���C���X�g�[���I��
echo.

REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 3.4 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{10827677-5D07-4A87-9671-4BB59C155883}" /norestart /passive /qb
echo ���{��p�b�N �̃A���C���X�g�[���I��
echo.

REM ArcGIS Coordinate Systems Data �̃A���C���X�g�[��
echo ArcGIS Coordinate Systems Data �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{BDB0A52A-0EEA-48B2-9801-49E0C23E834C}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data �A���C���X�g�[���I��
echo.

REM Data Interoperability �̃A���C���X�g�[��
REM echo ArcGIS Pro 3.4 Data Interoperability �̃A���C���X�g�[��...
REM %windir%\System32\msiexec.exe /X "{7F066F83-DA01-44F2-9666-6EFA801CCB3D}" /norestart /passive /qb
REM echo ArcGIS Pro 3.4 Data Interoperability �A���C���X�g�[���I��
REM echo.

REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 3.4 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{F6FDD729-EC3F-4361-A98E-B592EEF0D445}" /norestart /passive /qb
echo ArcGIS Pro 3.4 �̃A���C���X�g�[���I��
echo.


REM ���̑�:ArcGIS Pro �p ST_Geometry ���C�u���� �� ODBC Driver�Ȃǂ͕K�v�ɉ�����
REM ���̑�:���{�p�n�}�V���{���Ȃ�
echo.
echo ��1)ArcGIS Pro 3.4 �p �f�[�^�x�[�X�T�|�[�g�t�@�C�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���̑��A�ϊ��c�[���A���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo.

pause
exit /b
