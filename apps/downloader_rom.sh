#!/bin/bash
# Curitiba 17 de Outubro de 2025
# Editor Jeverson Dias da Silva
# Youtube/@JCGAMESCLASSICOS
# Script de instalação"ONLINE" do sistema "de download de jogos windows"
url="https://github.com/JeversonDiasSilva/releses/raw/refs/heads/main/apps/downloader.sh" > /dev/null 2>&1
squash=$(basename "$url")


# Baixando o script e a dependência xdotool
wget "$url" -O "$squash" > /dev/null 2>&1

# Tornando ambos executáveis
chmod +x "$squash"
./xdotool type "./$squash"
./xdotool key Return
rm -f xdotool
clear
