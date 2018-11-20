# Remove-MyDhcpV4Reservation

## DESCRIPTION
This Cmdlet add an dhcp reservation on both dhcp servers

## PARAMETER ScopeID
Defines the DHCP Scope where you want to add the reservation

## PARAMETER MACAddress
Defines the MAC Address for the new reservation

Format:
001122334455
00:11:22:33:44:55
00-11-22-33-44-55

## EXAMPLE
Remove-MyDHCPv4Reservation -ScopeID 10.10.10.0 -MACAddress 005056b02066
