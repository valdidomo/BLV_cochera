#!/bin/bash
NEW_DIR="/home/pi/printer_data/config/input_shaper"
if [ ! -d "$NEW_DIR" ]; then
    mkdir -p "$NEW_DIR"
fi

# 1. Gráfica comparativa de tensión de Correas (Se usa graph_accelerometer.py sobre los datos crudos en diagonal)
~/klippy-env/bin/python ~/klipper/scripts/graph_accelerometer.py /tmp/raw_data_axis*.csv -o "${NEW_DIR}/belt_tension_comparativa.png" 2>/dev/null

# 2. Gráficas individuales de Resonancias X e Y (Se usa calibrate_shaper.py sobre los datos procesados de Klipper)
~/klippy-env/bin/python ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o "${NEW_DIR}/resonancias_x.png" 2>/dev/null
~/klippy-env/bin/python ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o "${NEW_DIR}/resonancias_y.png" 2>/dev/null


