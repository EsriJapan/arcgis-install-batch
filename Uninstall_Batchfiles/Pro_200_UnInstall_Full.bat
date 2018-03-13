REM ArcGIS Pro 2.0の一括アンインストール

@echo off
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
echo ArcGIS Pro 2.0 のアンインストールを開始します


REM 事前に必要なものをインストール
REM Proは事前に必要なものは.NET Framework 4.6.1

REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 2.0 Patch 1のアンインストール 
C:\WINDOWS\system32\msiexec.exe /I "{28A4967F-DE0D-4076-B62D-A1A9EA62FF0A}" MSIPATCHREMOVE="{634AA74A-9B27-4D53-8752-D9008FE23AB3}" /norestart /passive /qb

echo パッチのアンインストール終了



REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
C:\WINDOWS\system32\msiexec.exe /X "{D7976B52-26FC-47FA-A6E5-7F51C40B9D50}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.0 日本語パック のアンインストール...
C:\WINDOWS\system32\msiexec.exe /X "{BEC2152E-99C3-4C12-BCEC-BF73D82DC57A}" /norestart /passive /qb


REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.0 本体のアンインストール... アンインストールにはしばらく時間がかかります...
C:\WINDOWS\system32\msiexec.exe /X "{28A4967F-DE0D-4076-B62D-A1A9EA62FF0A}" /norestart /passive /qb


echo ArcGIS Pro 2.0 のアンインストール終了



REM その他:ArcGIS Pro 2.0 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボルなどはバッチでは？
echo 注1)ArcGIS Pro 2.0 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてアンインストールしてください
echo 注2)日本用地図シンボル は必要に応じてアンインストールしてください


pause
exit /b
