@echo off
REM ArcGIS Pro 2.5の一括アンインストール

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
echo ArcGIS Pro 2.5 のアンインストールを開始します




REM パッチのアンインストール
echo パッチのアンインストール開始

REM echo ArcGIS Pro 2.5 Patch xx のアンインストール
REM %windir%\System32\msiexec.exe /I "" MSIPATCHREMOVE="" /norestart /passive /qb

echo パッチのアンインストール終了



REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{5A0E9681-551A-4DEF-AFAA-9ADA045DDC1F}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.5 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{A250A768-EB0C-492F-A0AC-55B8CD2C8ECE}" /norestart /passive /qb


REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.5 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{0D695F82-EB12-4430-A241-20226042FD40}" /norestart /passive /qb


echo ArcGIS Pro 2.5 のアンインストール終了


REM その他:ArcGIS Pro 2.3 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボル
echo 注1)ArcGIS Pro 2.5 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてアンインストールしてください
echo 注2)日本用地図シンボル は必要に応じてアンインストールしてください


pause
exit /b
