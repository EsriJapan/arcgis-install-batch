param(
    [IO.FileInfo] $msipath
)
Process {
    try {
        #[ValidateSet("ProductCode", "ProductVersion", "ProductName", "Manufacturer", "ProductLanguage", "FullVersion")]
        # MSIの Unistall で利用するのはProductCode
        $property ="ProductCode"

        # PatchのUninsall用コマンド
        $msiexec = "C:\WINDOWS\system32\msiexec.exe /X "
        $params = "/norestart /passive /qb"

        # MSIファイルから必要な情報を抽出してUninstallコマンドを作成
        $windowsInstaller = New-Object -ComObject WindowsInstaller.Installer
        $msidatabase = $windowsInstaller.GetType().InvokeMember("OpenDatabase", "InvokeMethod", $null, $windowsInstaller, @($msipath.FullName, 0))
        $query = "SELECT Value FROM Property WHERE Property = '$($property)'"
        $view = $msidatabase.GetType().InvokeMember("OpenView", "InvokeMethod", $null, $msidatabase, ($query))
        $view.GetType().InvokeMember("Execute", "InvokeMethod", $null, $view, $null)
        $record = $view.GetType().InvokeMember("Fetch", "InvokeMethod", $null, $view, $null)
        $value = $record.GetType().InvokeMember("StringData", "GetProperty", $null, $record, 1)
 
        # MSIデータベースのコミットとviewのクローズ
        $msidatabase.GetType().InvokeMember("Commit", "InvokeMethod", $null, $msidatabase, $null)
        $view.GetType().InvokeMember("Close", "InvokeMethod", $null, $view, $null)           
        $msidatabase = $null
        $view = $null
 
        # Unintallコマンドにする
        # msiexec /X <xxxx\xxxx.msi> or mxiexec /X <PruductGUID>
        $folder1 = Split-Path(Split-Path $msipath.DirectoryName -Parent) -Leaf
        $folder2 = Split-Path $msipath.DirectoryName -Leaf
        
        $echo = "echo uninstall : " + $folder1 + " > " + $folder2 + " > " + $msipath.Name
        $uninstallcmd = $msiexec + '"' + $value + '" ' + $params

        # Return the value
        #return $value
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