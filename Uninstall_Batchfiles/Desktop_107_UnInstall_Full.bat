@echo off
REM ArcGIS Desktop 10.7 の一括アンインストール
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
echo ArcGIS Desktop 10.7 のアンインストールを開始します


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

REM 2019/07/25 リリース時点
echo 01_Network Analyst Function Evaluator Patch
%windir%\System32\msiexec.exe /I "{BFB4F32E-38DF-4E8F-8180-C99FC9A14BBE}" MSIPATCHREMOVE="{4EB90006-654E-4593-8888-7894A72E1327}" /norestart /passive /qb

echo 02_Mosaic Dataset Compatibility Patch
%windir%\System32\msiexec.exe /I "{BFB4F32E-38DF-4E8F-8180-C99FC9A14BBE}" MSIPATCHREMOVE="{75A5452E-05CB-46BC-BF9A-B656E2B55E11}" /norestart /passive /qb



REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

echo 01_Network Analyst Function Evaluator Patch
%windir%\System32\msiexec.exe /I "{F4A727FC-1E11-4380-8171-5E4FF508E6CB}" MSIPATCHREMOVE="{162C01D8-EE12-4A0F-9272-B0A17FD0047E}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Dektop本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Desktop 10.7 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{16AE78AE-7070-44BF-981A-829DE3525727}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Desktop 10.7 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{E14E7647-76BC-4874-9F4F-32D7543209B2}" /norestart /passive /qb

echo ArcGIS Desktop 10.7 のアンインストール... アンインストールにはしばらく時間がかかります...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /X "{BFB4F32E-38DF-4E8F-8180-C99FC9A14BBE}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.7 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{F4A727FC-1E11-4380-8171-5E4FF508E6CB}" /norestart /passive /qb

echo ArcGIS Desktop 10.7 64-bit 国内対応パックのアンインストール ...
REM 国内対応パック 64-bit のアンインストール
%windir%\System32\msiexec.exe /X "{DE968464-F04D-4608-A99F-7411CF877173}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.7 のアンインストール終了



pause
exit /b
