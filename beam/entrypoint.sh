# touch /root/.Xauthority
# xauth add XAUTHKEY
echo "cd $BEAMDAQ_DIR"
cd $BEAMDAQ_DIR
source setup_slowcontrols.sh
source setup.sh
source scripts/run_beamDAQ_forever.sh
