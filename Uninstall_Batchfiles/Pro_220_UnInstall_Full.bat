@echo off
REM ArcGIS Pro 2.2の一括アンインストール

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
echo ArcGIS Pro 2.2 のアンインストールを開始します




REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 2.2 Patch 4 のアンインストール
%windir%\System32\msiexec.exe /I "{B5E1FB35-5E9D-4B40-ABA5-20F29A186889}" MSIPATCHREMOVE="{CDCEA329-64FC-4427-AC5E-C4B313602EB6}" /norestart /passive /qb


echo パッチのアンインストール終了



REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{FB3E9E5B-CE21-4E42-8F48-5A7DCF5CA893}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.2 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{9FE8A942-90C4-461F-A378-C7D9482CE4BE}" /norestart /passive /qb


REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.2 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{B5E1FB35-5E9D-4B40-ABA5-20F29A186889}" /norestart /passive /qb


echo ArcGIS Pro 2.2 のアンインストール終了


REM その他:ArcGIS Pro 2.2 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボル
echo 注1)ArcGIS Pro 2.2 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてアンインストールしてください
echo 注2)日本用地図シンボル は必要に応じてアンインストールしてください


pause
exit /b
