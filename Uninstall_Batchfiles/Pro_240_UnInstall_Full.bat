@echo off
REM ArcGIS Pro 2.4�̈ꊇ�A���C���X�g�[��

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
echo ArcGIS Pro 2.4 �̃A���C���X�g�[�����J�n���܂�




REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

echo ArcGIS Pro 2.4 Patch 2 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{E3B1CE52-A1E6-4386-95C4-5AB450EF57BD}" MSIPATCHREMOVE="{100EFECF-FC7A-4C5F-B650-BF7DBA933E04}" /norestart /passive /qb

echo �p�b�`�̃A���C���X�g�[���I��



REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{DF451989-864F-4B1F-8DA6-1AD98DC450FB}" /norestart /passive /qb


REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 2.4 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{58231D18-CBCE-4CE0-A2CE-12DF0FD0B7FF}" /norestart /passive /qb


REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 2.4 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{E3B1CE52-A1E6-4386-95C4-5AB450EF57BD}" /norestart /passive /qb


echo ArcGIS Pro 2.4 �̃A���C���X�g�[���I��


REM ���̑�:ArcGIS Pro 2.3 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{��
echo ��1)ArcGIS Pro 2.4 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������


pause
exit /b
