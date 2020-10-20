@echo off
REM ArcGIS Desktop 10.8.1 の一括アンインストール
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
echo ArcGIS Desktop 10.8.1 のアンインストールを開始します


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

REM 2020/10/20 リリース時点なし

REM echo 01_xxxx Patch
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb



REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

REM 2020/10/20 リリース時点なし
REM echo 01_xxx Patch 64-bit
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Dektop本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Desktop 10.8.1 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{843FEFEF-1999-4001-AE4B-A17087321697}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Desktop 10.8.1 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{30C370B7-CFD0-4A12-A5E8-59DF8D4A2368}" /norestart /passive /qb

echo ArcGIS Desktop 10.8.1 のアンインストール... アンインストールにはしばらく時間がかかります...
REM UnInstall ArcGIS Desktop 10.8.1
%windir%\System32\msiexec.exe /X "{7C4FF945-CE6A-415E-8EB9-2B61B0B35DCD}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.8.1 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{1EBC0FD8-8A64-4E8C-9565-F9784A3B96D2}" /norestart /passive /qb

echo ArcGIS Desktop 10.8.1 64-bit 国内対応パックのアンインストール ...
REM 国内対応パック 64-bit のアンインストール
%windir%\System32\msiexec.exe /X "{00CDF114-54AE-4DF9-AB58-E12C9B6E8EBA}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.8.1 のアンインストール終了



pause
exit /b
