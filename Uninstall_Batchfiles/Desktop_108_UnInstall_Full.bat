@echo off
REM ArcGIS Desktop 10.8 �̈ꊇ�A���C���X�g�[��
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



REM �f�X�N�g�b�v�̃C���X�g�[��
echo ArcGIS Desktop 10.8 �̃A���C���X�g�[�����J�n���܂�


REM ���O�ɕK�v�Ȃ��̂��A���C���X�g�[��
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1�ł�MSXML�̓C���X�g�[���ɂȂ�
REM echo MSXML6 64-bit �̃A���C���X�g�[��...
REM install MSXML6
REM %windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
REM echo MSXML6 �̃A���C���X�g�[��...
REM install MSXML6
REM %windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM �p�b�`�̃A���C���X�g�[��
echo �p�b�`�̃A���C���X�g�[���J�n

REM 2020/05/18 �����[�X���_

echo 01_ArcGIS (Desktop, Engine, Server) 10.8 SQL Server Enterprise Geodatabase Upgrade Patch
%windir%\System32\msiexec.exe /I "{3DB5C522-636F-4FC2-9C38-298DBEBFD0BC}" MSIPATCHREMOVE="{A4EE3D49-01AE-4FA9-9319-391EAA48BC55}" /norestart /passive /qb



REM 64-bit OS�̏ꍇ�̓o�b�N�O���E���h�p�b�`�K�p
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

REM 2020/05/18 �����[�X���_
echo 01_ArcGIS (Desktop, Engine, Server) 10.8 SQL Server Enterprise Geodatabase Upgrade Patch 64-bit
%windir%\System32\msiexec.exe /I "{C28E8BF1-8707-40D3-A048-15C965475A09}" MSIPATCHREMOVE="{A5C683CF-7F49-44A0-9145-D10BE2B4ED47}" /norestart /passive /qb


:64BITPatchesEnd

echo �p�b�`�̃A���C���X�g�[���I��


REM ArcGIS Dektop�{�̂̃A���C���X�g�[��
REM �����Ή��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.8 �����Ή��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{C223B89F-1A95-46FC-86B3-986177077EA9}" /norestart /passive /qb

REM ���{��p�b�N�̃A���C���X�g�[��
echo ArcGIS Desktop 10.8 ���{��p�b�N �̃A���C���X�g�[��...
%windir%\System32\msiexec.exe /X "{720BF78F-85A2-499D-80F1-A3FED04CB364}" /norestart /passive /qb

echo ArcGIS Desktop 10.8 �̃A���C���X�g�[��... �A���C���X�g�[���ɂ͂��΂炭���Ԃ�������܂�...
REM UnInstall ArcGIS Desktop 10.8
%windir%\System32\msiexec.exe /X "{3DB5C522-636F-4FC2-9C38-298DBEBFD0BC}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.8 64-bit Background Geoprocessing �̃A���C���X�g�[��...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{C28E8BF1-8707-40D3-A048-15C965475A09}" /norestart /passive /qb

echo ArcGIS Desktop 10.8 64-bit �����Ή��p�b�N�̃A���C���X�g�[�� ...
REM �����Ή��p�b�N 64-bit �̃A���C���X�g�[��
%windir%\System32\msiexec.exe /X "{BEFB4BF9-4838-49FD-A5DD-75CE163AF7D2}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.8 �̃A���C���X�g�[���I��



pause
exit /b
