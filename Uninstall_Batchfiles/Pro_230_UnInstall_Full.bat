@echo off
REM ArcGIS Pro 2.3の一括アンインストール

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
echo ArcGIS Pro 2.3 のアンインストールを開始します




REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 2.3 Patch 3 のアンインストール
%windir%\System32\msiexec.exe /I "{9CB8A8C5-202D-4580-AF55-E09803BA1959}" MSIPATCHREMOVE="{BD2A103C-02C2-4170-B9A8-877E30A6704D}" /norestart /passive /qb

echo パッチのアンインストール終了



REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{17DE1542-B3AB-4996-8E8B-4AA30F4B235D}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.3 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{DC192AAA-5ABB-4698-AD0A-2BE408117C63}" /norestart /passive /qb


REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.3 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{9CB8A8C5-202D-4580-AF55-E09803BA1959}" /norestart /passive /qb


echo ArcGIS Pro 2.3 のアンインストール終了


REM その他:ArcGIS Pro 2.3 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボル
echo 注1)ArcGIS Pro 2.3 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてアンインストールしてください
echo 注2)日本用地図シンボル は必要に応じてアンインストールしてください


pause
exit /b
