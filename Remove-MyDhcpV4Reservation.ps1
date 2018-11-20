function Remove-MyDHCPv4Reservation
{
<#
.SYNOPSIS
This Cmdlet add an dhcp reservation on both dhcp servers

.DESCRIPTION
This Cmdlet add an dhcp reservation on both dhcp servers

.PARAMETER ScopeID
Defines the DHCP Scope where you want to add the reservation

.PARAMETER MACAddress
Defines the MAC Address for the new reservation

Format:
001122334455
00:11:22:33:44:55
00-11-22-33-44-55

.EXAMPLE
Remove-MyDHCPv4Reservation -ScopeID 10.10.10.0 -MACAddress 005056b02066

#>
    Param(
        [Parameter(Mandatory=$true)]
        [STRING]$ScopeID,

        [Parameter(Mandatory=$true)]
        [STRING]$MACAddress

    )

    # Define Server Addresses
    $Server = 'Server1','Server2'

    # Convrtz MAC Address
    if ($MACAddress.Length -eq 12 -and $MACAddress -notmatch ':' -and $MACAddress -notmatch '-') {
        $MACAddress = $MACAddress -replace "([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])([0-9A-Fa-f])", '$1$2-$3$4-$5$6-$7$8-$9$10-$11$12'
    }

    if ($MACAddress -match ':') {
        $MACAddress = $MACAddress -replace(':','-')
    }

    foreach($S in $Server) {
        $Reservation = $false
        # Get reservation from Server
        $Reservation = Get-DhcpServerv4Reservation -ScopeId $ScopeID -ComputerName $S -ErrorAction SilentlyContinue | ? { $_.ClientID -eq $MACAddress }

        if ($Reservation) {
            Write-Host 'Switch Delete was specified! We try to delete the Reservation: ' -NoNewline
            try {
                $Reservation | Remove-DhcpServerv4Reservation -ComputerName $S
                Write-Host 'successfully' -ForegroundColor Green
            } catch {
                Write-Host 'failed' -ForegroundColor Yellow
            }
        }
    }
}
