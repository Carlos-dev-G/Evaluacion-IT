# **Script de Instalación y Configuración**

Este script automatiza la instalación y configuración de herramientas de desarrollo en sistemas Linux.

## **Características del Script**

- **Actualización del sistema**: Realiza una actualización completa del sistema (usando `apt update` y `apt upgrade`).
- **Instalación de software**:
  - Python 3 y `pip`.
  - Node.js.
  - Java (JDK por defecto).
  - PHP y extensiones necesarias.
  - MariaDB y configuración inicial.
  - Apache.
- **Instalación de IDEs**:
  - NetBeans.
  - Visual Studio Code.
- **Generación de documentación personalizada en el escritorio**.
- **Configuración de Apache**.
- **Descarga e instalación de XAMPP**.

---

## **Pasos de Instalación**

### **1. Actualizar Sistema**

Para actualizar el sistema, ejecuta los siguientes comandos:

```bash
sudo apt update && sudo apt upgrade -y
```

### **2. Instalar Git**

Para instalar Git, ejecuta el siguiente comando:

```bash
sudo apt install git -y
```

### **3. Clonar el Repositorio**

Clona el repositorio que contiene el script utilizando el siguiente comando:

```bash
git clone https://github.com/Carlos-dev-G/Evaluacion-IT
```

### **4. Ejecutar el Script**

1. Navega a la carpeta del proyecto clonado:

   ```bash
   cd IT
   ```

2. Ejecuta el script principal para instalar y configurar las herramientas:

   ```bash
   sudo bash run.sh
   ```
