#!/bin/bash
# =====================================================================
# Servicios del Web Server (HTTPS, SSH y RDP)
# Dónde se ejecuta: consola VNC de UBUNTU-server-2241-1 (Web Server)
# Captura: 20-webserver-servicios.png
# Esperado: puertos 22, 443 y 3389 en escucha; los tres servicios "active"
# =====================================================================

ip -4 a show ens3
ip route
sudo ss -tlnp | grep -E ':(22|443|3389)'
systemctl is-active apache2 ssh xrdp
