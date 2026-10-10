# =====================================================================
# Red del Jump Server (IP, gateway y rutas de retorno hacia usuarios y VPN)
# Dónde se ejecuta: PowerShell como administrador, dentro del Jump Server
# Captura: 21-jump-red.png
# Esperado: IP 10.22.41.138, gateway 10.22.41.137 y rutas 10.22.41.0/24 y
#           10.212.135.0/24 con NextHop 10.22.41.137
# =====================================================================

ipconfig
Get-NetRoute -AddressFamily IPv4 | Where-Object { $_.DestinationPrefix -like "10.*" }
