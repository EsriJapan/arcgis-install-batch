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

echo ArcGIS Pro 2.7 Patch 4 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{B4A82A90-5394-4A20-848B-F9DE2A264750}" /norestart /passive /qb

echo ArcGIS Pro 2.7 Patch 3 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{E88087D6-0808-44C2-9AFC-A0182DE5EF0E}" /norestart /passive /qb

echo ArcGIS Pro 2.7 Patch 2 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{A8BFD54D-B924-4C32-B2A6-42ED230F29A9}" /norestart /passive /qb

echo ArcGIS Pro 2.7 Patch 1 �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{2F94FC7D-896F-45E4-B25B-22570E0357A9}" /norestart /passive /qb


echo �p�b�`�̃A���C���X�g�[���I��
echo. 

REM ArcGIS Help�A���C���X�g�[��
echo ArcGIS Pro �I�t���C�� �w���v �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{54A2C55C-CB1C-4495-811B-52C5E03143D5}" /norestart /passive /qb


REM ArcGIS Pro ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Pro 2.7 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{F32EE75E-E50E-47DF-8F08-418E97BE9CF8}" /norestart /passive /qb

REM ArcGIS Coordinate Systems Data �̃A���C���X�g�[��
echo ArcGIS Coordinate Systems Data �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{0E361148-C0FB-4959-B476-D7813BFB004A}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data �A���C���X�g�[���I��
echo.


REM Data Interoperability �̃A���C���X�g�[��
REM echo Data Interoperability Patch 1 �A���C���X�g�[��...
REM %windir%\System32\msiexec.exe /I "{A9BD7866-71EE-4FCB-9AB8-FE03BEA78C32}" MSIPATCHREMOVE="{A5965344-726E-4EFB-939E-EDC1B29B72ED}" /norestart /passive /qb
REM echo Data Interoperability �p�b�`�̃A���C���X�g�[���I��

REM Data Interoperability �̃A���C���X�g�[��
REM echo ArcGIS Pro 2.7 Data Interoperability �̃A���C���X�g�[��...
REM %windir%\System32\msiexec.exe /X "{A9BD7866-71EE-4FCB-9AB8-FE03BEA78C32}" /norestart /passive /qb
REM echo ArcGIS Pro 2.7 Data Interoperability �A���C���X�g�[���I��
REM echo. 

REM ArcGIS Pro �{�̂̃A���C���X�g�[��
echo ArcGIS Pro 2.7 �{�̂̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
%windir%\System32\msiexec.exe /X "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" /norestart /passive /qb

echo ArcGIS Pro 2.7 �̃A���C���X�g�[���I��
echo. 


REM ���̑�:ArcGIS Pro 2.3 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u����
REM ���̑�:���{�p�n�}�V���{��
echo ��1)ArcGIS Pro 2.7 �p ST_Geometry ���C�u���� �� ST_Raster ���C�u���� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo ��2)���{�p�n�}�V���{�� �͕K�v�ɉ����ăA���C���X�g�[�����Ă�������
echo. 

pause
exit /b
