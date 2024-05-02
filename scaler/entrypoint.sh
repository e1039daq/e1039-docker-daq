# touch /root/.Xauthority
# xauth add XAUTHKEY
touch /var/log/vsftpd.log
tail -f /var/log/vsftpd.log | tee /dev/stdout &
touch /var/log/xferlog
tail -f /var/log/xferlog | tee /dev/stdout &

/usr/sbin/vsftpd

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
source dosetupcoda261
./PreCoda
rcgui
./kcoda
