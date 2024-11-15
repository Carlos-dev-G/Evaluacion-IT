#!/bin/bash

# Verificar si el script fue ejecutado con privilegios de superusuario (sudo)
if [[ "$EUID" -ne 0 ]]; then
    clear
    echo "Este script debe ser ejecutado con sudo."
    exit 1
fi

clear
echo "Actualizando el sistema..."
sudo apt update -y && sudo apt upgrade -y
echo "Sistema actualizado."
sleep 5
clear

# Instalar Python y pip
echo "Instalando Python..."
sudo apt install -y python3 python3-pip 
echo "Python y pip instalados:" 
python3 --version 
pip3 --version
sleep 5
clear

# Solicitar el nombre de usuario
read -p "Ingresa el nombre de tu cuenta de usuario en el sistema: " username
clear

# Ejecutar el script de Python con el nombre de usuario proporcionado
if sudo python3 scripts/user.py --username "$username"; then
    echo "Usuario agregado exitosamente."
else
    echo "Error al agregar usuario."
    exit 1
fi
sleep 5
clear

# Instalar Node.js
echo "Instalando Node.js..."
sudo apt install -y nodejs 
echo "Node.js instalado:" 
nodejs -v
sleep 5
clear

# Instalar Java
echo "Instalando Java..."
sudo apt install -y default-jdk 
echo "Java instalado:" 
java --version
sleep 5
clear

# Instalar PHP
echo "Instalando PHP..."
sudo apt install -y php libapache2-mod-php php-mysql 
echo "PHP instalado:" 
php -v
sleep 5
clear

# Instalar MariaDB
echo "Instalando MariaDB..."
sudo apt install -y mariadb-server
sudo systemctl enable mariadb 
sudo systemctl start mariadb
echo "MariaDB instalado."
sleep 5
clear

# Instalar Apache
echo "Instalando Apache..."
sudo apt install -y apache2
echo "Apache instalado."
sleep 5
clear

# Instalar extensiones adicionales de PHP
echo "Instalando extensiones adicionales de PHP..."
sudo apt install -y php-curl php-gd php-mbstring php-xml php-xmlrpc
echo "Instalaciones completadas."
sleep 5
clear

# Crear documentación en el escritorio
echo "Creando documentación en el Escritorio..."
sudo python3 scripts/docs.py --username "$username"
echo "Documentación creada exitosamente."
sleep 5
clear

# Descargar e instalar NetBeans
echo "Descargando NetBeans..."
sudo wget -q https://dlcdn.apache.org/netbeans/netbeans-installers/23/apache-netbeans_23-1_all.deb --progress=bar -O apache-netbeans_23-1_all.deb
sudo dpkg -i apache-netbeans_23-1_all.deb
clear
echo "Resolviendo dependencias de NetBeans..."
sudo apt-get install -f
sleep 5
clear

# Descargar e instalar Visual Studio Code
echo "Descargando Visual Studio Code..."
sudo wget -q https://go.microsoft.com/fwlink/?LinkID=760868 --progress=bar -O vscode.deb
echo "Instalando Visual Studio Code..."
sudo dpkg -i vscode.deb
clear
echo "Resolviendo dependencias de Visual Studio Code..."
sudo apt-get install -f
echo "Visual Studio Code ha sido instalado exitosamente."

sleep 4
clear

# Configuración Final
echo "Configuración Final..."
sudo rm -rf /etc/apache2/sites-available/000-default.conf
sudo python3 scripts/server.py
sudo a2ensite 000-default

echo "Configuración completada."
sleep 5
clear

# Descargar e instalar XAMPP
echo "Descargando XAMPP..."
URL="https://sitsa.dl.sourceforge.net/project/xampp/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run?viasf=1"
ARCHIVO="xampp-linux-x64-8.2.12-0-installer.run"
wget -O "$ARCHIVO" "$URL"

if [ -f "$ARCHIVO" ]; then
    echo "Archivo XAMPP descargado con éxito."
    chmod +x "$ARCHIVO"
    echo "Instalando XAMPP..."
    sudo ./"$ARCHIVO"
    echo "XAMPP instalado exitosamente."
else
    echo "Error al descargar el archivo XAMPP."
fi
