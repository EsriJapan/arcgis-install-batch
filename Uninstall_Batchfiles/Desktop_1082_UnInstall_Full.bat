@echo off
REM ArcGIS Desktop 10.8.1 の一括アンインストール
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
echo ArcGIS Desktop 10.8.2 のアンインストールを開始します


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

echo 01_ArcGIS Desktop 10.8.2 Enhanced Compression Wavelet (ECW) Support Patch のアンインストール
%windir%\System32\msiexec.exe /I "{791AB03F-1AF2-43FE-8F5D-8FDC9509D7CF}" MSIPATCHREMOVE="{F1616A19-F581-4CDC-B75D-38BD017BA5AA}" /norestart /passive /qb


REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

REM 2022/02/xx リリース時点なし
REM echo 01_xxx Patch 64-bit
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Dektop本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Desktop 10.8.2 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{1CA1058E-A83F-4626-9484-6719DAFEF896}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Desktop 10.8.2 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{4FCC9BE3-7150-49E8-983D-389FC46F8676}" /norestart /passive /qb

echo ArcGIS Desktop 10.8.2 のアンインストール... アンインストールにはしばらく時間がかかります...
REM UnInstall ArcGIS Desktop 10.8.1
%windir%\System32\msiexec.exe /X "{791AB03F-1AF2-43FE-8F5D-8FDC9509D7CF}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.8.2 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{DE0069B6-F646-49BB-82EC-8E29F5CE8937}" /norestart /passive /qb

echo ArcGIS Desktop 10.8.2 64-bit 国内対応パックのアンインストール ...
REM 国内対応パック 64-bit のアンインストール
%windir%\System32\msiexec.exe /X "{8EE8216A-43EE-49D0-8B16-08FC19ECA594}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.8.2 のアンインストール終了



pause
exit /b
