@echo off
REM ArcGIS Pro 2.1�̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Pro 2.1 �̃A���C���X�g�[�����J�n���܂�




REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 2.1 Patch 3 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{0368352A-8996-4E80-B9A1-B1BA43FAE6E6}" MSIPATCHREMOVE="{63959265-04C2-4C80-9FBE-D697A9BD5127}" /norestart /passive /qb


echo �p�b�`�̃A���C���X�g�[���I��



REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{59299869-7510-44D7-A2FA-CB4936DA9FA6}" /norestart /passive /qb


REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 2.1 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{BEA3B322-2331-4AF2-A97D-177009FD078A}" /norestart /passive /qb


REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 2.1 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{0368352A-8996-4E80-B9A1-B1BA43FAE6E6}" /norestart /passive /qb


echo ArcGIS Pro 2.1 �̃A���C���X�g�[���I��


REM ���̑�:ArcGIS Pro 2.1 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{��
echo ��1)ArcGIS Pro 2.1 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������


pause
exit /b
