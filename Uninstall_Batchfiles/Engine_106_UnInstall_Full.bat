@echo off
REM ArcGIS Engine 10.6 の一括アンインストール

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



REM Engineのアンインストール
echo ArcGIS Engine 10.6のアンインストールを開始します


REM 事前に必要なものをアンインストール
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

echo MSXML6 64-bit のアンインストール...
REM uninstall MSXML6
%windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
echo MSXML6 のアンインストール...
REM uninstall MSXML6
%windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM パッチのアンインストール
echo パッチのアンインストール開始

echo (3)  ArcGIS 10.6 (Desktop, Engine) ECW Patch
%windir%\System32\msiexec.exe /I "{D2CD36EF-5E54-4E2F-A26A-0D99999C25D1}" MSIPATCHREMOVE="{6A6C2BCE-F201-4346-A3DB-D0B096DEFCF4}" /norestart /passive /qb

REM 07/17 公開のパッチ
echo (4)  ArcGIS 10.6 (Desktop, Engine, Server) File Deletion and Lookup Patch
%windir%\System32\msiexec.exe /I "{D2CD36EF-5E54-4E2F-A26A-0D99999C25D1}" MSIPATCHREMOVE="{BDB63730-B238-4638-A7C2-9C130A77F0CD}" /norestart /passive /qb


REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

echo (2)  ArcGIS (Desktop, Engine) Background Geoprocessing 64-bit Arcpy Exit and Shutdown Patch
%windir%\System32\msiexec.exe /I "{D635F9C0-3E5A-4D55-BEE6-36C67194D33A}" MSIPATCHREMOVE="{2F5391D2-55B2-4632-89ED-87392FF205F2}" /norestart /passive /qb

echo (3)  ArcGIS 10.6 (Desktop, Engine) ECW Patch 64-bit
%windir%\System32\msiexec.exe /I "{D635F9C0-3E5A-4D55-BEE6-36C67194D33A}" MSIPATCHREMOVE="{CDAA0C3C-511B-4D4D-ABAF-8A4C981A1FB5}" /norestart /passive /qb

REM 07/17 公開のパッチ
echo (4)  ArcGIS 10.6 (Desktop, Engine, Server) File Deletion and Lookup Patch 64-bit
%windir%\System32\msiexec.exe /I "{D635F9C0-3E5A-4D55-BEE6-36C67194D33A}" MSIPATCHREMOVE="{18CA2386-0B48-4143-A4E6-416CFBD110CE}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Engine本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Engine 10.6 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{DA01F20F-26B3-4583-922D-BB173524A01E}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Engine 10.6 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{EE98CB93-7A67-4806-B628-06E0CDC9544C}" /norestart /passive /qb

echo ArcGIS Engine 10.6 のアンインストール... アンインストールにはしばらく時間がかかります...
REM uninstall ArcGIS Engine 10.6
%windir%\System32\msiexec.exe /X "{D2CD36EF-5E54-4E2F-A26A-0D99999C25D1}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.6 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{D635F9C0-3E5A-4D55-BEE6-36C67194D33A}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.6 のアンインストール終了



pause
exit /b
