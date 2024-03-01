@echo off
REM ------------------------------
REM ArcGIS Pro 3.2 の一括インストール
REM ------------------------------

REM 
REM 以下を参考にして編集しました
REM 参考：https://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat
REM 


REM バッチでの.NET Framework のバージョンチェックは以下を参考にしました。
REM 参考:https://www.atmarkit.co.jp/ait/articles/1210/26/news086.html
REM 
REM レジストリの値はMSのサイトにあります。
REM 参考:https://docs.microsoft.com/ja-jp/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
REM   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full
REM   .NET Framework 4.8 の場合は Release REG_DWORD 値 528040
REM 


REM Pro 3.0 は.NET 6 Desktop Runtime x64 が必要となるため、.NET Core version のバージョンチェックの部分を書き直し（2022年8月）
REM 
REM 参考: winget での.NET デスクトップ ランタイム をwinget でインストールする場合
REM   >winget install Microsoft.DotNet.DesktopRuntime.6
REM   https://docs.microsoft.com/ja-jp/dotnet/core/install/windows?tabs=net60
REM 
REM 参考： レジストリの値をチェックする方法
REM   https://stackoverflow.com/questions/73336550/is-there-a-way-to-determine-via-registry-net-core-version-with-nsis
REM   HKEY_LOCAL_MACHINE\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost
REM   Version REG_SZ 値 6.0.x
REM 
REM   x64のレジストリで一覧を取得（x64のレジストリで一覧を取得して、REG_DWORDのキーをチェック）
REM   HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\dotnet\Setup\InstalledVersions\x64\sharedfx\Microsoft.WindowsDesktop.App
REM   5.0.x REG_DWORD 値 1
REM   6.0.x REG_DWORD 値 1 (x >= 5 : Pro は6.0.5 以上が必要)
REM 
REM 参考： .NET SDK をインストールしている環境であれば、dotnet --list-runtimes でランタイムの一覧を取得してチェックする方法を利用可能
REM   >dotnet --list-runtimes
REM   Microsoft.AspNetCore.All 2.1.28 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.All]
REM   ～省略～
REM   Microsoft.NETCore.App 2.1.28 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 3.1.15 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 5.0.6 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 6.0.8 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   ～省略～
REM   Microsoft.WindowsDesktop.App 5.0.6 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM   Microsoft.WindowsDesktop.App 6.0.8 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM 
REM   取得したRuntimeの一覧から Microsoft.WindowsDesktop.App 6.0.x が存在するかをチェックする
REM   注意事項：バッチファイルのfor文の中で変数を操作しても期待した挙動にならないときには「遅延環境変数の展開というものを使う」とよいらしい
REM     参考：http://dalmore.blog7.fc2.com/blog-entry-79.html
REM 
REM   dotnet コマンドの参考：
REM     .NET が既にインストールされていることを確認する方法：https://docs.microsoft.com/ja-jp/dotnet/core/install/how-to-detect-installed-versions?pivots=os-windows


REM 
REM バッチファイルに含めているプロダクト
REM 
REM バッチファイルに含めてプロダクトは My Esri からダウンロードする次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro 3.2
REM ArcGIS Pro 3.2 Patch 1 （3.2.1）
REM ArcGIS Pro 3.2 Patch 2 （3.2.2）
REM ArcGIS Pro オフライン ヘルプ
REM ArcGIS Data Interoperability for Pro （英語）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM 
REM 上記のダウンロードしたファイルを、それぞれ解凍先を本バッチファイルを置いたフォルダーに指定して解凍を行います。
REM 参考:ArcGIS Desktop 楽々インストール ～バッチ ファイルの作成方法をご紹介～
REM https://blog.esrij.com/2018/03/30/post-29732/
REM 

echo.
echo -----------------------------------
echo ArcGIS Pro 3.2 の一括インストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
REM echo ・ArcGIS Pro 3.2 Patch 1 （3.2.1）
echo ・ArcGIS Pro 3.2 Patch 2 （3.2.2）
echo ・ArcGIS Pro オフライン ヘルプ
echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker

REM 相対パスで処理するためバッチファイルの実行ディレクトリを設定
set curpath=%~dp0


REM デスクトップのインストール
echo ArcGIS Pro 3.2 のインストールを開始します


REM 事前に必要なものをインストールチェック
REM 
REM Pro 3.0 で事前に必要なものは.NET 6 Desktop Runtime x64
REM 
REM a) .NET SDK をインストールしている環境の場合
REM dotnet --list-runtimes でランタイムの一覧を取得してチェックする方法
REM   >dotnet --list-runtimes
REM   Microsoft.AspNetCore.All 2.1.28 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.All]
REM   ～省略～
REM   Microsoft.NETCore.App 2.1.28 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 3.1.15 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 5.0.6 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   Microsoft.NETCore.App 6.0.8 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
REM   ～省略～
REM   Microsoft.WindowsDesktop.App 5.0.6 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM   Microsoft.WindowsDesktop.App 6.0.8 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
REM 
REM   取得したRuntimeの一覧から Microsoft.WindowsDesktop.App 6.0.x が存在するかをチェックする
REM   注意事項：バッチファイルのfor文の中で変数を操作しても期待した挙動にならないときには「遅延環境変数の展開というものを使う」とよいらしい
REM     参考：http://dalmore.blog7.fc2.com/blog-entry-79.html
REM 
REM setlocal enabledelayedexpansion
REM set /A FULLVERSION=605
REM set CHECK_DR=FALSE
REM FOR /F "tokens=2,4,5,6,* delims=. " %%I IN ('dotnet --list-runtimes') DO (
REM   REM 確認用
REM   REM echo %%I %%J %%K %%L
REM   REM   AspNetCore 5 0 6
REM   REM   NETCore 6 0 8
REM   REM   WindowsDesktop 5 0 6
REM   REM                        等と出力されるはず
REM   IF "%%I%%J"=="WindowsDesktop6" (
REM     SET /A FULLNETDRVAL=%%J%%K%%L
REM     REM 確認用
REM     REM echo !FULLNETDRVAL! ^>^= %FULLVERSION%
REM     IF !FULLNETDRVAL! geq %FULLVERSION% SET CHECK_DR=TRUE
REM   )
REM )

REM b) .NET SDK をインストールしていない環境の場合（x64のレジストリで一覧を取得して、REG_DWORDのキーをチェック）
REM   reg query "HKLM\SOFTWARE\WOW6432Node\dotnet\Setup\InstalledVersions\x64\sharedfx\Microsoft.WindowsDesktop.App" /t "REG_DWORD"
REM   5.0.x REG_DWORD 値 1
REM   6.0.x REG_DWORD 値 1 (x >= 5 : Pro は6.0.5 以上が必要)
REM 
setlocal enabledelayedexpansion
set /A FULLVERSION=605
set CHECK_DR=FALSE
FOR /F "tokens=1,2,3,* delims=. " %%I IN ('reg query "HKLM\SOFTWARE\WOW6432Node\dotnet\Setup\InstalledVersions\x64\sharedfx\Microsoft.WindowsDesktop.App" /t "REG_DWORD"') DO (
  REM 確認用
  REM echo %%I %%J %%K %%L
  REM 5 0 6 REG_DWORD 0x1
  REM 6 0 8 REG_DWORD 0x1 と表示される
  SET /A FULLNETDRVAL=%%I%%J%%K
  REM Microsoft.WindowsDesktop.App 6.0.5 以上がインストールされている場合
  IF !FULLNETDRVAL! geq %FULLVERSION% (
    REM 確認用
    REM echo !FULLNETDRVAL! ^>^= %FULLVERSION%
    SET CHECK_DR=TRUE
  )
)

IF %CHECK_DR%==TRUE (
  REM echo .NET 6 Desktop Runtime x64 を確認しました。インストール可能です。
  GOTO NETDROK
) ELSE (
  REM echo .NET 6 Desktop Runtime x64 が見当たりません。最初にインストールしてください。
  GOTO NETDRNG
)

endlocal

:NETDROK
echo .NET 6 Desktop Runtime x64 を確認しました。インストール可能です。
echo.


REM ArcGIS Pro 本体のインストール
REM 2.8 からエンド ユーザー使用許諾契約書 (EULA)のACCEPTEULAが必須パラメータとして追加
REM ArcGIS Proのサイレントインストール時のパラメータ詳細はインストールガイドに記載されています
REM https://pro.arcgis.com/ja/pro-app/latest/get-started/arcgis-pro-installation-administration.htm
echo ArcGIS Pro 3.2 本体のインストール... インストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 ACCEPTEULA=YES /norestart /passive /qb

REM ArcGIS Pro 日本語パックのインストール
echo ArcGIS Pro 3.2 日本語パック のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb


REM ArcGIS Helpインストール
echo ArcGIS Pro オフライン ヘルプ のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISProHelp_Japanese\ArcGISProHelp_Japanese.msi" /norestart /passive /qb


echo ArcGIS Pro 3.2 のインストール終了
echo.


REM パッチのインストール
echo パッチのインストール開始

REM echo ArcGIS Pro 3.2 Patch 1 のインストール...
REM %windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_321_188069.msp" /norestart /passive /qb

echo ArcGIS Pro 3.2 Patch 2 のインストール...
%windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_322_188070.msp" /norestart /passive /qb

echo パッチのインストール終了
echo.

REM ArcGIS Coordinate Systems Data のインストール
echo ArcGIS Coordinate Systems Data のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\CoordinateSystemsData\SetupFiles\CSD.msi" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data のインストール終了
echo.

REM Data Interoperability のインストール
REM echo ArcGIS Pro 3.2 Data Interoperability のインストール...
REM %windir%\System32\msiexec.exe /I "%curpath%\ArcGISProDataInterop\DataInteropPro.msi" ALLUSERS=1 /norestart /passive /qb
REM %windir%\System32\msiexec.exe /I "%curpath%\ArcGISProDataInterop\DataInteropPro.msi" INSTALLDIR="F:\ArcGIS" /norestart /passive /qb

REM echo ArcGIS Pro 3.2 Data Interoperability のインストール終了
REM echo.

REM Data Interoperability パッチのインストール
REM echo Data Interoperability パッチのインストール開始
REM 
REM 
REM echo Data Interoperability パッチのインストール終了
REM echo.

REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 3.2 用 データベースサポートファイル は必要に応じてMy Esriから入手してインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてArcGIS リソース集（https://doc.esrij.com/pro/get-started/setup/user/）を参照の上、インストールしてください
echo.

GOTO EXITEND

:NETDRNG
echo 事前条件の .NET 6 Desktop Runtime x64 を確認できないため、インストールを継続できません。
echo   Download .NET 6.0 （https://dotnet.microsoft.com/en-us/download/dotnet/6.0） から .NET Desktop Runtime x64 のインストーラーを入手してインストールするか、
echo   winget install Microsoft.DotNet.DesktopRuntime.6 でインストールしてください （https://docs.microsoft.com/ja-jp/dotnet/core/install/windows?tabs=net60）
GOTO EXITEND

:EXITEND

pause
exit /b
