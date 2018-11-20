# Remove-MyDhcpV4Reservation

## DESCRIPTION
This Cmdlet remove an dhcp reservation on defined dhcp servers

## PARAMETER ScopeID
Defines the DHCP Scope where you want to remove the reservation

## PARAMETER MACAddress
Defines the MAC Address for that you want to remove the reservation

Format:
001122334455
00:11:22:33:44:55
00-11-22-33-44-55

## EXAMPLE
Remove-MyDHCPv4Reservation -ScopeID 10.10.10.0 -MACAddress 005056b02066
