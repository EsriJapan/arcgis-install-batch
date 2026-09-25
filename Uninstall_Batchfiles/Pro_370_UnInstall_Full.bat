@echo off
REM ------------------------------
REM ArcGIS Pro 3.7 の一括アンインストール
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
REM バッチファイルに含めてプロダクトは Pro_370_Install_Full.bat に含めている次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro 3.7
REM ArcGIS Pro 3.7 Patch 1 （3.7.1）
REM ArcGIS Pro 3.7 Patch 2 （3.7.2）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM ---Document Center---
REM ArcGIS Document Center 
REM ---エクステンション---
REM ArcGIS Data Interoperability for Pro （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.7 の一括アンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro 3.7
echo ・ArcGIS Pro 3.7 Patch 1 （3.7.1）
echo ・ArcGIS Pro 3.7 Patch 2 （3.7.2）
echo ・ArcGIS Coordinate Systems Data （英語）
echo ・ArcGIS Document Center
echo ・ArcGIS Data Interoperability for Pro （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.7 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.7 Patch 2 のアンインストール
%windir%\System32\msiexec.exe /I "{E56D931B-27A0-4C1D-87F8-AFCDCD21A653}" MSIPATCHREMOVE="{C66ED6B0-26F8-4C58-AF16-61D37207F40F}" /norestart /passive /qb

echo ArcGIS Pro 3.7 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{E56D931B-27A0-4C1D-87F8-AFCDCD21A653}" MSIPATCHREMOVE="{19FABA2D-280F-4D39-A272-D470EF231DF6}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Document Center アンインストール
echo ArcGIS Document Center のアンインストール...
%windir%\System32\msiexec.exe /X "{657E2158-F927-4E9D-9DDB-71FFC6401A42}" /norestart /passive /qb
echo Document Center のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.7 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{84713E12-EEAF-4EDE-ADA6-C751C83429BB}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{530E6B47-61C8-4B76-BB52-BAD2102A5461}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
echo ArcGIS Pro 3.7 Data Interoperability のアンインストール...
%windir%\System32\msiexec.exe /X "{1AB8880E-529C-4438-9B1F-269648AD825A}" /norestart /passive /qb
echo ArcGIS Pro 3.7 Data Interoperability アンインストール終了
echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.7 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{E56D931B-27A0-4C1D-87F8-AFCDCD21A653}" /norestart /passive /qb
echo ArcGIS Pro 3.7 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.7 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
