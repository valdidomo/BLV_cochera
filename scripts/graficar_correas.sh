#!/bin/bash
NEW_DIR="/home/pi/printer_data/config/res_helper"
if [ ! -d "$NEW_DIR" ]; then
    mkdir -p "$NEW_DIR"
fi
~/klipper/scripts/calibrate_shaper.py /tmp/raw_data_axis=1.000,1.000,0.000_*.csv -o "${NEW_DIR}/belt_tension_x.png"
~/klipper/scripts/calibrate_shaper.py /tmp/raw_data_axis=1.000,-1.000,0.000_*.csv -o "${NEW_DIR}/belt_tension_y.png"


