REM ArcGIS Engine 10.5.1の一括アンインストール

@echo off
REM コマンドでの実行の場合
REM MSIファイルのアンインストール
REM msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM MSPファイルのアンインストール
REM msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>

set __COMPAT_LAYER=RunAsInvoker



REM Engineのアンインストール
echo ArcGIS Engine 10.5.1のアンインストールを開始します


REM 事前に必要なものをアンインストール
IF not EXIST "C:\Program Files (x86)" GOTO 32BIT

echo MSXML6 64-bit のアンインストール...
REM uninstall MSXML6
C:\WINDOWS\system32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
echo MSXML6 のアンインストール...
REM uninstall MSXML6
C:\WINDOWS\system32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM パッチのアンインストール
echo パッチのアンインストール開始

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch
C:\WINDOWS\system32\msiexec.exe /I "{C089C13D-F409-4385-B303-9A6DFCB60DE8}" MSIPATCHREMOVE="{660E0279-9B5A-4519-BE50-E903B7B1E987}" /norestart /passive /qb

REM 2018/03/07公開パッチ
echo (7) ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Zonal Statistics Tool Patch
C:\WINDOWS\system32\msiexec.exe /I "{C089C13D-F409-4385-B303-9A6DFCB60DE8}" MSIPATCHREMOVE="{C55A0A6F-687B-483E-8A79-4307EC682DBE}" /norestart /passive /qb

REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch 64-bit
C:\WINDOWS\system32\msiexec.exe /I "{C449F6FA-DC86-410E-9F7E-B4986717B50A}" MSIPATCHREMOVE="{DD090898-DA8A-4D40-AC66-10CD1A4D323A}" /norestart /passive /qb

REM 2018/02/28公開パッチ
echo (6) ArcGIS (Desktop, Engine) Background Geoprocessing 64-bit Arcpy Exit and Shutdown Patch
C:\WINDOWS\system32\msiexec.exe /I "{C449F6FA-DC86-410E-9F7E-B4986717B50A}" MSIPATCHREMOVE="{D6BFD000-79F6-40D8-A528-0E0B4795ED2F}" /norestart /passive /qb

REM 2018/03/07公開パッチ
echo (7) ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Zonal Statistics Tool Patch 64-bit
C:\WINDOWS\system32\msiexec.exe /I "{C449F6FA-DC86-410E-9F7E-B4986717B50A}" MSIPATCHREMOVE="{48F114B7-EDFA-4244-8A32-319FE50E730C}" /norestart /passive /qb

:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Engine本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Engine 10.5.1 国内対応パック のアンインストール...
C:\WINDOWS\system32\msiexec.exe /X "{CE8474A2-5E22-4926-BC9C-93B73EC8F077}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Engine 10.5.1 日本語パック のアンインストール...
C:\WINDOWS\system32\msiexec.exe /X "{668F2851-05CC-479F-8DB2-8A1F346EA360}" /norestart /passive /qb

echo ArcGIS Engine 10.5.1 のアンインストール... アンインストールにはしばらく時間がかかります...
REM uninstall ArcGIS Engine 10.5.1
C:\WINDOWS\system32\msiexec.exe /X "{C089C13D-F409-4385-B303-9A6DFCB60DE8}" /norestart /passive /qb



IF not EXIST "C:\Program Files (x86)" GOTO 64BITEND

echo ArcGIS Engine 10.5.1 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
C:\WINDOWS\system32\msiexec.exe /X "{C449F6FA-DC86-410E-9F7E-B4986717B50A}" /norestart /passive /qb


:64BITEND

echo ArcGIS Engine 10.5.1のアンインストール終了



pause
exit /b
