@echo off
REM ArcGIS Engine 10.8 の一括アンインストール

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
echo ArcGIS Engine 10.8 のアンインストールを開始します


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

REM 2020/05/18 リリース時点
echo 01_ArcGIS (Desktop, Engine, Server) 10.8 SQL Server Enterprise Geodatabase Upgrade Patch
%windir%\System32\msiexec.exe /I "{C75EB22D-BD9B-4850-9D98-99473B0E3F42}" MSIPATCHREMOVE="{C182BDA4-F8D3-4054-9FCD-EF351CAFE39C}" /norestart /passive /qb


REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

REM 2020/05/18 リリース時点
echo 01_ArcGIS (Desktop, Engine, Server) 10.8 SQL Server Enterprise Geodatabase Upgrade Patch 64-bit
%windir%\System32\msiexec.exe /I "{CBFABCF9-946F-4819-84F7-96F9EC9F7435}" MSIPATCHREMOVE="{C9D5E5E8-4104-4451-8E77-7210DB4738F5}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Engine本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Engine 10.8 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{2797681C-E72D-4C68-95C8-DBB4BD82CA6A}" /norestart /passive /qb


REM 日本語パックのアンインストール
echo ArcGIS Engine 10.8 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{0074B51C-EDD6-4A0F-96E3-797526B9209F}" /norestart /passive /qb


echo ArcGIS Engine 10.8 のアンインストール... アンインストールにはしばらく時間がかかります...
REM UnInstall ArcGIS Engine 10.8
%windir%\System32\msiexec.exe /X "{C75EB22D-BD9B-4850-9D98-99473B0E3F42}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.8 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{CBFABCF9-946F-4819-84F7-96F9EC9F7435}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.8 のアンインストール終了



pause
exit /b
