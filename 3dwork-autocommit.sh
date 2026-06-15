#!/bin/bash

# Entrar a la carpeta de configuración
cd ~/printer_data/config

# Añadir todos los cambios de archivos
git add .

# Crear el punto de restauración con la fecha y hora actuales
git commit -m "Copia de seguridad automática: $(date +'%Y-%m-%d %H:%M:%S')"

# Subir los archivos a GitHub de forma silenciosa
git push -u origin main
