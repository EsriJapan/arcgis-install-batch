REM ArcGIS Engine 10.5.1の一括インストール

@echo off
REM 以下を参考にして編集しました
REM 参考：https://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

set __COMPAT_LAYER=RunAsInvoker

REM 相対パスで処理するためバッチファイルの実行ディレクトリを設定
set curpath=%~dp0


REM デスクトップのインストール
echo ArcGIS Engine 10.5.1のインストールを開始します


REM 事前に必要なものをインストール
IF not EXIST "C:\Program Files (x86)" GOTO 32BIT

echo MSXML6 64-bit のインストール...
REM install MSXML6
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_Japanese\SetupFiles\Support\Msxml6\x64\msxml6_x64.msi" /norestart /passive /qb



:32BIT
echo MSXML6 のインストール...
REM install MSXML6
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_Japanese\SetupFiles\Support\Msxml6\x86\msxml6.msi" /norestart /passive /qb



REM ArcGIS Engine本体のインストール
echo ArcGIS Engine 10.5.1 のインストール... インストールにはしばらく時間がかかります...
REM Install ArcGIS Engine 10.5.1
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_Japanese\SetupFiles\setup.msi" /norestart /passive /qb

REM 日本語パックのインストール
echo ArcGIS Engine 10.5.1 日本語パック のインストール...
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_Japanese\SetupFiles\Supplement\EngineJapanese.msi" /norestart /passive /qb


REM 国内対応パックのインストール
echo ArcGIS Engine 10.5.1 国内対応パック のインストール...
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\Engine_JpnPack\JpnPack_Engine10_5_1.msi" /norestart /passive /qb


IF not EXIST "C:\Program Files (x86)" GOTO 64BITEND

echo ArcGIS Engine 10.5.1 64-bit Background Geoprocessing のインストール...
REM 64-bit Background Geoprocessing Extension
C:\WINDOWS\system32\msiexec.exe /I "%curpath%\EngineBackgroundGP_Japanese\SetupFiles\setup.msi" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.5.1のインストール終了



REM パッチのインストール
echo パッチのインストール開始

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch
C:\WINDOWS\system32\msiexec.exe /p "%curpath%\Engine_Patches\ArcGIS-1051-E-SAIAT-Patch.msp" /norestart /passive /qb


REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch 64-bit
C:\WINDOWS\system32\msiexec.exe /p "%curpath%\Engine_Patches\ArcGIS-1051-BGE-SAIAT-Patch.msp" /norestart /passive /qb

:64BITPatchesEnd

echo パッチのインストール終了

pause
exit /b
