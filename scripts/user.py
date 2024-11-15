import sys
import os
import argparse

parser = argparse.ArgumentParser(description='Script para agregar un usuario al archivo sudoers')
parser.add_argument('--username', type=str, required=True, help='Nombre de usuario para agregar')

argumentos = parser.parse_args()

ruta_archivo = '/etc/sudoers'

if os.path.isfile(ruta_archivo):
    with open(ruta_archivo, 'a') as archivo_usuarios:
        archivo_usuarios.write(f"\n{argumentos.username} ALL=(ALL:ALL) ALL\n")
    sys.exit(0)
else:
    sys.exit(1)