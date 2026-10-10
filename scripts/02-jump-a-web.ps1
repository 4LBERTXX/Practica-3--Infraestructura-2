# =====================================================================
# Prueba 2 - El Jump Server solo llega a HTTPS, RDP y SSH del Web Server
# Dónde se ejecuta: PowerShell como administrador, dentro del Jump Server
# Captura: 23-jump-a-web.png
# Esperado: 443, 22 y 3389 -> TcpTestSucceeded True; 80 -> False
# (El "Ping failed" que aparece como advertencia es normal: ICMP no está permitido)
# =====================================================================

Test-NetConnection 10.22.41.130 -Port 443
Test-NetConnection 10.22.41.130 -Port 22
Test-NetConnection 10.22.41.130 -Port 3389
Test-NetConnection 10.22.41.130 -Port 80
