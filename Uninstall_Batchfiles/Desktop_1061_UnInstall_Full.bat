@echo off
REM ArcGIS Desktop 10.6 の一括アンインストール
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
echo ArcGIS Desktop 10.6.1 のアンインストールを開始します


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

echo 01_Buffering Degenerated Polygon Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{70E7DEB8-4A1B-4381-81B9-BE28D7337428}" /norestart /passive /qb

echo 02_Geoprocessing Service Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{0E1A2EDB-F55E-475C-B5CE-31736BD15B6C}" /norestart /passive /qb

echo 03_JPEG NoData Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{4EEC5CFB-4D59-4240-8D7B-F818CC70CD72}" /norestart /passive /qb

echo 04_Buffer Wizard Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{C60D7F0E-BF3A-4D38-B406-FFC600ACCAE2}" /norestart /passive /qb

echo 05_Raster Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{FDDBE7B8-16B9-4E29-BF34-0D64BF4CB384}" /norestart /passive /qb

REM 2018/12/14公開パッチ
echo 06_PostgreSQL Performance and Version 10 Support Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{550BB9FA-A975-43D0-816F-57402BDEE06A}" /norestart /passive /qb

REM 2018/12/21公開パッチ
echo 07_Published Script Tools Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{8AFF43C7-6136-4CAD-AA65-D56C652AD0F4}" /norestart /passive /qb

REM 2019/01/25公開パッチ
echo 08_Importing Raster to Enterprise Geodatabase Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{AE7C856B-1E13-4329-A833-0DC51964821F}" /norestart /passive /qb

REM 2019/02/01公開パッチ
echo 09_TLS Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{E0AD42EA-527B-4C19-8674-6C10CA08ECDB}" /norestart /passive /qb

REM 2019/02/19公開パッチ
echo 11_Dialog Initialization Performance Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{1E7F4F18-B6A0-4C48-864D-3FE6485B8F01}" /norestart /passive /qb

REM 2019/03/06公開パッチ
echo 13_Exporting Data From a Layer Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{BFE02429-260F-4BD1-BE0A-9C44A326AB6F}" /norestart /passive /qb

REM 2019/04/15公開パッチ
echo 14_Spatial Analyst Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{54C45666-BA97-4451-954A-7FB08A0D12DA}" /norestart /passive /qb

REM 2019/06/07公開パッチ
echo 15_NITF and NCDRD Quality Patch 1
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{6A6E0311-C2F1-4FE6-8EA8-4AEAC9F25B0D}" /norestart /passive /qb

REM 2019/06/07公開パッチ
echo 16_Text Performance Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{816084A9-9383-4EDE-A4F8-120C2F0B53A7}" /norestart /passive /qb

REM 2019/08/14公開パッチ
echo 17_Security Update Compatibility Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{5444F9FF-553D-4457-804C-4B6FDA197391}" /norestart /passive /qb

REM 2019/10/07公開パッチ
echo 18_Support for Oracle 19c Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{995ACE02-2828-4F2D-A83A-257D7ABFD3BF}" /norestart /passive /qb

REM 2019/12/23公開パッチ
echo 19_General Update Patch
%windir%\System32\msiexec.exe /I "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" MSIPATCHREMOVE="{83FFC09F-B35F-4C1B-8584-3EB93FC375FB}" /norestart /passive /qb


REM 64-bit OSの場合はバックグラウンドパッチ適用
IF NOT EXIST "%ProgramFiles(x86)%" GOTO 64BITPatchesEnd

echo 01_Buffering Degenerated Polygon Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{5CEBD126-1C98-4B90-BA5C-191EA0C17A25}" /norestart /passive /qb

echo 02_Geoprocessing Service Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{0187A1E4-96D0-44FE-B70E-B789BA16FC9C}" /norestart /passive /qb

echo 03_JPEG NoData Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{880FF969-6CC6-4AF7-8672-F55865FE871D}" /norestart /passive /qb

REM 2018/12/14公開パッチ
echo 06_PostgreSQL Performance and Version 10 Support Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{C71BA958-91E9-4846-86AF-1583FFD04C15}" /norestart /passive /qb

REM 2018/12/21公開パッチ
echo 07_Published Script Tools Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{1D40BDE0-B6D8-402B-82F5-47869A5946ED}" /norestart /passive /qb

REM 2019/04/15公開パッチ
echo 14_Spatial Analyst Patch 64-bit
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{A37950D4-7815-49DE-A555-99F0E8A361AB}" /norestart /passive /qb

REM 2019/10/07公開パッチ
echo 18_Support for Oracle 19c Patch
%windir%\System32\msiexec.exe /I "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" MSIPATCHREMOVE="{153F4072-0DF3-41E8-BCBE-6CFFF816786B}" /norestart /passive /qb


:64BITPatchesEnd

echo パッチのアンインストール終了


REM ArcGIS Dektop本体のアンインストール
REM 国内対応パックのアンインストール
echo ArcGIS Desktop 10.6.1 国内対応パック のアンインストール...
%windir%\System32\msiexec.exe /X "{78D30A4B-0615-4FD5-85F2-0C24685CE644}" /norestart /passive /qb

REM 日本語パックのアンインストール
echo ArcGIS Desktop 10.6.1 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{712C033E-5E24-4493-9E65-90F715E39348}" /norestart /passive /qb

echo ArcGIS Desktop 10.6.1 のアンインストール... アンインストールにはしばらく時間がかかります...
REM Install ArcGIS Desktop 10.6
%windir%\System32\msiexec.exe /X "{FA2E2CBC-0697-4C71-913E-8C65B5A611E8}" /norestart /passive /qb



IF not EXIST "%ProgramFiles(x86)%" GOTO 64BITEND

echo ArcGIS Desktop 10.6.1 64-bit Background Geoprocessing のアンインストール...
REM 64-bit Background Geoprocessing Extension
%windir%\System32\msiexec.exe /X "{E02F36E6-2ED8-47A9-A6D2-C7C9AEFDE364}" /norestart /passive /qb

echo ArcGIS Desktop 10.6.1 64-bit 国内対応パックのアンインストール ...
REM 国内対応パック 64-bit のアンインストール
%windir%\System32\msiexec.exe /X "{CC15B695-CA16-4ED7-8736-1DEB499A9204}" /norestart /passive /qb


:64BITEND

echo ArcGIS Desktop 10.6.1 のアンインストール終了



pause
exit /b
