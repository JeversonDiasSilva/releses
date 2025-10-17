#!/bin/bash
# Curitiba 17 de Outubro de 2025
# Editor Jeverson Dias da Silva
# Youtube/@JCGAMESCLASSICOS
# Script de instalação "ONLINE" do sistema "de download de jogos windows"

# URL corrigida
url="https://github.com/JeversonDiasSilva/releases/raw/refs/heads/main/apps/downloader.sh"

# Baixando o script e a dependência xdotool
squash=$(basename "$url")
wget "$url"


# Tornando o script executável
chmod +x "$squash"

# Executando o script baixado
./"$squash"
clear
