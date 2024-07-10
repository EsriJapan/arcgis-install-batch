@echo off
REM ------------------------------
REM ArcGIS Pro 3.3 の一括アンインストール
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
REM バッチファイルに含めてプロダクトは Pro_330_Install_Full.bat に含めている次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro
REM ArcGIS Pro 3.3 Patch 1 （3.3.1）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.3 の一括アンアンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
echo ・ArcGIS Pro 3.3 Patch 1 （3.3.1）
echo ・ArcGIS Pro オフライン ヘルプ
REM echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.3 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.3 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{B43BC6C2-05D2-460B-AEE4-D15A9CA7B55E}" MSIPATCHREMOVE="{777E3487-252E-425C-9A15-1CC295BC3AD0}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{3B6512E0-CD2E-4600-A920-7C55A8F60578}" /norestart /passive /qb
echo オフライン ヘルプ のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.3 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{96416E1C-DAA6-48E4-8D3C-F5E227571CF0}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{F6ADF209-AC1B-4BA6-AED3-13DF20F6CFB8}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 3.3 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{37F59181-A898-46C4-BBFC-B209FED50428}" /norestart /passive /qb
REM echo ArcGIS Pro 3.3 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.3 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{B43BC6C2-05D2-460B-AEE4-D15A9CA7B55E}" /norestart /passive /qb
echo ArcGIS Pro 3.3 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.3 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
