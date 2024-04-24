# touch /root/.Xauthority
# xauth add XAUTHKEY
cd /opt/coda/e1039daq
source dosetupcoda261
simple-gtk-prompt "Completed CODA Setup,\nStarting PreCoda"
./PreCoda
simple-gtk-prompt "PreCoda Done,\nStarting rcgui"
rcgui
./kcoda
