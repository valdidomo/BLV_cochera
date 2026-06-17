#!/bin/bash
NEW_DIR="/home/pi/printer_data/config/input_shaper"
if [ ! -d "$NEW_DIR" ]; then
    mkdir -p "$NEW_DIR"
fi

# Procesa las imágenes de correas si existen los datos temporales
~/klipper/scripts/calibrate_shaper.py /tmp/raw_data_axis=1.000,1.000,0.000_*.csv -o "${NEW_DIR}/belt_tension_x.png" 2>/dev/null
~/klipper/scripts/calibrate_shaper.py /tmp/raw_data_axis=1.000,-1.000,0.000_*.csv -o "${NEW_DIR}/belt_tension_y.png" 2>/dev/null

# Procesa las imágenes de resonancia de los ejes X e Y si existen los datos
~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o "${NEW_DIR}/resonancias_x.png" 2>/dev/null
~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o "${NEW_DIR}/resonancias_y.png" 2>/dev/null
