#!/usr/bin/env bash
xdg-open https://chat.whatsapp.com/B9ERFplrMc94cZgHtkd74l &>/dev/null 
printf " O programa está em desenvolvimento e pode apresata bugs\n"
sleep 1
pkg="sudo apt-get"
if [[ -e /data/data/com.termux ]]; then
  pkg="pkg"
else
  [[ $UID != 0 ]] && echo " Por favor excute com usuario root" && exit
fi
if [[ -z "$(command -v python)" ]]; then
  printf " Instalando o python...\n"
  $pkg install -y python &>/dev/null
fi
printf " Instalndo os requimentos para o programa...\n"
pip install -r requirements.txt &>/dev/null
python main.py
