@echo off
REM 
REM ArcGIS Pro 2.7の一括インストール
REM 

REM 以下を参考にして編集しました
REM 参考：https://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

REM バッチでの.NET Framework のバージョンチェックは以下を参考にしました。
REM 参考:https://www.atmarkit.co.jp/ait/articles/1210/26/news086.html

REM レジストリの値はMSのサイトにあります。
REM 参考:https://docs.microsoft.com/ja-jp/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
REM   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full
REM   .NET Framework 4.8 の場合は Release REG_DWORD 値 528040

set __COMPAT_LAYER=RunAsInvoker

REM 相対パスで処理するためバッチファイルの実行ディレクトリを設定
set curpath=%~dp0


REM デスクトップのインストール
echo ArcGIS Pro 2.7 のインストールを開始します


REM 事前に必要なものをインストールチェック
REM Pro 2.7 で事前に必要なものは.NET Framework 4.8
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
echo ArcGIS Pro 2.7 本体のインストール... インストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 /norestart /passive /qb

REM ArcGIS Pro 日本語パックのインストール
echo ArcGIS Pro 2.7 日本語パック のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb


REM ArcGIS Helpインストール
echo ArcGIS Pro オフライン ヘルプ のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISProHelp_Japanese\ArcGISProHelp_Japanese.msi" /norestart /passive /qb


echo ArcGIS Pro 2.7 のインストール終了
echo. 


REM パッチのインストール
echo パッチのインストール開始


REM echo ArcGIS Pro 2.7 Patch 1 のインストール 
REM %windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_271_176643.msp" /norestart /passive /qb

REM echo ArcGIS Pro 2.7 Patch 2 のインストール 
REM %windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_272_176644.msp" /norestart /passive /qb

REM echo ArcGIS Pro 2.7 Patch 3 のインストール 
REM %windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_273_177550.msp" /norestart /passive /qb

echo ArcGIS Pro 2.7 Patch 4 のインストール 
%windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_274_177591.msp" /norestart /passive /qb

echo パッチのインストール終了
echo. 

REM ArcGIS Coordinate Systems Data のインストール
echo ArcGIS Coordinate Systems Data のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\CoordinateSystemsData\SetupFiles\CSD.msi" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data のインストール終了
echo.

REM Data Interoperability のインストール
REM echo ArcGIS Pro 2.7 Data Interoperability のインストール...
REM %windir%\System32\msiexec.exe /I "%curpath%\ArcGISProDataInterop\DataInteropPro.msi" ALLUSERS=1 /norestart /passive /qb


REM echo ArcGIS Pro 2.7 Data Interoperability Patch 1 のインストール
REM %windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_DI_Pro_271_177453.msp" /norestart /passive /qb
REM echo ArcGIS Pro 2.7 Data Interoperability と Patch 1 のインストール終了
REM echo. 


REM その他:ArcGIS Pro 2.0 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボルなどはバッチでは？
echo 注1)ArcGIS Pro 2.7 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてインストールしてください
echo 注2)日本用地図シンボル は必要に応じてインストールしてください


GOTO EXITEND

:NETNG
echo 事前条件の .NET Framework 4.8 を確認できないため、インストールを継続できません。
GOTO EXITEND

:EXITEND

pause
exit /b
