@echo off
REM ------------------------------
REM ArcGIS Pro 3.0 の一括アンインストール
REM ------------------------------

REM 
REM MSIファイルのアンインストール コマンド
REM >msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM 注1)MSIのGUIDの値は「orca」で *.msiを開き、[Tables] > [Property] > [ProductCode]の値を指定します
REM 
REM MSPファイルのアンインストール コマンド
REM >msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
REM 注2)mspのGUIDの値は「orca」で *.mspを開き、[View]メニュー > [Summary Information]の画面の
REM [Patch Code]=<PatchGUID> と [Targets]=<ProductGUID> の値を指定します
REM 

REM 
REM バッチファイルに含めているプロダクト
REM 
REM バッチファイルに含めてプロダクトは Pro_300_Install_Full.bat に含めている次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro
REM ArcGIS Pro 3.0 Patch 1 （3.0.1）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.03 の一括アンアンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
echo ・ArcGIS Pro 3.0 Patch 5 （3.0.5）
echo ・ArcGIS Pro 3.0 Patch 4 （3.0.4）
echo ・ArcGIS Pro オフライン ヘルプ
echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.03 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.0 Patch 5 のアンインストール
%windir%\System32\msiexec.exe /I "{690B606E-8A38-4CB9-B088-241F60A86072}" MSIPATCHREMOVE="{403EA9FB-5C29-4EB8-BDA2-702D71AB1F92}" /norestart /passive /qb

echo ArcGIS Pro 3.0 Patch 4 のアンインストール
%windir%\System32\msiexec.exe /I "{690B606E-8A38-4CB9-B088-241F60A86072}" MSIPATCHREMOVE="{C7381E1E-48E6-47D4-9071-13B46A7F91BC}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{F99779CB-33F4-4356-8BE5-6AED1619DF37}" /norestart /passive /qb
echo オフライン ヘルプ のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.03 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{0862710F-7945-4B24-A6E2-8CAF11A565DA}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{C338A9BB-6D4C-4033-B78B-803D53B73F63}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 3.0 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{78E79722-2A97-4CA9-A3FF-B45D3DD7D7FA}" /norestart /passive /qb
REM echo ArcGIS Pro 3.0 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.03 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{690B606E-8A38-4CB9-B088-241F60A86072}" /norestart /passive /qb
echo ArcGIS Pro 3.03 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.03 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
