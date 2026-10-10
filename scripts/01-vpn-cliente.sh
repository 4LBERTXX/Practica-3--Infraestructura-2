#!/bin/bash
# =====================================================================
# Prueba 1 - La VPN solo llega al Jump Server
# Dónde se ejecuta: consola VNC de vpn-usuario-2241-1 (cliente VPN, Ubuntu)
# Capturas: 35-vpn-conectada.png (parte 1) y 36-vpn-pruebas.png (parte 2)
# =====================================================================

# --- Parte 1: levantar la VPN y verificar el túnel ---
sudo ipsec restart
sleep 5
sudo ipsec up VPN-REMOTE-2241
sudo ipsec statusall | grep -E "ESTABLISHED|INSTALLED|==="

# --- Parte 2: probar los puertos a través de la VPN ---
# Esperado: 443 y 3389 al Jump "succeeded"; 22 al Jump y 443 al Web "timed out"
nc -zv -w 3 10.22.41.138 443
nc -zv -w 3 10.22.41.138 3389
nc -zv -w 3 10.22.41.138 22
nc -zv -w 3 10.22.41.130 443
