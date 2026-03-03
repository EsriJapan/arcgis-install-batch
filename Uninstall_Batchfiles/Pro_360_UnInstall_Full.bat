@echo off
REM ------------------------------
REM ArcGIS Pro 3.6 の一括アンインストール
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
REM バッチファイルに含めてプロダクトは Pro_360_Install_Full.bat に含めている次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro 3.6
REM ArcGIS Pro 3.6 Patch 1 （3.6.1）
REM ArcGIS Pro 3.6 Patch 2 （3.6.2）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.6 の一括アンインストール の対象
echo -----------------------------------
echo ・ArcGIS Pro 3.6
echo ・ArcGIS Pro 3.6 Patch 1 （3.6.1）
echo ・ArcGIS Pro 3.6 Patch 2 （3.6.2）
echo ・ArcGIS Pro オフライン ヘルプ
REM echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker


REM デスクトップのアンインストール
echo ArcGIS Pro 3.6 のアンインストールを開始します


REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 3.6 Patch 2 のアンインストール
%windir%\System32\msiexec.exe /I "{302EF432-616C-4281-94F6-D53E290D0F77}" MSIPATCHREMOVE="{AB09DC6E-5AA2-435D-AC06-9DC29DAD51BB}" /norestart /passive /qb

echo ArcGIS Pro 3.6 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{302EF432-616C-4281-94F6-D53E290D0F77}" MSIPATCHREMOVE="{C5BC3276-329B-49DA-BFE6-C353D5ECA2AF}" /norestart /passive /qb

echo パッチのアンインストール終了
echo.

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{38E02DEB-7EFC-472D-B4FE-F81084C60BA8}" /norestart /passive /qb
echo オフライン ヘルプ のアンインストール終了
echo.

REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 3.6 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{CE27E446-560D-468C-A25C-9B9A21C0F182}" /norestart /passive /qb
echo 日本語パック のアンインストール終了
echo.

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{EC69EF87-007E-43AA-96D3-E9ABB12980EF}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 3.6 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{C1BC0512-8B35-4229-AB23-373509FEBAFC}" /norestart /passive /qb
REM echo ArcGIS Pro 3.6 Data Interoperability アンインストール終了
REM echo.

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 3.6 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{302EF432-616C-4281-94F6-D53E290D0F77}" /norestart /passive /qb
echo ArcGIS Pro 3.6 のアンインストール終了
echo.


REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.6 用 データベースサポートファイル は必要に応じてアンインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてアンインストールしてください
echo.

pause
exit /b
