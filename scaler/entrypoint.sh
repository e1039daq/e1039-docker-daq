# touch /root/.Xauthority
# xauth add XAUTHKEY
touch /var/log/vsftpd.log
tail -f /var/log/vsftpd.log | tee /dev/stdout &
touch /var/log/xferlog
tail -f /var/log/xferlog | tee /dev/stdout &

/usr/sbin/vsftpd
/usr/sbin/crond


echo ""
echo "----------------------"
echo "| FTP Server Running |"
echo "| Ready to Boot MVME |"
echo "----------------------"
echo ""

echo "192.168.24.12 e1039sc4.sq.pri e1039sc4" >> /etc/hosts
echo "192.168.24.14 e1039sc4.sq.pri e1039sc4" >> /etc/hosts
echo "172.17.0.1 e1039sc4.sq.pri e1039sc4" >> /etc/hosts

cat /opt/hosts >> /etc/hosts

sudo -i -u $FTP_USER tcsh << EOF
cd /home/$FTP_USER
/usr/bin/crontab /opt/e1039sc4.e1039daq.crontab
source dosetupcoda261
./PreCoda
# echo "Starting RunFFT"
xterm -hold -cr blue -bg blue -fg white -sb -rightbar -geometry 62x18+610+550 -sl 2500  -j  -T "Run FFT" -e './RunFFT'   &
xterm -hold -cr black -bg black -fg white -sb -rightbar -geometry 62x18+610+550 -sl 2500  -j  -T "Scaler DAQ" -e 'tcsh' &
rcgui &
simple-gtk-buttonbox "Scaler DAQ Control" "PreCoda" "./PreCoda" "RCGui" "rcgui &" "RunFFT" "xterm -hold -cr blue -bg blue -fg white -sb -rightbar -geometry 62x18+610+550 -sl 2500  -j  -T 'Run FFT' -e './RunFFT'   &" "Kill Coda" "./kcoda" "Terminal" "xterm -hold -cr black -bg black -fg white -sb -rightbar -geometry 62x18+610+550 -sl 2500  -j  -T 'Scaler DAQ' -e 'tcsh' &" "Telnet ROC6SC" "xterm -hold -cr black -bg black -fg white -sb -rightbar -geometry 62x18+610+550 -sl 2500  -j  -T 'ROC6SC' -e 'telnet 192.168.24.101 100' &" 
./kcoda
