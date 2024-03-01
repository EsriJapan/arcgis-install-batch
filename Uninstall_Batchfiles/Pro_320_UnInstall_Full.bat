@echo off
REM ------------------------------
REM ArcGIS Pro 3.2 の一括アンインストール
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
REM バッチファイルに含めてプロダクトは Pro_320_Install_Full.bat に含めている次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro
REM ArcGIS Pro 3.2 Patch 1 （3.2.1）
REM ArcGIS Pro 3.2 Patch 2 （3.2.2）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.2 の一括アンアンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
echo ・ArcGIS Pro 3.2 Patch 1 （3.2.1）
echo ・ArcGIS Pro 3.2 Patch 2 （3.2.2）
echo ・ArcGIS Pro オフライン ヘルプ
REM echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.2 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.2 Patch 2 のアンインストール
%windir%\System32\msiexec.exe /I "{76DFAD3E-96C5-4544-A6B4-3774DBF88B4E}" MSIPATCHREMOVE="{4DB9A345-FC1D-4798-BF01-161C077EE73F}" /norestart /passive /qb

echo ArcGIS Pro 3.2 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{76DFAD3E-96C5-4544-A6B4-3774DBF88B4E}" MSIPATCHREMOVE="{2A5E0C4A-1C0D-429C-BEEF-C6D452DC51CB}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{2155C707-CEE9-4B4B-86FD-4393ED012765}" /norestart /passive /qb
echo オフライン ヘルプ のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.2 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{5406B1BB-6FB9-4334-87D1-A653D2A70610}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{E54143C4-7364-4146-9241-E04027429033}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 3.2 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{7FFFFCBC-0C97-4B5A-9A5D-74A79D0C43AF}" /norestart /passive /qb
REM echo ArcGIS Pro 3.2 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.2 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{76DFAD3E-96C5-4544-A6B4-3774DBF88B4E}" /norestart /passive /qb
echo ArcGIS Pro 3.2 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.2 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
