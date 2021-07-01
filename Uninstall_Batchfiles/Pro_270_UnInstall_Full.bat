@echo off
REM ArcGIS Pro 2.7の一括アンインストール

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



REM デスクトップのアンインストール
echo ArcGIS Pro 2.7 のアンインストールを開始します




REM パッチのアンインストール
echo パッチのアンインストール開始

echo ArcGIS Pro 2.7 Patch 4 のアンインストール
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{B4A82A90-5394-4A20-848B-F9DE2A264750}" /norestart /passive /qb

echo ArcGIS Pro 2.7 Patch 3 のアンインストール
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{E88087D6-0808-44C2-9AFC-A0182DE5EF0E}" /norestart /passive /qb

echo ArcGIS Pro 2.7 Patch 2 のアンインストール
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{A8BFD54D-B924-4C32-B2A6-42ED230F29A9}" /norestart /passive /qb

echo ArcGIS Pro 2.7 Patch 1 のアンインストール
%windir%\System32\msiexec.exe /I "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" MSIPATCHREMOVE="{2F94FC7D-896F-45E4-B25B-22570E0357A9}" /norestart /passive /qb


echo パッチのアンインストール終了
echo. 

REM ArcGIS Helpアンインストール
echo ArcGIS Pro オフライン ヘルプ のアンインストール...
%windir%\System32\msiexec.exe /X "{54A2C55C-CB1C-4495-811B-52C5E03143D5}" /norestart /passive /qb


REM ArcGIS Pro 日本語パックのアンインストール
echo ArcGIS Pro 2.7 日本語パック のアンインストール...
%windir%\System32\msiexec.exe /X "{F32EE75E-E50E-47DF-8F08-418E97BE9CF8}" /norestart /passive /qb

REM ArcGIS Coordinate Systems Data のアンインストール
echo ArcGIS Coordinate Systems Data のアンインストール...
%windir%\System32\msiexec.exe /X "{0E361148-C0FB-4959-B476-D7813BFB004A}" /norestart /passive /qb
echo ArcGIS Coordinate Systems Data アンインストール終了
echo.


REM Data Interoperability のアンインストール
REM echo Data Interoperability Patch 1 アンインストール...
REM %windir%\System32\msiexec.exe /I "{A9BD7866-71EE-4FCB-9AB8-FE03BEA78C32}" MSIPATCHREMOVE="{A5965344-726E-4EFB-939E-EDC1B29B72ED}" /norestart /passive /qb
REM echo Data Interoperability パッチのアンインストール終了

REM Data Interoperability のアンインストール
REM echo ArcGIS Pro 2.7 Data Interoperability のアンインストール...
REM %windir%\System32\msiexec.exe /X "{A9BD7866-71EE-4FCB-9AB8-FE03BEA78C32}" /norestart /passive /qb
REM echo ArcGIS Pro 2.7 Data Interoperability アンインストール終了
REM echo. 

REM ArcGIS Pro 本体のアンインストール
echo ArcGIS Pro 2.7 本体のアンインストール... アンインストールにはしばらく時間がかかります...
%windir%\System32\msiexec.exe /X "{FBBB144A-B4BE-49A0-95C4-1007E3A42FA5}" /norestart /passive /qb

echo ArcGIS Pro 2.7 のアンインストール終了
echo. 


REM その他:ArcGIS Pro 2.3 用 ST_Geometry ライブラリ と ST_Raster ライブラリ
REM その他:日本用地図シンボル
echo 注1)ArcGIS Pro 2.7 用 ST_Geometry ライブラリ と ST_Raster ライブラリ は必要に応じてアンインストールしてください
echo 注2)日本用地図シンボル は必要に応じてアンインストールしてください
echo. 

pause
exit /b
