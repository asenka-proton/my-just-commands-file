default:
    just --list

apt-upgrade:
    sudo apt update -y 
    sudo apt upgrade -y
    sudo apt autoremove -y

show-internet-connection:
    nmcli connection show --active

proton-vpn-install:
   wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
   sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
   sudo apt install proton-vpn-gnome-desktop

proton-vpn-uninstall:
    sudo apt purge "protonvpn*" -y
    sudo apt autoremove proton-vpn-gnome-desktop -y
    cd ~/.cache/Proton && rm -rf VPN
    cd ~/.config/Proton && rm -rf VPN

meteo ville="La+Ville+aux+Dames":
    curl --silent wttr.in/{{ ville }}?lang=fr

ip-location:
    curl --silent ipinfo.io | jq
