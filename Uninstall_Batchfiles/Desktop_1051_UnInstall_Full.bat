REM ArcGIS Desktop 10.5.1の一括アンインストール

@echo off
REM コマンドでの実行の場合
REM MSIファイルのアンインストール
REM msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
REM MSPファイルのアンインストール
REM msiexec /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>

set __COMPAT_LAYER=RunAsInvoker



REM デスクトップのインストール
echo ArcGIS Desktop 10.5.1のアンインストールを開始します


REM 事前に必要なものをアンインストール
IF not EXIST "C:\Program Files (x86)" GOTO 32BIT

echo MSXML6 64-bit のアンインストール...
REM install MSXML6
C:\WINDOWS\system32\msiexec.exe /X "{FF59CB23-1800-4047-B40C-E20AE7051491}" /norestart /passive /qb



:32BIT
echo MSXML6 のアンインストール...
REM install MSXML6
C:\WINDOWS\system32\msiexec.exe /X "{AEB9948B-4FF2-47C9-990E-47014492A0FE}" /norestart /passive /qb


REM パッチのアンインストール
echo パッチのアンインストール開始

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch
C:\WINDOWS\system32\msiexec.exe /I "{4740FC57-60FE-45BB-B513-3309F6B73183}" MSIPATCHREMOVE="{047113C9-BFDD-4E66-AA4B-EC9D988E4B22}" /norestart /passive /qb

REM 2018/02/18公開パッチ
echo (6)  ArcGIS 10.5.1 (Desktop, Server) NITF and NCDRD Quality Patch 1
C:\WINDOWS\system32\msiexec.exe /I "{4740FC57-60FE-45BB-B513-3309F6B73183}" MSIPATCHREMOVE="{C34D5F69-4CF9-4780-8148-04B43A69D2AE}" /norestart /passive /qb

REM 2018/03/07公開パッチ
echo (8) ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Zonal Statistics Tool Patch
C:\WINDOWS\system32\msiexec.exe /I "{4740FC57-60FE-45BB-B513-3309F6B73183}" MSIPATCHREMOVE="{30D7F1D5-5ADD-45A1-ACA7-FC9A46BAED0C}" /norestart /passive /qb

REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "C:\Program Files (x86)" GOTO 64BITPatchesEnd

echo (5)  ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Int and Abs tools Patch 64-bit
C:\WINDOWS\system32\msiexec.exe /I "{C444EB5E-7CC1-4F05-A17E-0632F3F20071}" MSIPATCHREMOVE="{154C2436-869F-4436-8561-B79E683639A1}" /norestart /passive /qb

REM 2018/02/28公開パッチ
echo (7) ArcGIS (Desktop, Engine) Background Geoprocessing 64-bit Arcpy Exit and Shutdown Patch
C:\WINDOWS\system32\msiexec.exe /I "{C444EB5E-7CC1-4F05-A17E-0632F3F20071}" MSIPATCHREMOVE="{7616FB80-AAB3-4F23-9D9F-E3E32BCB577D}" /norestart /passive /qb

REM 2018/03/07公開パッチ
echo (8) ArcGIS 10.5.1 (Desktop, Engine, Server) Spatial Analyst Zonal Statistics Tool Patch 64-bit
C:\WINDOWS\system32\msiexec.exe /I "{C444EB5E-7CC1-4F05-A17E-0632F3F20071}" MSIPATCHREMOVE="{1035065C-4329-4F03-935C-4FA27E736343}" /norestart /passive /qb

:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Dektop本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Desktop 10.5.1 国内対応パック のアンインストール...
C:\WINDOWS\system32\msiexec.exe /X "{E9BDD1F8-59BC-4432-BAA4-F00E7EC9C817}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Desktop 10.5.1 日本語パック のアンインストール...
C:\WINDOWS\system32\msiexec.exe /X "{782A3F72-D49F-4233-A6B6-A699558A8E44}" /norestart /passive /qb

echo ArcGIS Desktop 10.5.1 のアンインストール... アンインストールにはしばらく時間がかかります...
REM Install ArcGIS Desktop 10.5.1
C:\WINDOWS\system32\msiexec.exe /X "{4740FC57-60FE-45BB-B513-3309F6B73183}" /norestart /passive /qb



IF not EXIST "C:\Program Files (x86)" GOTO 64BITEND

echo ArcGIS Desktop 10.5.1 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
C:\WINDOWS\system32\msiexec.exe /X "{C444EB5E-7CC1-4F05-A17E-0632F3F20071}" /norestart /passive /qb

echo ArcGIS Desktop 10.5.1 64-bit 国内対応パックのアンインストール ...
REM 国内対応パック 64-bit のアンインストール
C:\WINDOWS\system32\msiexec.exe /X "{8B2AF548-1E76-4DFB-ACE2-FDD4EF829E27}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.5.1のアンインストール終了



pause
exit /b
