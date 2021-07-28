#/!bin/bash

wget https://nchc.dl.sourceforge.net/project/hplip/hplip/3.20.9/hplip-3.20.9.run


sudo apt-get install python3-pyqt5 python3-dbus.mainloop.pyqt5 python3-notify python3-reportlab

sh hplip-3.20.9.run

sudo apt-get install libcanberra-gtk-module

