@echo off

REM ------------------------------
REM ArcGIS Pro 3.7 の一括インストール
REM ------------------------------

REM 
REM 以下を参考にして編集しました
REM 参考：
REM https://github.com/StanfordGeospatialCenter/arcgis-install-batch/blob/master/ArcGIS%2010.5.1/ArcGIS_10.5.1_Installation_Full_with_ArcHydro_ArcTutor_DataMaps_Patches.bat
REM 

REM 
REM バッチファイルに含めているプロダクト
REM 
REM バッチファイルに含めてプロダクトは My Esri からダウンロードする次のものです。
REM 
REM ---プロダクト コンポーネント---
REM ArcGIS Pro 3.7
REM ArcGIS Pro 3.7 Patch 1 （3.7.1）
REM ArcGIS Pro 3.7 Patch 2 （3.7.2）
REM ---データとコンテンツ---
REM ArcGIS Coordinate Systems Data （英語）
REM ---Document Center---
REM ArcGIS Document Center 
REM ---エクステンション---
REM ArcGIS Data Interoperability for Pro （英語）
REM 
REM 上記のダウンロードしたファイルを、それぞれ解凍先を本バッチファイルを置いたフォルダーに指定して解凍を行います。
REM 参考:
REM ArcGIS Desktop 楽々インストール ～バッチ ファイルの作成方法をご紹介～
REM https://blog.esrij.com/2018/03/30/post-29732/
REM 

set __COMPAT_LAYER=RunAsInvoker

REM 相対パスで処理するためバッチファイルの実行ディレクトリを設定
set curpath=%~dp0

setlocal EnableDelayedExpansion

REM =====================================================
REM 事前に必要なものをインストールチェック
REM =====================================================
REM Pro 3.7 で事前に必要なものは.NET 10 Desktop Runtime x64 および Microsoft Edge WebView2 Runtime
REM Pro 3.7 はオフラインヘルプはDocument Centerのインストーラーに変更され、 ASP.NET Core Runtime 10.0 x64 のチェックも必要
REM 
REM 3.6 まで事前チェックとして使っていたレジストリをクエリする方法は、アンインストール後にレジストリが消されない場合があるようなので、ディレクトリをチェックする方法に変更

REM 事前条件の確認
echo.
echo ==========================================================
echo ArcGIS Pro 3.7 と Document Center のインストール事前条件のチェック
echo ==========================================================
echo.

REM =========================================
REM a) レジストリから dotnet InstallLocation を取得
REM =========================================
set "DOTNET_HOME="
for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\WOW6432Node\dotnet\Setup\InstalledVersions\x64" /v InstallLocation ^| findstr /i "InstallLocation"') do (
  set "DOTNET_HOME=%%B"
)

if not defined DOTNET_HOME (
  echo .NET InstallLocation が取得できません。
  goto NETDRNG
)

REM 確認用
REM echo DOTNET_HOME=!DOTNET_HOME!

REM =========================================
REM b) Microsoft.WindowsDesktop.App の10 があるかをチェック
REM =========================================
set "CHECK_DR=FALSE"
set "RUNTIME_DIR=!DOTNET_HOME!shared\Microsoft.WindowsDesktop.App"

REM 確認用
REM echo RUNTIME_DIR=!RUNTIME_DIR!
if not exist "!RUNTIME_DIR!" (
   echo Microsoft.WindowsDesktop.App が見つかりません。
   goto NETDRNG
)

for /d %%D in ("!RUNTIME_DIR!\*") do (
  for /f "tokens=1 delims=." %%M in ("%%~nxD") do (
    REM 確認用
    REM echo MAJOR=%%M
    if %%M EQU 10 (
      REM 確認用
      REM echo Microsoft.WindowsDesktop.App %%~nxD を検出
      set "CHECK_DR=TRUE"
    )
  )
)

if "!CHECK_DR!"=="FALSE" goto NETDRNG

echo 1) .NET 10 Desktop Runtime x64 を確認しました（ArcGIS Pro 3.7 のインストール事前条件 1/2）

REM =========================================
REM c) Microsoft Edge WebView2 Runtimeのチェック
REM =========================================
REM クエリ:
REM reg query "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" /v "pv"
REM 結果:
REM HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}
REM pv    REG_SZ    126.0.2592.87
REM 3列目がバージョンのようなので、"tokens=3 delims=. " で最初の 126 だけを変数に格納する 
set "CHECK_WV=FALSE"
for /f "tokens=3 delims=. " %%I in ('reg query "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" /v "pv" 2^>nul ^| findstr /i "pv"') do (
  if %%I GEQ 117 (
    set "CHECK_WV=TRUE"
  )
)

for /f "tokens=3 delims=. " %%I in (
  'reg query "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" /v "pv" 2^>nul ^| findstr /i "pv"'
) do (
  if %%I GEQ 117 (
    set "CHECK_WV=TRUE"
  )
)

if "!CHECK_WV!"=="FALSE" goto WVNG

echo 2) WebView2 を確認しました（ArcGIS Pro 3.7 のインストール事前条件 2/2）

REM =========================================
REM d) Document Center のインストールに必要なASP.NET Core Runtime 10のチェック
REM =========================================
set "CHECK_ASP=FALSE"

set "ASP_RUNTIME_DIR=!DOTNET_HOME!shared\Microsoft.AspNetCore.App"

set "DOCUMENTCENTER_AVAILABLE=1"

REM 確認用
REM echo ASP_RUNTIME_DIR=!ASP_RUNTIME_DIR!
if not exist "!ASP_RUNTIME_DIR!" (
  echo Microsoft.AspNetCore.App が見つかりません。
  goto ASPNETNG
)

for /d %%D in ("!ASP_RUNTIME_DIR!\*") do (
  for /f "tokens=1 delims=." %%M in ("%%~nxD") do (
    REM 確認用
    REM echo MAJOR=%%M
    if %%M EQU 10 (
      REM 確認用
      REM echo Microsoft.AspNetCore.App %%~nxD を検出
      set "CHECK_ASP=TRUE"
    )
  )
)

if "!CHECK_ASP!"=="FALSE" goto ASPNETNG

echo 3) ASP.NET Core Runtime 10 x64 を確認しました（Document Center のインストールの事前条件）
echo.

goto MENU_INIT


REM 事前条件がNG
:NETDRNG
echo 1) .NET 10 Desktop Runtime x64 を確認できないため、インストールを継続できません。
echo      Download .NET 10.0 から .NET Desktop Runtime - Windows x64 Installer を入手してインストールするか、
echo      winget install Microsoft.DotNet.DesktopRuntime.10 でインストールしてください
goto EXITEND

:WVNG
echo 2) Microsoft Edge WebView2 Runtime を確認できないため、インストールを継続できません。
echo      Download the WebView2 Runtime から、
echo      Evergreen Bootstrapper (x64) もしくは Evergreen Standalone Installer (x64) を入手してインストールしてください。
goto EXITEND

:ASPNETNG
set "DOCUMENTCENTER_AVAILABLE=0"
echo 3) ASP.NET Core Runtime 10 x64 を確認できないため、Document Center のインストールはスキップします。
echo      Download .NET 10.0 から ASP.NET Core Runtime - Windows x64 Installer を入手してインストールするか、
echo      winget install Microsoft.DotNet.AspNetCore.10 でインストールしたのちに、Document Center を後からインストールしてください。
echo.
pause

goto MENU_INIT


REM =========================================
REM インストール対象選択
REM =========================================
:MENU_INIT
set "INSTALL_PRO=1"
set "INSTALL_CSD=0"
set "INSTALL_DOC=0"
set "INSTALL_DI=0"

goto MENU


:MENU
cls
REM -------------------------
REM チェックボックス表示作成
REM -------------------------
set "MARK_PRO=[X]"
set "MARK_CSD=[ ]"
if !INSTALL_CSD! EQU 1 set "MARK_CSD=[X]"

set "MARK_DOC=[ ]"
if !INSTALL_DOC! EQU 1 set "MARK_DOC=[X]"

set "MARK_DI=[ ]"
if !INSTALL_DI! EQU 1 set "MARK_DI=[X]"

echo.
echo =======================================
echo ArcGIS Pro 3.7 一括インストール対象選択
echo =======================================
echo.
echo 必須
echo.
echo    !MARK_PRO! ArcGIS Pro + Patch
echo.
echo オプション
echo.
echo    !MARK_CSD! 2. Coordinate Systems Data
if !DOCUMENTCENTER_AVAILABLE! EQU 1 (
    echo    !MARK_DOC! 3. Document Center
) else (
    echo    [-] 3. Document Center （ASP.NET Core Runtime 10 が必要）
)
echo    !MARK_DI! 4. Data Interoperability
echo.
echo 操作
echo.
echo    [A] 全て選択
echo    [N] 全て解除
echo    [S] インストール開始
echo    [0] 終了
echo.
echo ---------------------------------------

choice /C 234ANS0 /N /M "選択してください"

REM 0
if errorlevel 7 goto EXITEND

REM S
if errorlevel 6 goto INSTALL_START

REM N
if errorlevel 5 goto CLEAR_ALL

REM A
if errorlevel 4 goto SELECT_ALL

REM 4
if errorlevel 3 goto TOGGLE_DI

REM 3
if errorlevel 2 goto TOGGLE_DOC

REM 2
if errorlevel 1 goto TOGGLE_CSD

goto MENU


:TOGGLE_CSD
if !INSTALL_CSD! EQU 1 (
    set "INSTALL_CSD=0"
) else (
    set "INSTALL_CSD=1"
)
goto MENU


:TOGGLE_DOC
if !DOCUMENTCENTER_AVAILABLE! EQU 0 (
    echo.
    echo Document Center は選択できません。
    echo ASP.NET Core Runtime 10 が必要です。
    pause
    goto MENU
)
if !INSTALL_DOC! EQU 1 (
    set "INSTALL_DOC=0"
) else (
    set "INSTALL_DOC=1"
)
goto MENU


:TOGGLE_DI
if !INSTALL_DI! EQU 1 (
    set "INSTALL_DI=0"
) else (
    set "INSTALL_DI=1"
)
goto MENU


:SELECT_ALL
set "INSTALL_CSD=1"
set "INSTALL_DI=1"
if !DOCUMENTCENTER_AVAILABLE! EQU 1 (
    set "INSTALL_DOC=1"
) else (
    set "INSTALL_DOC=0"
)
goto MENU


:CLEAR_ALL
set "INSTALL_CSD=0"
set "INSTALL_DOC=0"
set "INSTALL_DI=0"
goto MENU



:INSTALL_START

cls

echo.
echo =======================================
echo ArcGIS Pro 3.7 一括インストール対象確認
echo =======================================
echo.
echo    [X] ArcGIS Pro + Patch

if !INSTALL_CSD! EQU 1 (
    echo    [X] Coordinate Systems Data
) else (
    echo    [ ] Coordinate Systems Data
)

if !DOCUMENTCENTER_AVAILABLE! EQU 0 (
    echo    [-] Document Center
) else if !INSTALL_DOC! EQU 1 (
    echo    [X] Document Center
) else (
    echo    [ ] Document Center
)

if !INSTALL_DI! EQU 1 (
    echo    [X] Data Interoperability
) else (
    echo    [ ] Data Interoperability
)

echo.
echo 上記をインストールします。
echo.

choice /C YN /M "開始しますか"

if errorlevel 2 goto MENU
if errorlevel 1 goto INSTALL_EXECUTE


:INSTALL_EXECUTE

echo.
echo インストール処理開始
echo.

REM ArcGIS Pro + Patch
REM start /wait ...
echo ArcGIS Pro 3.7 本体のインストール... インストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /I "%curpath%ArcGISPro_Japanese\SetupFiles\ArcGISPro.msi" ALLUSERS=1 ACCEPTEULA=YES ADDLOCAL=ALL /norestart /passive /qb

set "RET=%ERRORLEVEL%"
if not "%RET%"=="0" (
    echo.
    echo エラー: ArcGIS Pro 3.7 本体のインストールに失敗しました。
    echo 終了コード=%RET%
    goto EXITEND
)

REM ArcGIS Pro 日本語パックのインストール
echo ArcGIS Pro 3.7 日本語パック のインストール...
%windir%\System32\msiexec.exe /I "%curpath%ArcGISPro_Japanese\SetupFiles\Supplement\ProJapaneseLP.msi" /norestart /passive /qb

set "RET=%ERRORLEVEL%"
if not "%RET%"=="0" (
    echo.
    echo エラー: ArcGIS Pro 3.7 日本語パックのインストールに失敗しました。
    echo 終了コード=%RET%
    goto EXITEND
)

echo ArcGIS Pro 3.7 本体および日本語パックのインストール終了
echo.


REM パッチのインストール
echo パッチのインストール開始

echo ArcGIS Pro 3.7 Patch 1 のインストール...
%windir%\System32\msiexec.exe /p "%curpath%ArcGISPro_Patches\ArcGIS_Pro_371_200572.msp" /norestart /passive /qb

echo ArcGIS Pro 3.7 Patch 2 のインストール...
%windir%\System32\msiexec.exe /p "%curpath%ArcGISPro_Patches\ArcGIS_Pro_372_200573.msp" /norestart /passive /qb

echo パッチのインストール終了
echo.

if !INSTALL_CSD! EQU 1 (
    REM Coordinate Systems Data
    REM start /wait ...
    REM ArcGIS Coordinate Systems Data のインストール
    echo ArcGIS Coordinate Systems Data のインストール...
    %windir%\System32\msiexec.exe /I "%curpath%CoordinateSystemsData\SetupFiles\CSD.msi" /norestart /passive /qb
    echo ArcGIS Coordinate Systems Data のインストール終了
    echo.
)

if !INSTALL_DOC! EQU 1 (
    REM Document Center
    REM start /wait ...
    echo ArcGIS Document Center のインストール
    %windir%\System32\msiexec.exe /I "%curpath%ArcGIS_Documentation_Center\DocCenter.msi" ACCEPTEULA=YES /norestart /passive /qb
    echo ArcGIS Document Center のインストール終了
    echo.
)

if !INSTALL_DI! EQU 1 (
    REM Data Interoperability
    REM start /wait ...
    REM Data Interoperability のインストール
    echo ArcGIS Pro 3.7 Data Interoperability のインストール...
    %windir%\System32\msiexec.exe /I "%curpath%ArcGISProDataInterop\DataInteropPro.msi" ALLUSERS=1 /norestart /passive /qb
    REM %windir%\System32\msiexec.exe /I "%curpath%ArcGISProDataInterop\DataInteropPro.msi" INSTALLDIR="F:\ArcGIS" ALLUSERS=1 /norestart /passive /qb
    echo ArcGIS Pro 3.7 Data Interoperability のインストール終了
    echo.
)

echo.
echo 注1)ArcGIS Pro 3.7 用 データベースサポートファイル は必要に応じてMy Esriから入手してインストールしてください
echo 注2)その他、変換ツール、日本用地図シンボル は必要に応じてArcGIS リソース集を参照の上、インストールしてください
echo    ArcGIS リソース集：
echo        https://doc.esrij.com/pro/get-started/setup/user/
echo.

goto EXITEND


:EXITEND
pause
endlocal
exit /b
