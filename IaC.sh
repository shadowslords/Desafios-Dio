#!/bin/bash

# Define a senha padrão
SENHA_PADRAO="Senha123"

# 1. Criação dos Diretórios
mkdir -p /publico /adm /ven /sec

# 2. Criação dos Grupos de Acesso
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# 3. Criação de Usuários, Home Dir e Senhas
# Usuários GRP_ADM
useradd -m -G GRP_ADM carlos; echo "carlos:$SENHA_PADRAO" | chpasswd
useradd -m -G GRP_ADM maria; echo "maria:$SENHA_PADRAO" | chpasswd
useradd -m -G GRP_ADM joao; echo "joao:$SENHA_PADRAO" | chpasswd

# Usuários GRP_VEN
useradd -m -G GRP_VEN debora; echo "debora:$SENHA_PADRAO" | chpasswd
useradd -m -G GRP_VEN sebastiana; echo "sebastiana:$SENHA_PADRAO" | chpasswd
useradd -m -G GRP_VEN roberto; echo "roberto:$SENHA_PADRAO" | chpasswd

# Usuários GRP_SEC
useradd -m -G GRP_SEC josefina; echo "josefina:$SENHA_PADRAO" | chpasswd
useradd -m -G GRP_SEC amanda; echo "amanda:$SENHA_PADRAO" | chpasswd
useradd -m -G GRP_SEC rogerio; echo "rogerio:$SENHA_PADRAO" | chpasswd


# 4. Permissionamento
# Proprietário de todos os diretórios é root:root
chown root:root /publico /adm /ven /sec

# /publico: Acesso total (777)
chmod 777 /publico

# Diretórios de Grupo: Dono=root, Grupo=GRP_XX, Permissão=2770 (setgid)
chown root:GRP_ADM /adm; chmod 2770 /adm
chown root:GRP_VEN /ven; chmod 2770 /ven
chown root:GRP_SEC /sec; chmod 2770 /sec

# Fim
echo "Padronização concluída. Lembre-se de mudar a senha padrão!"
