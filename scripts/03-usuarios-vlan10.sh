#!/bin/bash
# =====================================================================
# Prueba 3 - Usuarios de la VLAN 10 (DHCP, acceso al Jump y SSH bloqueado)
# Dónde se ejecuta: consola VNC de usuario-priv-2241 (10.22.41.20)
#                   y de usuario-sinpriv-2241 (10.22.41.21). Mismos comandos.
# Capturas: 33-usuario-priv.png y 34-usuario-sinpriv.png
# Esperado: IP .20 / .21 por DHCP; Jump :443 "succeeded";
#           Jump :22, Web :22 y Web :443 "timed out"; curl responde 200/301/302
# =====================================================================

# Nombre del Jump Server para esta máquina (solo se agrega una vez)
grep -q "jump.lab2241.local" /etc/hosts || echo "10.22.41.138 jump.lab2241.local" | sudo tee -a /etc/hosts

ip -4 a show ens3
ping -c 3 10.22.41.1

nc -zv -w 3 10.22.41.138 443
nc -zv -w 3 10.22.41.138 22
nc -zv -w 3 10.22.41.130 22
nc -zv -w 3 10.22.41.130 443

curl -k -I https://jump.lab2241.local/RDWeb/
