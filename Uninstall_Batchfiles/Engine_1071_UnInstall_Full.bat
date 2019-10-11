@echo off
REM ArcGIS Engine 10.7.1 の一括アンインストール

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



REM Engineのアンインストール
echo ArcGIS Engine 10.7.1のアンインストールを開始します


REM 事前に必要なものをアンインストール
IF not EXIST "%ProgramFiles(x86)%" GOTO 32BIT

REM 10.6.1 では MSXML のインストーラがなくなっている
REM echo MSXML6 64-bit のアンインストール...
REM uninstall MSXML6
REM %windir%\System32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
REM 10.6.1 では MSXML のインストーラがなくなっている
REM echo MSXML6 のアンインストール...
REM uninstall MSXML6
REM %windir%\System32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM パッチのアンインストール
echo パッチのアンインストール開始

echo 01_Security Update Compatibility Patch
%windir%\System32\msiexec.exe /I "{69262D87-3697-492B-ABED-765DDC15118B}" MSIPATCHREMOVE="{01005F75-83AA-4E7F-8018-989AFA007F33}" /norestart /passive /qb


REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

REM なしecho 01_
REM %windir%\System32\msiexec.exe /I "{}" MSIPATCHREMOVE="{}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Engine本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Engine 10.7.1 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{387950BD-0BB6-4EDF-9D42-493212554066}" /norestart /passive /qb


REM 日本語パックのアンインストール
echo ArcGIS Engine 10.7.1 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{15FF51A8-F46D-415D-8B03-5EB1ADAA7E26}" /norestart /passive /qb


echo ArcGIS Engine 10.7.1 のアンインストール... アンインストールにはしばらく時間がかかります...
REM uninstall ArcGIS Engine 10.7.1
%windir%\System32\msiexec.exe /X "{E06EB984-F5AD-4339-A7C3-5D9035191843}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.7.1 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{1AD97CB6-412C-49FC-85D7-14002C369D01}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.7.1 のアンインストール終了



pause
exit /b
