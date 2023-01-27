touch /root/.Xauthority
xauth add XAUTHKEY
cd /opt/BeamDAQ/
. /opt/BeamDAQ/setup.sh
/opt/BeamDAQ/scripts/run_beamDAQ_forever.sh
