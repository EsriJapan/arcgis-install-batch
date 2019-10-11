@echo off
REM 
REM ArcGIS Desktop 10.7.1 の一括インストール
REM 
REM 以下を参考にして編集しました
REM 参考：https://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat

set __COMPAT_LAYER=RunAsInvoker

REM 相対パスで処理するためバッチファイルの実行ディレクトリを設定
set curpath=%~dp0


REM デスクトップのインストール
echo ArcGIS Desktop 10.7.1のインストールを開始します


REM 事前に必要なものをインストール
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1ではMSXMLは含まれていない
REM echo MSXML6 64-bit のインストール...
REM install MSXML6
REM %windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Support\MSXML6\64-bit\msxml6_x64.msi" /norestart /passive /qb


:32BIT
REM echo MSXML6 のインストール...
REM install MSXML6
REM %windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Support\MSXML6\32-bit\msxml6.msi" /norestart /passive /qb


REM 10.6からMicrosoft Visual C++ 2017 再配布可能(x86)パッケージ事前インストールが追加された（Setup.exeだと自動で判別）
REM Microsoft Visual C++ 20xx 再配布可能パッケージ 内のDLL一覧
REM https://docs.microsoft.com/ja-jp/cpp/ide/install-a-missing-microsoft-visual-cpp-runtime-dll
REM 
REM 1) Microsoft Visual C++ 2017 再配布可能(x86)パッケージ のうち次のdllの存在チェック
REM %windir%\System32\msvcp140.dll
REM 
REM 2)「msvcp140.dll」は VC++2015 と VC++ 2017 に含まれるファイルのためため wmic コマンドで、dllの version のマイナーバージョンをチェック
REM VC++ 2015 の場合 version 14.0.xxxxx.0   (Major 14, Minor 0)
REM VC++ 2017 の場合 version 14.10.xxxxx.0  (Major 14, Minor 10)
REM 10.6.1では アップデート5以降が必要： 
REM VC++ 2017 （アップデート 5 以降）の場合 version 14.12.25810 (Major 14, Minor 12)
REM 
REM [参考：wmicを使ってバッチファイルでバージョンを取得]:
REM https://stackoverflow.com/questions/25162348/find-the-version-of-a-installed-program-from-batch-file

REM VCのマイナーバージョン比較用
set VCVERSION=12

IF EXIST "%windir%\System32\msvcp140.dll" GOTO VC2017SKIP
echo Microsoft Visual C++ 2017 再配布可能(x86)パッケージ のインストール...
"%curpath%\Desktop_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x86.exe" /norestart /passive /qb
GOTO VC2017END


:VC2017SKIP
REM 2)の場合
REM dll ファイルから version を取得
setlocal ENABLEDELAYEDEXPANSION

REM version の確認したいファイルを設定
REM set "name='C:\Windows\System32\msvcp140.dll'"
set "name='%windir%\System32\msvcp140.dll'"

REM wmic用にパスを\から\\に変換
REM set "name='C:\\Windows\\System32\\msvcp140.dll'"
set "name=%name:\=\\%"

REM wmic.exe で version を取得
FOR /F "tokens=2 delims==" %%I IN (
  'wmic datafile where "name=%name%" get version /format:list'
) DO SET "VERSION=%%I"
REM ECHO %VERSION%

REM VERSIONを取得できなかった場合
IF "%VERSION%"=="" GOTO GETVESIONERROR

REM version から major と minor を分ける
FOR /F "tokens=1-2 delims=." %%J IN ("%VERSION%") DO (
  SET MAJOR=%%J
  SET MINOR=%%K
)
REM ECHO %MAJOR%
REM ECHO %MINOR%

endlocal


REM 結果の表示
IF MINOR gtr VCVERSION (
REM  ECHO "VC++2017のmsvcp140.dllが入っている(MINOR 12 : UPDATE5)"
GOTO VC2017END
)
REM ELSE (
REM  ECHO "VC++2015のmsvcp140.dllが入っている"
REM )
echo Microsoft Visual C++ 2017 再配布可能(x86)パッケージ のインストール...
"%curpath%\Desktop_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x86.exe" /norestart /passive /qb



:VC2017END

REM ArcGIS Desktop本体のインストール
echo ArcGIS Desktop 10.7.1 のインストール... インストールにはしばらく時間がかかります...
REM Install ArcGIS Desktop 10.7
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\setup.msi" /norestart /passive /qb

REM 日本語パックのインストール
echo ArcGIS Desktop 10.7.1 日本語パック のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_Japanese\SetupFiles\Supplement\DesktopJapanese.msi" /norestart /passive /qb


REM 国内対応パックのインストール
echo ArcGIS Desktop 10.7.1 国内対応パック のインストール...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_JpnPack\JpnPack_Desktop10_7_1.msi" /norestart /passive /qb


IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

REM 10.6からMicrosoft Visual C++ 2017 再配布可能(x64)パッケージ事前インストールが追加された（Setup.exeだと自動で判別）
IF EXIST "%windir%\System32\msvcp140.dll" GOTO VC201764SKIP
echo Microsoft Visual C++ 2017 再配布可能(x64)パッケージ のインストール...
"%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x64.exe" /norestart /passive /qb
GOTO VC201764END


:VC201764SKIP
IF MINOR gtr VCVERSION (
REM ECHO "VC++2017のmsvcp140.dll(MINOR 12 : UPDATE5)"
GOTO VC201764END
)
REM ELSE (
REM 
REM )
echo Microsoft Visual C++ 2017 再配布可能(x64)パッケージ のインストール...
"%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x64.exe" /norestart /passive /qb

:VC201764END

echo ArcGIS Desktop 10.7.1 64-bit Background Geoprocessing のインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /I "%curpath%\DesktopBackgroundGP_Japanese\SetupFiles\setup.msi" /norestart /passive /qb


REM 国内対応パック 64-bit のインストール
echo ArcGIS Desktop 10.7.1 64-bit 国内対応パックのインストール ...
%windir%\System32\msiexec.exe /I "%curpath%\Desktop_JpnPack\JpnPack_Desktop10_7_1_Background.msi" /norestart /passive /qb

:64BITEND

echo ArcGIS Desktop 10.7.1 のインストール終了



REM パッチのインストール
echo パッチのインストール開始

REM 2019/10/07 リリース時点
echo 01_Security Update Compatibility Patch
%windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-1071-DT-MWJUN2019SUC-Patch.msp" /norestart /passive /qb








REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

REM 2019/10/07 リリース時点 なし
REM echo 0x_
REM %windir%\System32\msiexec.exe /p "%curpath%\Desktop_Patches\ArcGIS-xxxxxx.msp" /norestart /passive /qb


echo 

:64BITPatchesEnd

echo パッチのインストール終了
GOTO EXITEND

:GETVESIONERROR
ECHO "Microsoft Visual C++ 2017 再配布可能(x86)パッケージ の msvcp140.dll バージョン取得に失敗しました。"
ECHO "Desktop_Japanese\SetupFiles\Support\VCREDIST\VC_redist.x86.exe を直接実行後、再度バッチファイルを実行してください"

:EXITEND

pause
exit /b
