$fqdn = Read-Host "Enter vCenter FQDN"
$user = Read-Host "Enter username with domain"
$pass = Read-Host "Enter password" #-AsSecureString
#$pwd = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass))
$control = Connect-VIServer -Server $fqdn -User $user -Password $pass
if($control -eq $null){
    Write-Output("Check your Username & Password")
}
else{
    $vmname = Read-Host "Enter VMName"
    $source = Read-Host "Enter RAM or CPU"
    if($source -eq "RAM"){
        $ram = Read-Host "Enter total value"
        $set_ram = Set-VM -VM $vmname -MemoryGB $ram -Confirm:$false 
    }
    if($source -eq "CPU"){
        $cpu = Read-Host "Enter total value"
        $set_cpu = Set-VM -VM $vmname -NumCpu $cpu -Confirm:$false 
    }

}
