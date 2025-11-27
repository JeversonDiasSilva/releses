#!/bin/bash
# Curitiba 09 de Maio de 2025
# Editor: Jeverson Dias da Silva

############## VARIÁVEIS PRINCIPAIS ##############
app="brave"
squash="Brave Browser"

exe="/userdata/system/.local/share/applications"
dir_app="/userdata/system/.dev/apps/brave"

url_icon="https://raw.githubusercontent.com/JeversonDiasSilva/releses/main/apps/img/Brave.png"
url_appimage="https://github.com/JeversonDiasSilva/releses/releases/download/v1.0.0/Brave-nightly-v1.87.8-x86_64.AppImage"
url_desktop="https://raw.githubusercontent.com/JeversonDiasSilva/releses/main/apps/desktop/brave"

# Novos arquivos
url_tor_desktop="https://raw.githubusercontent.com/JeversonDiasSilva/releses/main/apps/desktop/tor.desktop"
url_tor_icon="https://raw.githubusercontent.com/JeversonDiasSilva/releses/main/apps/img/Tor.png"

url_lib="https://github.com/JeversonDiasSilva/releses/releases/download/v1.0.0/libcups.so.2"

appimage_name=$(basename "$url_appimage")
save="batocera-save-overlay"

log_file="/tmp/install_error_log_brave.txt"

############## FUNÇÃO DE LOG ##############
log_error() {
    echo "$(date) - $1" >> "$log_file"
    echo -e "${AMARELO}$1${RESET}"
}

############## FUNÇÃO DE DOWNLOAD SILENCIOSO ##############
download() {
    local url=$1
    local dest=$2
    wget -q "$url" -O "$dest" > /dev/null 2>&1 || {
        log_error "Erro ao baixar $(basename "$dest")."
        exit 1
    }
}

############## ESTILIZAÇÃO ##############
clear
echo ""
echo ""
echo ""
echo ""

ROXO="\033[1;35m"
VERDE="\033[1;92m"
AZUL="\033[1;34m"
AMARELO="\033[1;33m"
RESET="\033[0m"
BOLD="\033[1m"

echo -e "${ROXO}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${ROXO}${BOLD}  INSTALAÇÃO DO APLICATIVO ${RESET}${VERDE}$squash${RESET}"
echo -e "${ROXO}${BOLD}  V40 E V41 - JEVERTON DIAS DA SILVA - 06 DE MAIO DE 2025  ${RESET}"
echo -e "${ROXO}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}"
sleep 2

echo -e "${AMARELO}Preparando o ambiente...${RESET}"
mkdir -p "$dir_app/icon" > /dev/null 2>&1
mkdir -p "$exe" > /dev/null 2>&1
sleep 1


############## DOWNLOADS PRINCIPAIS (SILENCIOSO) ##############
echo -e "${AZUL}Baixando ícone do Brave...${RESET}"
download "$url_icon" "$dir_app/icon/Brave.png"

echo -e "${AZUL}Baixando AppImage do Brave...${RESET}"
download "$url_appimage" "$dir_app/$appimage_name"

echo -e "${AZUL}Criando atalho do Brave...${RESET}"
download "$url_desktop" "$exe/brave.desktop"


############## DOWNLOADS EXTRAS (TOR) ##############
echo -e "${AZUL}Baixando atalho do Tor Browser...${RESET}"
download "$url_tor_desktop" "$exe/tor.desktop"

echo -e "${AZUL}Baixando ícone do Tor...${RESET}"
download "$url_tor_icon" "$dir_app/icon/Tor.png"


############## BIBLIOTECAS NECESSÁRIAS ##############
if [ ! -f /usr/lib/libcups.so.2 ]; then
    echo -e "${AZUL}Instalando bibliotecas necessárias...${RESET}"
    download "$url_lib" "/usr/lib/libcups.so.2"
fi


############## PERMISSÕES ##############
chmod -R 777 "$dir_app" > /dev/null 2>&1
chmod 777 "$exe/brave.desktop" > /dev/null 2>&1
chmod 777 "$exe/tor.desktop" > /dev/null 2>&1
chmod +x "$dir_app/$appimage_name" > /dev/null 2>&1


############## SALVAR OVERLAY ##############
echo -e "${AZUL}Salvando configurações...${RESET}"
$save 150 > /dev/null 2>&1


############## MENSAGENS FINAIS ##############
sleep 1
echo -e "${AMARELO}${BOLD}🔔 Suporte WhatsApp:${RESET}${VERDE}${BOLD} (41) 99820-5080 ${RESET}"
echo -e "${AMARELO}${BOLD}🚀 YouTube:${RESET}${VERDE}${BOLD} @JCGAMESCLASSICOS ${RESET}"

echo -e "${ROXO}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${ROXO}${BOLD}      INSTALAÇÃO CONCLUÍDA COM SUCESSO!                    ${RESET}"
echo -e "${ROXO}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}"

cd || exit 0