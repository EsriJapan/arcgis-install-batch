@echo off
REM ArcGIS Engine 10.8.1 の一括アンインストール

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
echo ArcGIS Engine 10.8.1 のアンインストールを開始します


REM 事前に必要なものをアンインストール
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1 では MSXML のインストーラがなくなっている
REM echo MSXML6 64-bit のアンインストール...
REM uninstall MSXML6
REM %windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
REM 10.6.1 では MSXML のインストーラがなくなっている
REM echo MSXML6 のアンインストール...
REM uninstall MSXML6
REM %windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM パッチのアンインストール
echo パッチのアンインストール開始

REM 2020/10/20 リリース時点なし
REM echo 01_xxxx Patch
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

REM 2020/10/xx リリース時点
REM echo 01_xxx Patch 64-bit
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Engine本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Engine 10.8.1 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{9F5EAB94-38E7-45B6-9967-64EFCEB11ECD}" /norestart /passive /qb


REM 日本語パックのアンインストール
echo ArcGIS Engine 10.8.1 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{6C888356-4ABF-44C1-A4C6-8AE170A2945C}" /norestart /passive /qb


echo ArcGIS Engine 10.8.1 のアンインストール... アンインストールにはしばらく時間がかかります...
REM UnInstall ArcGIS Engine 10.8
%windir%\System32\msiexec.exe /X "{F7B59921-A34C-42DB-87ED-DDEE8FCC7B45}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.8.1 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{2355C02B-A920-4B1E-8301-CC7830793A10}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.8.1 のアンインストール終了



pause
exit /b
