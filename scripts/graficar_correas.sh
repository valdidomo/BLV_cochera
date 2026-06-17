#!/bin/bash
NEW_DIR="/home/pi/printer_data/config/input_shaper"
if [ ! -d "$NEW_DIR" ]; then
    mkdir -p "$NEW_DIR"
fi

# 1. Gráfica comparativa de tensión de Correas (Datos en diagonal)
~/klipper/scripts/calibrate_shaper.py /tmp/raw_data_axis=*.csv -o "${NEW_DIR}/belt_tension_comparativa.png" 2>/dev/null

# 2. Gráficas individuales de Resonancias X e Y (Datos puros de ejes de Klipper)
~/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_x_*.csv -o "${NEW_DIR}/resonancias_x.png" 2>/dev/null
~/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_y_*.csv -o "${NEW_DIR}/resonancias_y.png" 2>/dev/null
