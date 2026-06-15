#!/bin/bash
# Script Maestro Input Shaper y Correas para BLV MGN Cube

# Esperar a que Klipper termine de escribir en el disco
sleep 5

# Crear la carpeta destino si no existe
mkdir -p /home/pi/printer_data/config/input_shaper

# 1. COMPROBAR SI ES UN TEST DE CORREAS (Archivos raw_data_axis)
if ls /tmp/raw_data_axis_*.csv 1> /dev/null 2>&1; then
    echo "Procesando gráfico de tensión de correas..."
    python3 ~/klipper/scripts/graph_accelerometer.py /tmp/raw_data_axis_*.csv -o /home/pi/printer_data/config/input_shaper/tension_correas.png
    rm -f /tmp/raw_data_axis_*.csv
fi

# 2. COMPROBAR SI ES EL EJE X (Archivos calibration_data_x)
if ls /tmp/calibration_data_x_*.csv 1> /dev/null 2>&1; then
    echo "Procesando gráfico del Eje X..."
    python3 ~/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_x_*.csv -o /home/pi/printer_data/config/input_shaper/resonancias_x.png
    rm -f /tmp/calibration_data_x_*.csv
fi

# 3. COMPROBAR SI ES EL EJE Y (Archivos calibration_data_y)
if ls /tmp/calibration_data_y_*.csv 1> /dev/null 2>&1; then
    echo "Procesando gráfico del Eje Y..."
    python3 ~/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_y_*.csv -o /home/pi/printer_data/config/input_shaper/resonancias_y.png
    rm -f /tmp/calibration_data_y_*.csv
fi

echo "Procesamiento completado con éxito."

