REM ArcGIS Pro 2.0�̈ꊇ�A���C���X�g�[��

@echo off
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
echo ArcGIS Pro 2.0 �̃A���C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��C���X�g�[��
REM Pro�͎��O�ɕK�v�Ȃ��̂�.NET Framework 4.6.1

REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 2.0 Patch 1�̃A���C���X�g�[�� 
C:\WINDOWS\system32\msiexec.exe /I "{28A4967F-DE0D-4076-B62D-A1A9EA62FF0A}" MSIPATCHREMOVE="{634AA74A-9B27-4D53-8752-D9008FE23AB3}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��



REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
C:\WINDOWS\system32\msiexec.exe /X "{D7976B52-26FC-47FA-A6E5-7F51C40B9D50}" /norestart /passive /qb


REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 2.0 ���{��p�b�N �̃A���C���X�g�[��...
C:\WINDOWS\system32\msiexec.exe /X "{BEC2152E-99C3-4C12-BCEC-BF73D82DC57A}" /norestart /passive /qb


REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 2.0 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
C:\WINDOWS\system32\msiexec.exe /X "{28A4967F-DE0D-4076-B62D-A1A9EA62FF0A}" /norestart /passive /qb


echo ArcGIS Pro 2.0 �̃A���C���X�g�[���I��



REM ���̑�:ArcGIS Pro 2.0 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{���Ȃǂ̓o�b�`�ł́H
echo ��1)ArcGIS Pro 2.0 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������


pause
exit /b
