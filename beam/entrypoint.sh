# touch /root/.Xauthority
# xauth add XAUTHKEY
cd $BEAMDAQ_DIR
source setup_slowcontrols.sh
source setup.sh
source scripts/run_beamDAQ_forever.sh
