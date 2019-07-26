@echo off
REM ArcGIS Engine 10.7 の一括アンインストール

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
echo ArcGIS Engine 10.7のアンインストールを開始します


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

echo 01_Network Analyst Function Evaluator Patch
%windir%\System32\msiexec.exe /I "{F95F3DF6-7674-43C2-8567-2C668DC7C837}" MSIPATCHREMOVE="{E186BD72-41E7-4B27-BC21-C9CBDB0EC35A}" /norestart /passive /qb


REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd


echo 01_Network Analyst Function Evaluator Patch 64-bit
%windir%\System32\msiexec.exe /I "{F07405DD-739A-4DF0-BE53-34573E1BECF7}" MSIPATCHREMOVE="{DABC78F4-0E23-477A-9F65-9B03B3A09DD3}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Engine本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Engine 10.7 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{F504250C-93B9-4731-8076-0955922286C8}" /norestart /passive /qb


REM 日本語パックのアンインストール
echo ArcGIS Engine 10.7 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{C636CA4E-1960-4D09-99A0-A4A9151E865C}" /norestart /passive /qb


echo ArcGIS Engine 10.7 のアンインストール... アンインストールにはしばらく時間がかかります...
REM uninstall ArcGIS Engine 10.7
%windir%\System32\msiexec.exe /X "{F95F3DF6-7674-43C2-8567-2C668DC7C837}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.7 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{F07405DD-739A-4DF0-BE53-34573E1BECF7}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.7 のアンインストール終了



pause
exit /b
