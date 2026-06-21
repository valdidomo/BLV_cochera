#!/bin/bash
NEW_DIR="/home/pi/printer_data/config/input_shaper"

if [ ! -d "$NEW_DIR" ]; then
    mkdir -p "$NEW_DIR"
fi

case "$1" in
    clean)
        # !!! CORREGIDO: Ya NO borramos los archivos .png de Mainsail !!!
        # Solo desalojamos los archivos CSV viejos de la carpeta /tmp
        mkdir -p /home/pi/printer_data/config/scripts/.tmp_clean
        mv /tmp/calibration_data_*.csv /home/pi/printer_data/config/scripts/.tmp_clean/ 2>/dev/null
        mv /tmp/resonances_*.csv /home/pi/printer_data/config/scripts/.tmp_clean/ 2>/dev/null
        mv /tmp/raw_data_axis*.csv /home/pi/printer_data/config/scripts/.tmp_clean/ 2>/dev/null
        rm -rf /home/pi/printer_data/config/scripts/.tmp_clean
        ;;
    belts)
        # 1. Gráfica de Correas: resonances_axis o raw_data_axis
        /home/pi/klippy-env/bin/python /home/pi/klipper/scripts/graph_accelerometer.py /tmp/*axis*.csv -o "${NEW_DIR}/belt_tension_comparativa.png" 2>/dev/null
        
        mkdir -p /home/pi/printer_data/config/scripts/.tmp_clean
        mv /tmp/*axis*.csv /home/pi/printer_data/config/scripts/.tmp_clean/ 2>/dev/null
        rm -rf /home/pi/printer_data/config/scripts/.tmp_clean
        ;;
    shaper_x)
        # 2. Gráfica de Input Shaper X: resonances_x o calibration_data_x
        /home/pi/klippy-env/bin/python /home/pi/klipper/scripts/calibrate_shaper.py /tmp/*_x_*.csv -o "${NEW_DIR}/resonancias_x.png" 2>/dev/null
        
        mkdir -p /home/pi/printer_data/config/scripts/.tmp_clean
        mv /tmp/*_x_*.csv /home/pi/printer_data/config/scripts/.tmp_clean/ 2>/dev/null
        rm -rf /home/pi/printer_data/config/scripts/.tmp_clean
        ;;
    shaper_y)
        # 3. Gráfica de Input Shaper Y: resonances_y o calibration_data_y
        /home/pi/klippy-env/bin/python /home/pi/klipper/scripts/calibrate_shaper.py /tmp/*_y_*.csv -o "${NEW_DIR}/resonancias_y.png" 2>/dev/null
        
        mkdir -p /home/pi/printer_data/config/scripts/.tmp_clean
        mv /tmp/*_y_*.csv /home/pi/printer_data/config/scripts/.tmp_clean/ 2>/dev/null
        rm -rf /home/pi/printer_data/config/scripts/.tmp_clean
        ;;
esac
