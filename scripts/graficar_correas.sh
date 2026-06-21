#!/bin/bash
NEW_DIR="/home/pi/printer_data/config/input_shaper"

if [ ! -d "$NEW_DIR" ]; then
    mkdir -p "$NEW_DIR"
fi

# 1. Gráfica comparativa de tensión de Correas (Corregido: Usa graph_accelerometer.py y lee los temporales correctos sin el '=')
~/klippy-env/bin/python ~/klipper/scripts/graph_accelerometer.py /tmp/raw_data_axis*.csv -o "${NEW_DIR}/belt_tension_comparativa.png" 2>/dev/null

# 2. Gráficas individuales de Resonancias X e Y (Corregido: Usa calibrate_shaper.py y lee los nombres reales resonances_*.csv de Klipper)
~/klippy-env/bin/python ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o "${NEW_DIR}/resonancias_x.png" 2>/dev/null
~/klippy-env/bin/python ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o "${NEW_DIR}/resonancias_y.png" 2>/dev/null


