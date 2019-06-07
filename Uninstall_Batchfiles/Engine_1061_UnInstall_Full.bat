@echo off
REM ArcGIS Engine 10.6.1 の一括アンインストール

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
echo ArcGIS Engine 10.6.1のアンインストールを開始します


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

echo (1) 01_Buffering Degenerated Polygon Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{1AA6EBD3-A12F-422A-85BF-D01A8F43D795}" /norestart /passive /qb

echo (2) 02_Geoprocessing Service Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{AE23910B-E6C7-4378-925C-ED91D9449638}" /norestart /passive /qb

echo (3) 03_JPEG NoData Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{6D796814-1DFE-465F-B15F-918C9EBF0139}" /norestart /passive /qb

REM 2018/12/14 公開パッチ
echo (4) 04_PostgreSQL Performance and Version 10 Support Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{88D2BA18-ED56-4BF7-9CB2-2BB6778F45AF}" /norestart /passive /qb

REM 2018/12/21 公開パッチ
echo (5) 05_ArcGIS (Desktop, Engine, Server) 10.6.1 Published Script Tools Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{B3CBA41D-BEBE-48A7-B4B2-CB19F08C708A}" /norestart /passive /qb


REM 2019/04/15 公開パッチ
echo (7) 07_Spatial Analyst Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{303E514B-52B9-4473-97E9-2ED08487F074}" /norestart /passive /qb

REM 2019/06/07 公開パッチ
echo (8) 08_Text Performance Patch
%windir%\System32\msiexec.exe /I "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" MSIPATCHREMOVE="{DE9B25E3-7DA8-4B6F-8CE7-E2BDFBA3F9EB}" /norestart /passive /qb

REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd


echo (1) 01_Buffering Degenerated Polygon Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{A897D6E4-A5F6-419A-9850-4B3E14871AAC}" /norestart /passive /qb

echo (2) 02_Geoprocessing Service Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{29B2E4DB-3919-4D8A-A28F-65C01C151235}" /norestart /passive /qb

echo (3) 03_JPEG NoData Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{53A67CE4-D316-4CA2-952A-72C5D57856E1}" /norestart /passive /qb

REM 2018/12/14 公開パッチ
echo (4) 04_PostgreSQL Performance and Version 10 Support Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{633BBE0F-5E31-4CD8-A6F1-29362A211D92}" /norestart /passive /qb

REM 2018/12/21 公開パッチ
echo (5) 05_ArcGIS (Desktop, Engine, Server) 10.6.1 Published Script Tools Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{59057D6A-A7AF-4F3B-93DC-80345BF9A25A}" /norestart /passive /qb


REM 2019/04/15 公開パッチ
echo (7) 07_Spatial Analyst Patch 64-bit
%windir%\System32\msiexec.exe /I "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" MSIPATCHREMOVE="{39D45527-7E5C-404D-9618-35D3B78F1CC1}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Engine本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Engine 10.6.1 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{A3C5F85D-2AB4-4051-BCB0-0C238CF5432B}" /norestart /passive /qb


REM 日本語パックのアンインストール
echo ArcGIS Engine 10.6.1 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{BEB91F7C-CD24-40E8-8A17-C6B54470C9A6}" /norestart /passive /qb


echo ArcGIS Engine 10.6.1 のアンインストール... アンインストールにはしばらく時間がかかります...
REM uninstall ArcGIS Engine 10.6
%windir%\System32\msiexec.exe /X "{EEAB02A0-0262-44D6-9C06-2E7AD2A3A2B6}" /norestart /passive /qb

IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Engine 10.6.1 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{E85FA88B-2EAC-45D9-9F97-F2DFAEBEB2F8}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.6.1 のアンインストール終了



pause
exit /b
