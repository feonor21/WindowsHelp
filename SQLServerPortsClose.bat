rem SQLServerPortsClose.bat
rem Date Modified: 03/26/2021
rem Author: Avery Lane

set "ag_endpnt=5022"
set "sb_endpnt=4022"

rem SQL Default Ports Inbound/Outbound
netsh advfirewall firewall delete rule name="SQLPort"

rem SQL Dedicated Admin Port Inbound (Default Instance)
netsh advfirewall firewall delete rule name="SQLPortDedicatedAdmin"

rem SQL Database mirroring/AlwaysOn AG (Default is 5022)
netsh advfirewall firewall delete rule name="SQLPortAG"

rem SQL Browser Service
netsh advfirewall firewall delete rule name="SQLPortBrowser"

rem Service Broker (Default is 4022)
netsh advfirewall firewall delete rule name="SQLPortServiceBroker"

rem Replication
netsh advfirewall firewall delete rule name="SQLReplTCP"
netsh advfirewall firewall delete rule name="SQLReplUDP"

pause