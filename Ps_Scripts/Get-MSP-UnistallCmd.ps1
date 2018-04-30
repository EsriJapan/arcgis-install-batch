#
# mspの"Display Name","Product Code", "patch code"を取得する
# www.andreasnick.com/85-reading-out-an-msp-product-code-with-powershell.html


<# 
.SYNOPSIS 
    Get the Display Name from an Microsoft Installer Patch MSP
.DESCRIPTION 
    Get Display Name from an Microsoft Installer Patch MSP (Andreas Nick 2015)
.NOTES 
    $NULL for an error
.LINK
.RETURNVALUE
  [String] Display Name
.PARAMETER
  [IO.FileInfo] Path to the msp file
#>

param (
        [IO.FileInfo] $patchnamepath
)
Process {
    try {
        # PatchのUninsall用コマンド
        $msiexec = "C:\WINDOWS\system32\msiexec.exe /I "
        $remove = "MSIPATCHREMOVE="
        $params = "/norestart /passive /qb"

        # MSPファイルから必要な情報を抽出してUninstallコマンドを作成
        $windowsInstaller = New-Object -ComObject WindowsInstaller.Installer
        $mspdatabase = $windowsInstaller.GetType().InvokeMember("OpenDatabase", "InvokeMethod", $Null, $windowsInstaller, $($patchnamepath.FullName, 32))
        $summaryinfo = $mspdatabase.GetType().InvokeMember("SummaryInformation", "GetProperty", $Null, $mspdatabase, $Null)
        $propcnt = $summaryinfo.GetType().InvokeMember("PropertyCount", "GetProperty", $Null, $summaryinfo, $Null)
        
        # Orcaで確認されるTargets : $productcode
        [String] $productcode = $summaryinfo.GetType().InvokeMember("Property", "GetProperty", $Null, $summaryinfo, 7)
        
        # Orcaで確認されるPatch code　:　$patchcode
        [String] $patchcode = $summaryinfo.GetType().InvokeMember("Property", "GetProperty", $Null, $summaryinfo, 9)
        
        # Unintallコマンドにする
        # C:\WINDOWS\system32\msiexec.exe /I <ProductGUID> MSIPATCHREMOVE=<PatchGUID>
        $echo = "echo uninstall : " + $patchnamepath.Name
        $uninstallcmd = $msiexec + '"' + $productcode + '" ' + $remove + '"' + $patchcode + '" ' + $params
        
        return $echo, $uninstallcmd
    }
    catch {
        Write-Output $_.Exception.Message
        return $NULL
    }
}
End {
    # Run garbage collection and release ComObject
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($windowsInstaller) | Out-Null
    [System.GC]::Collect()
}

