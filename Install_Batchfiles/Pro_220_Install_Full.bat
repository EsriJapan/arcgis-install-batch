@echo off
REM 
REM ArcGIS Pro 2.2の一括インストール
REM 

REM 以下を参考にして編集しました
REM 参考：https://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

set __COMPAT_LAYER=RunAsInvoker

REM 相対パスで処理するためバッチファイルの実行ディレクトリを設定
set curpath=%~dp0


REM デスクトップのインストール
echo ArcGIS Pro 2.2 のインストールを開始します


REM 事前に必要なものをインストール
REM Proは事前に必要なものは.NET Framework 4.6.1


REM ArcGIS Pro 本体のインストール
echo ArcGIS Pro 2.2 本体のインストール... インストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 /norestart /passive /qb

REM ArcGIS Pro 日本語パックのインストール
echo ArcGIS Pro 2.2 日本語パック のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb


REM ArcGIS Helpインストール
echo ArcGIS Pro オフライン ヘルプ のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\ArcGISProHelp_Japanese\ArcGISProHelp_Japanese.msi" /norestart /passive /qb


echo ArcGIS Pro 2.2 のインストール終了



REM パッチのインストール
echo パッチのインストール開始

REM 最新の Patch　4 をインストール
echo ArcGIS Pro 2.2 Patch 4 のインストール 
%windir%\System32\msiexec.exe /p "%curpath%\ArcGISPro_Patches\ArcGIS_Pro_224_165832.msp" /norestart /passive /qb

echo パッチのインストール終了

REM その他:ArcGIS Pro 2.0 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボルなどはバッチでは？
echo 注1)ArcGIS Pro 2.2 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてインストールしてください
echo 注2)日本用地図シンボル は必要に応じてインストールしてください


pause
exit /b
