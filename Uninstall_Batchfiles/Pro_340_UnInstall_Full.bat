@echo off
REM ------------------------------
REM ArcGIS Pro 3.4 の一括アンインストール
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
REM ArcGIS Pro
REM ArcGIS Pro 3.4 Patch 1 （3.4.1）
REM ArcGIS Pro 3.4 Patch 2 （3.4.2）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.4 の一括アンアンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
echo ・ArcGIS Pro 3.4 Patch 1 （3.4.1）
echo ・ArcGIS Pro 3.4 Patch 2 （3.4.2）
echo ・ArcGIS Pro オフライン ヘルプ
REM echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.4 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.4 Patch 2 のアンインストール
%windir%\System32\msiexec.exe /I "{F6FDD729-EC3F-4361-A98E-B592EEF0D445}" MSIPATCHREMOVE="{C54F2A9E-07DF-4245-8B34-CD7FBF02A649}" /norestart /passive /qb

echo ArcGIS Pro 3.4 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{F6FDD729-EC3F-4361-A98E-B592EEF0D445}" MSIPATCHREMOVE="{186A82E2-C57E-4922-A6D5-0AAE54F7985A}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{A984FEE4-6049-40E4-B5C7-ECBDFF33BCEB}" /norestart /passive /qb
echo オフライン ヘルプ のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.4 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{10827677-5D07-4A87-9671-4BB59C155883}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{BDB0A52A-0EEA-48B2-9801-49E0C23E834C}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 3.4 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{7F066F83-DA01-44F2-9666-6EFA801CCB3D}" /norestart /passive /qb
REM echo ArcGIS Pro 3.4 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.4 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{F6FDD729-EC3F-4361-A98E-B592EEF0D445}" /norestart /passive /qb
echo ArcGIS Pro 3.4 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.4 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
