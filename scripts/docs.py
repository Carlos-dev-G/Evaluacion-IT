import argparse
import os

parser = argparse.ArgumentParser(description='Script para agregar un usuario al archivo sudoers')
parser.add_argument('--username', type=str, required=True, help='Nombre de usuario para agregar')

argumentos = parser.parse_args()

ruta = f'/home/{argumentos.username}/Escritorio/server.sh'

script = """
#!/bin/bash

show_menu() {
    echo "------------------------------"
    echo " Gestión de Servicios"
    echo "------------------------------"
    echo "1. Iniciar Apache"
    echo "2. Detener Apache"
    echo "3. Reiniciar Apache"
    echo "4. Iniciar MariaDB"
    echo "5. Detener MariaDB"
    echo "6. Reiniciar MariaDB"
    echo "7. Abrir Visual Studio Code"
    echo "8. Salir"
    echo "------------------------------"
}

manage_apache() {
    case $1 in
        start)
            echo "Iniciando Apache..."
            sudo systemctl start apache2
            echo "Apache iniciado."
            ;;
        stop)
            echo "Deteniendo Apache..."
            sudo systemctl stop apache2
            echo "Apache detenido."
            ;;
        restart)
            echo "Reiniciando Apache..."
            sudo systemctl restart apache2
            echo "Apache reiniciado."
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
}

manage_mariadb() {
    case $1 in
        start)
            echo "Iniciando MariaDB..."
            sudo systemctl start mariadb
            echo "MariaDB iniciado."
            ;;
        stop)
            echo "Deteniendo MariaDB..."
            sudo systemctl stop mariadb
            echo "MariaDB detenido."
            ;;
        restart)
            echo "Reiniciando MariaDB..."
            sudo systemctl restart mariadb
            echo "MariaDB reiniciado."
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
}

open_vscode() {
    php_path="/var/www/html"
    echo "Abriendo Visual Studio Code en $php_path..."
    code "$php_path"
}

while true; do
    show_menu
    read -p "Selecciona una opción [1-8]: " option

    case $option in
        1) manage_apache start ;;
        2) manage_apache stop ;;
        3) manage_apache restart ;;
        4) manage_mariadb start ;;
        5) manage_mariadb stop ;;
        6) manage_mariadb restart ;;
        7) open_vscode ;;
        8) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción no válida. Por favor, selecciona una opción válida." ;;
    esac

    echo ""
    read -p "Presiona Enter para continuar..."
    clear
done
"""

with open(ruta, 'w') as archivo:
    archivo.write(script)

os.chmod(ruta, 0o755)
