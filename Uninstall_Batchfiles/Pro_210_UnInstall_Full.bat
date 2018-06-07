@echo off
REM ArcGIS Pro 2.1の一括アンインストール

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
echo ArcGIS Pro 2.1 のアンインストールを開始します




REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 2.1 Patch 3 のアンインストール
%windir%\System32\msiexec.exe /I "{0368352A-8996-4E80-B9A1-B1BA43FAE6E6}" MSIPATCHREMOVE="{63959265-04C2-4C80-9FBE-D697A9BD5127}" /norestart /passive /qb


echo パッチのアンインストール終了



REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{59299869-7510-44D7-A2FA-CB4936DA9FA6}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.1 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{BEA3B322-2331-4AF2-A97D-177009FD078A}" /norestart /passive /qb


REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.1 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{0368352A-8996-4E80-B9A1-B1BA43FAE6E6}" /norestart /passive /qb


echo ArcGIS Pro 2.1 のアンインストール終了


REM その他:ArcGIS Pro 2.1 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボル
echo 注1)ArcGIS Pro 2.1 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてアンインストールしてください
echo 注2)日本用地図シンボル は必要に応じてアンインストールしてください


pause
exit /b
