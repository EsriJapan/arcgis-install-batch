@echo off
REM ArcGIS Desktop 10.6 の一括アンインストール
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
echo ArcGIS Desktop 10.6 のアンインストールを開始します


REM 事前に必要なものをアンインストール
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

echo MSXML6 64-bit のアンインストール...
REM install MSXML6
%windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
echo MSXML6 のアンインストール...
REM install MSXML6
%windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM パッチのアンインストール
echo パッチのアンインストール開始

echo (2)  ArcGIS 10.6 (Desktop, Engine) ECW Patch
%windir%\System32\msiexec.exe /I "{F8206086-367E-44E4-9E24-92E9E057A63D}" MSIPATCHREMOVE="{319673B3-85AF-4A2C-B18C-32565DC02580}" /norestart /passive /qb

REM 7/5 公開の国内対応ツールパッチ
echo (3)  ArcGIS Desktop 10.6 国内対応パック 変換ツール パッチ
%windir%\System32\msiexec.exe /I "{9803548D-4631-423B-857F-09D32E7E6627}" MSIPATCHREMOVE="{8CED100A-79ED-4A83-92DB-D9EF892A7663}" /norestart /passive /qb

REM 7/17 公開のパッチ
echo (4)  ArcGIS 10.6 (Desktop, Engine, Server) File Deletion and Lookup Patch
%windir%\System32\msiexec.exe /I "{F8206086-367E-44E4-9E24-92E9E057A63D}" MSIPATCHREMOVE="{AD50CC08-CC24-42B1-A59A-637D9E831885}" /norestart /passive /qb

REM 11/14 公開のパッチ
echo (5)  ArcGIS 10.6 (Desktop) Buffer Wizard Patch
%windir%\System32\msiexec.exe /I "{F8206086-367E-44E4-9E24-92E9E057A63D}" MSIPATCHREMOVE="{43AAA59F-9829-4379-B6B3-C5B93CC51227}" /norestart /passive /qb

REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

echo (1)  ArcGIS (Desktop, Engine) Background Geoprocessing 64-bit Arcpy Exit and Shutdown Patch
%windir%\System32\msiexec.exe /I "{D9A37390-98EF-4DDD-BD1E-06BBADFE8CE6}" MSIPATCHREMOVE="{8DACF84A-3221-4BBE-887D-95F9E08CAB1E}" /norestart /passive /qb

echo (2)  ArcGIS 10.6 (Desktop, Engine) ECW Patch 64-bit
%windir%\System32\msiexec.exe /I "{D9A37390-98EF-4DDD-BD1E-06BBADFE8CE6}" MSIPATCHREMOVE="{EB32DE36-DEC7-4B6F-BBF9-E46EA5C3BBC3}" /norestart /passive /qb

REM 7/5 公開の国内対応ツールパッチ 64-bit
echo (3)  ArcGIS Desktop 10.6 国内対応パック 変換ツール パッチ 64-bit
%windir%\System32\msiexec.exe /I "{FBFF340D-8ECE-43A3-87FC-A694DB829614}" MSIPATCHREMOVE="{6007CBC0-92A5-48FE-B33F-671E649F7D13}" /norestart /passive /qb

REM 7/17 公開のパッチ
echo (4)  ArcGIS 10.6 (Desktop, Engine, Server) File Deletion and Lookup Patch 64-bit
%windir%\System32\msiexec.exe /I "{D9A37390-98EF-4DDD-BD1E-06BBADFE8CE6}" MSIPATCHREMOVE="{86C46CF9-23BC-46D4-B6D6-EBF20E95296F}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Dektop本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Desktop 10.6 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{9803548D-4631-423B-857F-09D32E7E6627}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Desktop 10.6 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{FCEA04C0-BA4D-4351-B18E-DF626455A05A}" /norestart /passive /qb

echo ArcGIS Desktop 10.6 のアンインストール... アンインストールにはしばらく時間がかかります...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /X "{F8206086-367E-44E4-9E24-92E9E057A63D}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.6 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{D9A37390-98EF-4DDD-BD1E-06BBADFE8CE6}" /norestart /passive /qb

echo ArcGIS Desktop 10.6 64-bit 国内対応パックのアンインストール ...
REM 国内対応パック 64-bit のアンインストール
%windir%\System32\msiexec.exe /X "{FBFF340D-8ECE-43A3-87FC-A694DB829614}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.6 のアンインストール終了



pause
exit /b
