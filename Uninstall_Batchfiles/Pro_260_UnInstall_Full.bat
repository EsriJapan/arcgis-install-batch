@echo off
REM ArcGIS Pro 2.6�̈ꊇ�A���C���X�g�[��

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



REM �f�X�N�g�b�v�̃A���C���X�g�[��
echo ArcGIS Pro 2.6 �̃A���C���X�g�[�����J�n���܂�




REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 2.6 Patch 4 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{612674FE-4B64-4254-A9AD-C31568C89EA4}" MSIPATCHREMOVE="{DB475E00-FBD7-4F14-B392-063431075902}" /norestart /passive /qb

echo ArcGIS Pro 2.6 Patch 1 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{612674FE-4B64-4254-A9AD-C31568C89EA4}" MSIPATCHREMOVE="{3FDA2C23-0644-48C3-BAE2-6083CC6A8E07}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��



REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{72AD5EAA-D6A6-464A-AD3E-F3B24905C344}" /norestart /passive /qb


REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 2.6 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{B89A3DB7-BF3B-48D0-A71F-FAC8036AAFA6}" /norestart /passive /qb


REM Data Interoperability �̃A���C���X�g�[��
REM echo ArcGIS Pro 2.6 Data Interoperability �̃A���C���X�g�[���J�n
REM %windir%\System32\msiexec.exe /X "{9F366C17-E615-4C55-85E9-F646C4A30A0B}" /norestart /passive /qb
REM echo ArcGIS Pro 2.6 Data Interoperability �A���C���X�g�[���I��


REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 2.6 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{612674FE-4B64-4254-A9AD-C31568C89EA4}" /norestart /passive /qb


echo ArcGIS Pro 2.6 �̃A���C���X�g�[���I��


REM ���̑�:ArcGIS Pro 2.3 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{��
echo ��1)ArcGIS Pro 2.6 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������


pause
exit /b
