New-NetIPAddress -InterfaceIndex 2 -IPAddress 172.16.0.253 -PrefixLength 24 -DefaultGateway 172.16.0.254
Install-WindowsFeature DHCP -IncludeManagementTools
Add-DHCPServerv4Scope -Name “LAN” -StartRange 172.16.0.100 -EndRange 172.16.0.120 -SubnetMask 255.255.255.0 -State Active
Set-DhcpServerv4Scope -ScopeId 172.16.0.0 -LeaseDuration 1.00:00:00
Set-DHCPServerv4OptionValue -ScopeID 172.16.0.0 -DnsDomain contoso.local -DnsServer 172.16.0.253 -Router 172.16.0.254
Add-DhcpServerInDC -DnsName contoso.local -IpAddress 172.16.0.253