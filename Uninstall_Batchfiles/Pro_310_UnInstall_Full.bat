@echo off
REM ------------------------------
REM ArcGIS Pro 3.1 の一括アンインストール
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
REM バッチファイルに含めてプロダクトは Pro_310_Install_Full.bat に含めている次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro
REM ArcGIS Pro 3.1 Patch 1 （3.1.1）
REM ArcGIS Pro 3.1 Patch 2 （3.1.2）
REM ArcGIS Pro 3.1 Patch 3 （3.1.3）
REM ArcGIS Pro 3.1 Patch 4 （3.1.4）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.1 の一括アンアンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
echo ・ArcGIS Pro 3.1 Patch 4 （3.1.4）
echo ・ArcGIS Pro 3.1 Patch 3 （3.1.3）
echo ・ArcGIS Pro 3.1 Patch 2 （3.1.2）
echo ・ArcGIS Pro 3.1 Patch 1 （3.1.1）
echo ・ArcGIS Pro オフライン ヘルプ
REM echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.1 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.1 Patch 4 のアンインストール
%windir%\System32\msiexec.exe /I "{A61AD307-865F-429F-B2A3-5618BD333F7E}" MSIPATCHREMOVE="{A5BD739B-82EF-4639-AF9A-ECA8CD94D04F}" /norestart /passive /qb

echo ArcGIS Pro 3.1 Patch 3 のアンインストール
%windir%\System32\msiexec.exe /I "{A61AD307-865F-429F-B2A3-5618BD333F7E}" MSIPATCHREMOVE="{B7B84ECD-4C8C-4B4A-BD37-B74B1AAB6751}" /norestart /passive /qb

echo ArcGIS Pro 3.1 Patch 2 のアンインストール
%windir%\System32\msiexec.exe /I "{A61AD307-865F-429F-B2A3-5618BD333F7E}" MSIPATCHREMOVE="{F9AA4027-F2BC-41B9-8EBD-86F20AD15654}" /norestart /passive /qb

echo ArcGIS Pro 3.1 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{A61AD307-865F-429F-B2A3-5618BD333F7E}" MSIPATCHREMOVE="{71D98C4E-6A5B-4A9A-B637-D34D9284757E}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{3E750808-A79F-4E06-810A-112883E43B31}" /norestart /passive /qb
echo オフライン ヘルプ のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.1 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{0B7352D5-506E-48AF-BCBA-F30162CE206B}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{D79BA24A-E228-43C4-8FDE-751C2E923C66}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 3.1 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{D7189FF4-999B-4783-8B3D-01B900BFF16C}" /norestart /passive /qb
REM echo ArcGIS Pro 3.1 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.1 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{A61AD307-865F-429F-B2A3-5618BD333F7E}" /norestart /passive /qb
echo ArcGIS Pro 3.1 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.1 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
