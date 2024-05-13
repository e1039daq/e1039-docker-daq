# touch /root/.Xauthority
# xauth add XAUTHKEY
cd /home/e1039daq/BeamDAQ
source /home/e1039daq/BeamDAQ/setup_slowcontrols.sh
source /home/e1039daq/BeamDAQ/setup.sh
/home/e1039daq/BeamDAQ/scripts/run_beamDAQ_forever.sh
