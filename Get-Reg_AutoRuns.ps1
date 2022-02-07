$creds = Get-Credential

$Range = @("jea-dc", "jea-demoSVR")

foreach ($ip in $range) {

    Invoke-Command -ComputerName $ip -Credential $creds -ScriptBlock {

        
        if (Test-Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Run) {         
            Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Run} # end IF
        else {Write-Host "HKLM Run key does not exist."}
        
        if (Test-Path HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce) { 
        Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce} #end IF
        else {Write-Host "HKLM RunOnce key does not exist."}

        if (Test-Path HKLM:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run){
        Get-ItemProperty HKLM:\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run} #end IF
        else {Write-Host "DEFAULT Run key does not exist."}

        if(Test-Path HKLM:\Software\Wow6432node\Microsoft\Windows\CurrentVersion\Run){
        Get-ItemProperty HKLM:\Software\Wow6432node\Microsoft\Windows\CurrentVersion\Run}
        else {Write-Host "HKLM Wow6432 Run key does not exist."} #end IF

        if(test-path HKLM:\Software\Wow6432node\Microsoft\Windows\CurrentVersion\RunOnce){
        Get-ItemProperty HKLM:\Software\Wow6432node\Microsoft\Windows\CurrentVersion\RunOnce}
        else {Write-Host "HKLM Wow6432 RunOnce key does not exist."} #end IF

    } # Closes Script Block
} # Closes Loop
