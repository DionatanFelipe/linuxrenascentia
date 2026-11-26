#!/bin/bash

# Opções para rofi
options="Desligar\nReiniciar\nSuspender\nSair da Sessão"

# Exibir o menu
choice=$(echo -e "$options" | rofi -dmenu -p "Escolha a ação:")

# Executar o comando baseado na escolha
case "$choice" in
    "Desligar")
        systemctl poweroff
        ;;
    "Reiniciar")
        systemctl reboot
        ;;
    "Suspender")
        systemctl suspend
        ;;
    "Sair da Sessão")
        # Comando para sair da sessão no Sway
        swaymsg exit
        ;;
    *)
        exit 1
        ;;
esac

