@echo off
REM ArcGIS Desktop 10.7.1 の一括アンインストール
REM MSIファイルのアンインストール コマンド
REM >msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM 注1)MSIのGUIDの値は「orca」で *.msiを開き、[Tables] > [Property] > [ProductCode]の値を指定します
REM 
REM MSPファイルのアンインストール コマンド
REM >msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
REM 注2)mspのGUIDの値は「orca」で *.mspを開き、[View]メニュー > [Summary Information]の画面の
REM [Patch Code]=<PatchGUID>と[Targets]=<ProductGUID>の値を指定します
REM 

set __COMPAT_LAYER=RunAsInvoker



REM デスクトップのインストール
echo ArcGIS Desktop 10.7.1 のアンインストールを開始します


REM 事前に必要なものをアンインストール
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1ではMSXMLはインストーラにない
REM echo MSXML6 64-bit のアンインストール...
REM install MSXML6
REM %windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
REM echo MSXML6 のアンインストール...
REM install MSXML6
REM %windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM パッチのアンインストール
echo パッチのアンインストール開始

REM 2019/10/07 リリース時点
echo 01_Security Update Compatibility Patch
%windir%\System32\msiexec.exe /I "{69262D87-3697-492B-ABED-765DDC15118B}" MSIPATCHREMOVE="{01005F75-83AA-4E7F-8018-989AFA007F33}" /norestart /passive /qb





REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

REM 2019/10/07 リリース時点なし
REM echo 01_xxxx
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Dektop本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Desktop 10.7.1 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{952B6FC6-0A81-41CD-8A57-B6E4D4881AFB}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Desktop 10.7.1 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{69D31292-353F-41CC-9AE9-9F409B6D2E81}" /norestart /passive /qb

echo ArcGIS Desktop 10.7.1 のアンインストール... アンインストールにはしばらく時間がかかります...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /X "{69262D87-3697-492B-ABED-765DDC15118B}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.7.1 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{39E26603-505E-4CE3-ABC6-5721CADF41D3}" /norestart /passive /qb

echo ArcGIS Desktop 10.7.1 64-bit 国内対応パックのアンインストール ...
REM 国内対応パック 64-bit のアンインストール
%windir%\System32\msiexec.exe /X "{2D39FEF7-82D8-4F25-A35E-FA55AA5A1D2F}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.7.1 のアンインストール終了



pause
exit /b
