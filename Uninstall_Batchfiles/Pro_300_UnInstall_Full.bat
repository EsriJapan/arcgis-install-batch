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
echo ArcGIS Pro 3.0 の一括アンアンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
echo ・ArcGIS Pro 3.0 Patch 1 （3.0.1）
echo ・ArcGIS Pro オフライン ヘルプ
echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.0 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.0 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{FE78CD1B-4B17-4634-BBF7-3A597FFFAA69}" MSIPATCHREMOVE="{8F743BC6-7D74-489C-ABF9-5769CF6343C6}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{61E79DA6-2654-4E03-85FA-410F8F914ADE}" /norestart /passive /qb
echo オフライン ヘルプ のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.0 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{BFD9089E-7AFF-4BA4-86B9-A185CD5AA794}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{C338A9BB-6D4C-4033-B78B-803D53B73F63}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 3.0 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{3AFB366C-9CA0-483B-A773-680216789FE6}" /norestart /passive /qb
REM echo ArcGIS Pro 3.0 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.0 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{FE78CD1B-4B17-4634-BBF7-3A597FFFAA69}" /norestart /passive /qb
echo ArcGIS Pro 3.0 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.0 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
