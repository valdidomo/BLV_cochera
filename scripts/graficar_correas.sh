#!/bin/bash
NEW_DIR="/home/pi/printer_data/config/input_shaper"

# Asegurar que la carpeta final existe en Mainsail
if [ ! -d "$NEW_DIR" ]; then
    mkdir -p "$NEW_DIR"
fi

# Limpieza previa de imágenes viejas para que no te líes con las fechas
rm -f "$NEW_DIR"/*.png

# 1. Gráfica comparativa de tensión de Correas (Corregido: Usa graph_accelerometer y la ruta sin el '=')
~/klippy-env/bin/python ~/klipper/scripts/graph_accelerometer.py /tmp/raw_data_axis*.csv -o "${NEW_DIR}/belt_tension_comparativa.png" 2>/dev/null

# 2. Gráficas individuales de Resonancias X e Y (Corregido: Usa las rutas nativas /tmp/resonances_*.csv)
~/klippy-env/bin/python ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o "${NEW_DIR}/resonancias_x.png" 2>/dev/null
~/klippy-env/bin/python ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o "${NEW_DIR}/resonancias_y.png" 2>/dev/null

# Limpieza opcional de los archivos temporales pesados de la Raspberry
rm -f /tmp/raw_data_axis*.csv
rm -f /tmp/resonances_*.csv


