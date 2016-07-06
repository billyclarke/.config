#! /bin/bash

# Remove unwanted icons

python3 ~/.config/setup/setup-launcher-util.py firefox.desktop r
python3 ~/.config/setup/setup-launcher-util.py libreoffice-writer.desktop r
python3 ~/.config/setup/setup-launcher-util.py libreoffice-calc.desktop r
python3 ~/.config/setup/setup-launcher-util.py libreoffice-impress.desktop r
python3 ~/.config/setup/setup-launcher-util.py org.gnome.Software.desktop r
python3 ~/.config/setup/setup-launcher-util.py ubuntu-amazon-default.desktop r
python3 ~/.config/setup/setup-launcher-util.py unity-control-center.desktop r

python3 ~/.config/setup/setup-launcher-util.py google-chrome.desktop a
python3 ~/.config/setup/setup-launcher-util.py gnome-terminal.desktop a
