@echo off
REM ArcGIS Pro 2.4の一括アンインストール

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
echo ArcGIS Pro 2.4 のアンインストールを開始します




REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 2.4 Patch 2 のアンインストール
%windir%\System32\msiexec.exe /I "{E3B1CE52-A1E6-4386-95C4-5AB450EF57BD}" MSIPATCHREMOVE="{100EFECF-FC7A-4C5F-B650-BF7DBA933E04}" /norestart /passive /qb

echo パッチのアンインストール終了



REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{DF451989-864F-4B1F-8DA6-1AD98DC450FB}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.4 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{58231D18-CBCE-4CE0-A2CE-12DF0FD0B7FF}" /norestart /passive /qb


REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.4 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{E3B1CE52-A1E6-4386-95C4-5AB450EF57BD}" /norestart /passive /qb


echo ArcGIS Pro 2.4 のアンインストール終了


REM その他:ArcGIS Pro 2.3 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボル
echo 注1)ArcGIS Pro 2.4 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてアンインストールしてください
echo 注2)日本用地図シンボル は必要に応じてアンインストールしてください


pause
exit /b
