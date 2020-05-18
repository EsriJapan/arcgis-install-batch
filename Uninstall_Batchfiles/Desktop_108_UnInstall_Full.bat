@echo off
REM ArcGIS Desktop 10.8 の一括アンインストール
REM MSIファイルのアンインストール コマンド
REM >msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM 注1)MSIのGUIDの値は「orca」で *.msiを開き、[Tables] > [Property] > [ProductCode]の値を指定します
REM 
REM MSPファイルのアンインストール コマンド
REM >msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
REM 注2)mspのGUIDの値は「orca」で *.mspを開き、[View]メニュー > [Summary Information]の画面の
REM [Patch Code]=<PatchGUID>と[Targets]=<ProductGUID>の値を指定します
REM 

set __COMPAT_LAYER=RunAsInvoker



REM デスクトップのインストール
echo ArcGIS Desktop 10.8 のアンインストールを開始します


REM 事前に必要なものをアンインストール
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1ではMSXMLはインストーラにない
REM echo MSXML6 64-bit のアンインストール...
REM install MSXML6
REM %windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
REM echo MSXML6 のアンインストール...
REM install MSXML6
REM %windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM パッチのアンインストール
echo パッチのアンインストール開始

REM 2020/05/18 リリース時点

echo 01_ArcGIS (Desktop, Engine, Server) 10.8 SQL Server Enterprise Geodatabase Upgrade Patch
%windir%\System32\msiexec.exe /I "{3DB5C522-636F-4FC2-9C38-298DBEBFD0BC}" MSIPATCHREMOVE="{A4EE3D49-01AE-4FA9-9319-391EAA48BC55}" /norestart /passive /qb



REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

REM 2020/05/18 リリース時点
echo 01_ArcGIS (Desktop, Engine, Server) 10.8 SQL Server Enterprise Geodatabase Upgrade Patch 64-bit
%windir%\System32\msiexec.exe /I "{C28E8BF1-8707-40D3-A048-15C965475A09}" MSIPATCHREMOVE="{A5C683CF-7F49-44A0-9145-D10BE2B4ED47}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Dektop本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Desktop 10.8 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{C223B89F-1A95-46FC-86B3-986177077EA9}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Desktop 10.8 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{720BF78F-85A2-499D-80F1-A3FED04CB364}" /norestart /passive /qb

echo ArcGIS Desktop 10.8 のアンインストール... アンインストールにはしばらく時間がかかります...
REM UnInstall ArcGIS Desktop 10.8
%windir%\System32\msiexec.exe /X "{3DB5C522-636F-4FC2-9C38-298DBEBFD0BC}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.8 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{C28E8BF1-8707-40D3-A048-15C965475A09}" /norestart /passive /qb

echo ArcGIS Desktop 10.8 64-bit 国内対応パックのアンインストール ...
REM 国内対応パック 64-bit のアンインストール
%windir%\System32\msiexec.exe /X "{BEFB4BF9-4838-49FD-A5DD-75CE163AF7D2}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.8 のアンインストール終了



pause
exit /b
