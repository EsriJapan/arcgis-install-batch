@echo off
REM ArcGIS Pro 2.7�̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Pro 2.7 �̃A���C���X�g�[�����J�n���܂�




REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 2.7 Patch 1 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{2F94FC7D-896F-45E4-B25B-22570E0357A9}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��



REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{54A2C55C-CB1C-4495-811B-52C5E03143D5}" /norestart /passive /qb


REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 2.7 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{F32EE75E-E50E-47DF-8F08-418E97BE9CF8}" /norestart /passive /qb


REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 2.7 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" /norestart /passive /qb


echo ArcGIS Pro 2.7 �̃A���C���X�g�[���I��


REM ���̑�:ArcGIS Pro 2.3 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{��
echo ��1)ArcGIS Pro 2.7 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������


pause
exit /b