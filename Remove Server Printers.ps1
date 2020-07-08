<#
Program: Remove Server Printers
Description: Powershell script that removes all network connected printers from a particular server on a local machine
Author: Austin Way
Date: 6/25/2020
#>

#Removes all printers from a computer with the server name defined in variable $PrintServer
$printServer = "\\PRINTSERVER"

$printers = Get-WmiObject -Class Win32_Printer
ForEach ($printer in $printers) {
    If ($printer.SystemName -like "$printServer") {
        (New-Object -ComObject WScript.Network).RemovePrinterConnection($($printer.Name))
    }
}