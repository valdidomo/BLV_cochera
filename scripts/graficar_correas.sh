#!/bin/bash
NEW_DIR="/home/pi/printer_data/config/input_shaper"

if [ ! -d "$NEW_DIR" ]; then
    mkdir -p "$NEW_DIR"
fi

case "$1" in
    clean)
        rm -f "$NEW_DIR"/*.png
        rm -f /tmp/raw_data_axis*.csv
        rm -f /tmp/resonances_*.csv
        rm -f /tmp/calibration_data_*.csv
        ;;
    belts)
        # Gráfica de Correas (Rutas absolutas fijas sin el símbolo ~)
        /home/pi/klippy-env/bin/python /home/pi/klipper/scripts/graph_accelerometer.py /tmp/raw_data_axis*.csv -o "${NEW_DIR}/belt_tension_comparativa.png" 2>/dev/null
        ;;
    shaper_x)
        # Input Shaper X (Rutas absolutas fijas sin el símbolo ~)
        /home/pi/klippy-env/bin/python /home/pi/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_x_*.csv -o "${NEW_DIR}/resonancias_x.png" 2>/dev/null
        ;;
    shaper_y)
        # Input Shaper Y (Rutas absolutas fijas sin el símbolo ~)
        /home/pi/klippy-env/bin/python /home/pi/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_y_*.csv -o "${NEW_DIR}/resonancias_y.png" 2>/dev/null
        ;;
esac


