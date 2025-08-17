@echo off
REM ------------------------------
REM ArcGIS Pro 3.5 の一括アンインストール
REM ------------------------------

REM 
REM MSIファイルのアンインストール コマンド
REM >msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM 注1)MSIのGUIDの値は「orca」で *.msiを開き、[Tables] > [Property] > [ProductCode]の値を指定します
REM 
REM MSPファイルのアンインストール コマンド
REM >msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
REM 注2)mspのGUIDの値は「orca」で *.mspを開き、[View]メニュー > [Summary Information]の画面の
REM [Targets]=<ProductGUID> と [Patch Code]=<PatchGUID> の値を指定します
REM 

REM 
REM バッチファイルに含めているプロダクト
REM 
REM バッチファイルに含めてプロダクトは Pro_340_Install_Full.bat に含めている次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro 3.5
REM ArcGIS Pro 3.5 Patch 1 （3.5.1）
REM ArcGIS Pro 3.5 Patch 2 （3.5.2）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.5 の一括アンアンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro 3.5
echo ・ArcGIS Pro 3.5 Patch 1 （3.5.1）
echo ・ArcGIS Pro 3.5 Patch 2 （3.5.2）
echo ・ArcGIS Pro オフライン ヘルプ
REM echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.5 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.5 Patch 2 のアンインストール
%windir%\System32\msiexec.exe /I "{6AB7A2E6-6E45-4A2D-8E88-6B0856B4CB48}" MSIPATCHREMOVE="{EBD7F7C5-A67F-4DCC-8788-B3EF0CC8B67E}" /norestart /passive /qb

echo ArcGIS Pro 3.5 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{6AB7A2E6-6E45-4A2D-8E88-6B0856B4CB48}" MSIPATCHREMOVE="{445D07CE-22C4-4660-810D-2630E89A3F76}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{E07AD655-7F15-4749-BE12-B985CC7A8569}" /norestart /passive /qb
echo オフライン ヘルプ のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.5 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{F9AABA07-05B4-4DF7-B8CB-83EC7D13AE5E}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{C93A12BB-D4A1-4324-9F82-44B0772408D5}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 3.5 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{50DC0AD9-A7DB-4093-ADD1-78A12841873D}" /norestart /passive /qb
REM echo ArcGIS Pro 3.5 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.5 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{6AB7A2E6-6E45-4A2D-8E88-6B0856B4CB48}" /norestart /passive /qb
echo ArcGIS Pro 3.5 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.5 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
