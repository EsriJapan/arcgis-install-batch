@echo off
REM ArcGIS Pro 2.3�̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Pro 2.3 �̃A���C���X�g�[�����J�n���܂�




REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 2.3 Patch 3 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{9CB8A8C5-202D-4580-AF55-E09803BA1959}" MSIPATCHREMOVE="{BD2A103C-02C2-4170-B9A8-877E30A6704D}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��



REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{17DE1542-B3AB-4996-8E8B-4AA30F4B235D}" /norestart /passive /qb


REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 2.3 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{DC192AAA-5ABB-4698-AD0A-2BE408117C63}" /norestart /passive /qb


REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 2.3 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{9CB8A8C5-202D-4580-AF55-E09803BA1959}" /norestart /passive /qb


echo ArcGIS Pro 2.3 �̃A���C���X�g�[���I��


REM ���̑�:ArcGIS Pro 2.3 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{��
echo ��1)ArcGIS Pro 2.3 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������


pause
exit /b
