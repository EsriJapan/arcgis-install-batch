@echo off
REM ------------------------------
REM ArcGIS Pro 2.8 の一括インストール
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

REM 
REM バッチファイルに含めているプロダクト
REM 
REM バッチファイルに含めてプロダクトは My Esri からダウンロードする次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro
REM ArcGIS Pro 2.8 Patch 1 （2.8.1）
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
echo ArcGIS Pro 2.8 の一括インストール の対象
echo -----------------------------------
echo ・ArcGIS Pro
echo ・ArcGIS Pro 2.8 Patch 1 （2.8.1）
echo ・ArcGIS Pro オフライン ヘルプ
REM echo ・ArcGIS Data Interoperability for Pro （英語）
echo ・ArcGIS Coordinate Systems Data （英語）
echo.

set __COMPAT_LAYER=RunAsInvoker

REM 相対パスで処理するためバッチファイルの実行ディレクトリを設定
set curpath=%~dp0


REM デスクトップのインストール
echo ArcGIS Pro 2.8 のインストールを開始します


REM 事前に必要なものをインストールチェック
REM Pro 2.8 で事前に必要なものは.NET Framework 4.8
REM レジストリ値をチェック
REM reg query "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" /v "Release"
REM .NET での Release 値はMSのサイトに記載されている
REM https://docs.microsoft.com/ja-jp/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
REM 528040(80ea8) - .NET 4.8
set /A COMPNET = 528040
echo .NET Framework のバージョンをチェックします...
FOR /F "tokens=1,2,*" %%I IN ('REG QUERY "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" /v "Release"') DO (
  REM SET /A VAL = %%K で数値として格納
  IF "%%I"=="Release" SET /A NETVAL=%%K
)

IF %NETVAL% geq %COMPNET% (
  GOTO NETOK
) else (
  GOTO NETNG
)

:NETOK
echo .NET Framework 4.8 を確認しました。インストール可能です。
echo.

REM ArcGIS Pro 本体のインストール
REM 2.8 からエンド ユーザー使用許諾契約書 (EULA)のACCEPTEULAが必須パラメータとして追加
REM ArcGIS Proのサイレントインストール時のパラメータ詳細はインストールガイドに記載されています
REM https://pro.arcgis.com/ja/pro-app/latest/get-started/arcgis-pro-installation-administration.htm
echo ArcGIS Pro 2.8 本体のインストール... インストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 ACCEPTEULA=YES /norestart /passive /qb

REM ArcGIS Pro 日本語パックのインストール
echo ArcGIS Pro 2.8 日本語パック のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb


REM ArcGIS Helpインストール
echo ArcGIS Pro オフライン ヘルプ のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISProHelp_Japanese\ArcGISProHelp_Japanese.msi" /norestart /passive /qb


echo ArcGIS Pro 2.8 のインストール終了
echo.


REM パッチのインストール
echo パッチのインストール開始


echo ArcGIS Pro 2.8 Patch 1 のインストール...
%windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_281_177644.msp" /norestart /passive /qb


echo パッチのインストール終了
echo.

REM ArcGIS Coordinate Systems Data のインストール
echo ArcGIS Coordinate Systems Data のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\CoordinateSystemsData\SetupFiles\CSD.msi" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data のインストール終了
echo.

REM Data Interoperability のインストール
REM echo ArcGIS Pro 2.8 Data Interoperability のインストール...
REM %windir%\System32\msiexec.exe /I "%curpath%\ArcGISProDataInterop\DataInteropPro.msi" ALLUSERS=1 /norestart /passive /qb

REM echo ArcGIS Pro 2.8 Data Interoperability のインストール終了
REM echo.



REM その他:ArcGIS Pro 用 ST_Geometry ライブラリ や ODBC Driverなどは必要に応じて
REM その他:日本用地図シンボルなど
echo.
echo 注1)ArcGIS Pro 2.8 用 データベースサポートファイル は必要に応じてMy Esriから入手してインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてArcGIS リソース集（https://doc.esrij.com/pro/get-started/setup/user/）を参照の上、インストールしてください
echo.

GOTO EXITEND

:NETNG
echo 事前条件の .NET Framework 4.8 を確認できないため、インストールを継続できません。
GOTO EXITEND

:EXITEND

pause
exit /b
