rem SQLServerPortsOpen.bat
rem Date Modified: 03/26/2021
rem Author: Avery Lane

set "ag_endpnt=5022"
set "sb_endpnt=4022"

rem SQL Default Ports Inbound/Outbound
netsh advfirewall firewall add rule name = SQLPort dir = in protocol = tcp action = allow localport = 1433 remoteip = localsubnet profile = DOMAIN
netsh advfirewall firewall add rule name = SQLPort dir = out protocol = tcp action = allow localport = 1433 remoteip = localsubnet profile = DOMAIN

rem SQL Dedicated Admin Port Inbound (Default Instance)
netsh advfirewall firewall add rule name = SQLPortDedicatedAdmin dir = in protocol = tcp action = allow localport = 1434 remoteip = localsubnet profile = DOMAIN

rem SQL Database mirroring/AlwaysOn AG (Default is 5022)
netsh advfirewall firewall add rule name = SQLPortAG dir = in protocol = tcp action = allow localport ="%ag_endpnt%" remoteip = localsubnet profile = DOMAIN
netsh advfirewall firewall add rule name = SQLPortAG dir = out protocol = tcp action = allow localport ="%ag_endpnt%" remoteip = localsubnet profile = DOMAIN

rem SQL Browser Service
netsh advfirewall firewall add rule name = SQLPortBrowser dir = in protocol = udp action = allow localport = 1434 remoteip = localsubnet profile = DOMAIN

rem Service Broker (Default is 4022)
netsh advfirewall firewall add rule name = SQLPortServiceBroker dir = in protocol = tcp action = allow localport ="%sb_endpnt%" remoteip = localsubnet profile = DOMAIN
netsh advfirewall firewall add rule name = SQLPortServiceBroker dir = out protocol = tcp action = allow localport = "%sb_endpnt%" remoteip = localsubnet profile = DOMAIN

rem Replication
netsh advfirewall firewall add rule name = SQLReplUDP dir = in protocol = udp action = allow localport = 137,138 remoteip = localsubnet profile = DOMAIN
netsh advfirewall firewall add rule name = SQLReplTCP dir = in protocol = tcp action = allow localport = 139,445 remoteip = localsubnet profile = DOMAIN

netsh advfirewall firewall add rule name = SQLReplUDP dir = out protocol = udp action = allow localport = 137,138 remoteip = localsubnet profile = DOMAIN
netsh advfirewall firewall add rule name = SQLReplTCP dir = out protocol = tcp action = allow localport = 139,445 remoteip = localsubnet profile = DOMAIN

pause