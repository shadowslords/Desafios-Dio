#!/bin/bash

# --- Variáveis ---
GITHUB_REPO="https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"
DOWNLOAD_DIR="/tmp"
APACHE_WEB_DIR="/var/www/html"
APP_NAME="linux-site-dio-main" # Nome da pasta extraída do ZIP

echo "⚙️ Iniciando o Provisionamento do Servidor Web..."

# 1. Atualizar o Servidor
echo "🛠️ 1. Atualizando o sistema operacional..."
apt update -y
apt upgrade -y

# 2. Instalar Apache2 e Unzip
echo "📦 2. Instalando Apache2 e Unzip..."
apt install apache2 unzip -y

# 3. Baixar a Aplicação
echo "📥 3. Baixando e descompactando a aplicação web..."
# Navega para o diretório /tmp
cd $DOWNLOAD_DIR

# Baixa o arquivo ZIP do GitHub
wget $GITHUB_REPO -O "app.zip"

# Descompacta o arquivo ZIP
unzip app.zip

# 4. Copiar Arquivos da Aplicação
echo "📤 4. Copiando arquivos para o diretório padrão do Apache..."
# Remove qualquer conteúdo existente no diretório padrão do Apache
rm -rf $APACHE_WEB_DIR/*

# Copia os arquivos descompactados para o diretório padrão
cp -R $APP_NAME/* $APACHE_WEB_DIR/

# 5. Finalizar
echo "✅ Provisionamento Concluído!"
echo "O Servidor Web Apache2 está instalado e a aplicação foi deployada em $APACHE_WEB_DIR."
echo "Você pode acessar o site pelo IP do seu servidor."
