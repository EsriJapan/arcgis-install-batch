@echo off
REM ------------------------------
REM ArcGIS Pro 2.8 の一括アンインストール
REM ------------------------------

REM 
REM MSIファイルのアンインストール コマンド
REM >msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM 注1)MSIのGUIDの値は「orca」で *.msiを開き、[Tables] > [Property] > [ProductCode]の値を指定します
REM 
REM MSPファイルのアンインストール コマンド
REM >msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
REM 注2)mspのGUIDの値は「orca」で *.mspを開き、[View]メニュー > [Summary Information]の画面の
REM [Patch Code]=<PatchGUID>と[Targets]=<ProductGUID>の値を指定します
REM 

REM 
REM バッチファイルに含めているプロダクト
REM 
REM バッチファイルに含めてプロダクトは Pro_XXX_Install_Full.bat に含めている次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro
REM ArcGIS Pro 2.8 Patch 1 （2.8.1）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 2.8 の一括アンアンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
echo ・ArcGIS Pro 2.8 Patch 1 （2.8.1）
echo ・ArcGIS Pro オフライン ヘルプ
REM echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 2.8 のアンインストールを開始します




REM パッチのアンインストール
echo パッチのアンインストール開始


echo ArcGIS Pro 2.8 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{26C745E6-B3C1-467B-9523-727D1803EE07}" MSIPATCHREMOVE="{30B03E4E-2629-483D-ADC9-43513BB46C9E}" /norestart /passive /qb


echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{1DCEA7AF-A3CC-47F4-A63D-500E893B455F}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.8 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{D0613622-6318-429E-AA9E-3BF84EC84ED5}" /norestart /passive /qb


REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{A92063C8-47D6-43D8-AB97-9DBCA9B276AD}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 2.8 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{918560B6-96AE-4002-987D-41DE7706F879}" /norestart /passive /qb
REM echo ArcGIS Pro 2.8 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.8 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{26C745E6-B3C1-467B-9523-727D1803EE07}" /norestart /passive /qb

echo ArcGIS Pro 2.8 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 2.8 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
