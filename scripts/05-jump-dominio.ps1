# =====================================================================
# Dominio de Active Directory, usuarios y grupos del Jump Server
# Dónde se ejecuta: PowerShell como administrador, dentro del Jump Server
# Captura: 22-jump-dominio.png
# Esperado: dominio lab2241.local / LAB2241; user-sinpriv en GRP-SinPrivilegios
#           y user-priv en GRP-ConPrivilegios
# =====================================================================

Get-ADDomain | Select-Object DNSRoot, NetBIOSName
Get-ADGroupMember GRP-SinPrivilegios | Select-Object Name
Get-ADGroupMember GRP-ConPrivilegios | Select-Object Name
