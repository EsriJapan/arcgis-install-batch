@echo off
REM ArcGIS Pro 2.6の一括アンインストール

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



REM デスクトップのアンインストール
echo ArcGIS Pro 2.6 のアンインストールを開始します




REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 2.6 Patch 4 のアンインストール
%windir%\System32\msiexec.exe /I "{612674FE-4B64-4254-A9AD-C31568C89EA4}" MSIPATCHREMOVE="{DB475E00-FBD7-4F14-B392-063431075902}" /norestart /passive /qb

echo ArcGIS Pro 2.6 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{612674FE-4B64-4254-A9AD-C31568C89EA4}" MSIPATCHREMOVE="{3FDA2C23-0644-48C3-BAE2-6083CC6A8E07}" /norestart /passive /qb

echo パッチのアンインストール終了



REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{72AD5EAA-D6A6-464A-AD3E-F3B24905C344}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.6 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{B89A3DB7-BF3B-48D0-A71F-FAC8036AAFA6}" /norestart /passive /qb


REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 2.6 Data Interoperability のアンインストール開始
REM %windir%\System32\msiexec.exe /X "{9F366C17-E615-4C55-85E9-F646C4A30A0B}" /norestart /passive /qb
REM echo ArcGIS Pro 2.6 Data Interoperability アンインストール終了


REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.6 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{612674FE-4B64-4254-A9AD-C31568C89EA4}" /norestart /passive /qb


echo ArcGIS Pro 2.6 のアンインストール終了


REM その他:ArcGIS Pro 2.3 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボル
echo 注1)ArcGIS Pro 2.6 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてアンインストールしてください
echo 注2)日本用地図シンボル は必要に応じてアンインストールしてください


pause
exit /b
