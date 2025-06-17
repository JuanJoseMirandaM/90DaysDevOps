# Día 01 - DevOps y la Importancia de Linux

📅 **Fecha:** 16/06/2025  
📂 **Semana:** 1 — Día 2

---

## ✅ Tema del día

Hoy vimos los fundamentos del sistema operativo Linux desde la terminal: comandos esenciales para DevOps, la estructura del sistema de archivos, gestión de usuarios y permisos.

-----

## 🧠 Lo que aprendí

* Comandos esenciales: `ls`, `cd`, `mkdir`, `cp`, `mv`, `rm`, `whoami`, `chmod`, `chown`, `systemctl`, entre muchos otros.
* Cómo navegar por la estructura jerárquica del sistema de archivos (FHS).
* Diferencia entre `/`, `/etc`, `/var`, `/home`, `/root`, etc.
* Cómo gestionar usuarios y permisos (lectura, escritura, ejecución para owner, group y others).
* Qué hace el comando `chmod u=rwx,g=rx,o= hola.txt`:
> Le otorga al usuario propietario permisos de lectura, escritura y ejecución (`rwx`), al grupo solo lectura y ejecución (`rx`), y ningún permiso a los demás (`o=`).
* Comandos de gestión de servicios con `systemctl` y `service`.
* Instalación de software usando `apt`.

-----

## ⚙️ Ejercicios realizados

* 🖥️ Instalar y ejecutar **Nginx**.
  * Comando: `sudo apt install nginx && sudo systemctl start nginx`
  * *Captura de pantalla:
  ![Instalar Ngix](/assets/day-02/terminal_ngix.png "Instalar Ngix")*

* 🌍 Instalar **Apache**, y mostrar una pagina principal personalizada con la hora actual.
  * Comando: `sudo apt install apache2 -y && sudo systemctl status apache2`
  * *Captura de pantalla:
  ![Instalar Apache](/assets/day-02/terminal_apache_running.png "Instalar Apache")*
  * *Personaliza la pagina principal
  ![Personalizar Apache](/assets/day-02/terminal_apache_personalizada.png "Personalizar Apache")*

* 🖥️ Practicar con la terminal
  * Crear el directorio: `mkdir ~/day02 && cd ~/day02`
  * Crear archivo: `echo "Hola Pepe DevOps!" > saludos.txt`
  * Copiarlo: `cp saludos.txt copia.txt`
  * Modificar: `mv copia.txt hola.txt`
  * Eliminar: `rm saludos.txt`
  * *Captura de terminal:
  ![Terminal Day 2](/assets/day-02/terminal_comandos_basicos.png "Terminal Day 2")*

* 👤 Creé un usuario y modifiqué permisos para el archivo `hola.txt`:
  * Crear usuario: `sudo adduser invitado`
  * Crear grupo: `sudo groupadd devs`
  * Asignar usuario al grupo: `sudo usermod -aG devs invitado`
  * Otorgar permisos para leer/escribir/ejecutar`chmod 740 hola.txt`
  * `ls -l hola.txt`
  * *Captura de terminal:
  ![Terminal new user](/assets/day-02/terminal_new_user.png "Terminal new user")*

-----

## 📎 Recursos

* 🧠 [Artículo del reto Día 2](https://90daysdevops.295devops.com/semana-01/dia2)
* 📄 [Documentación de comandos Linux](https://linux.die.net/man/)
* 📄 [Documentación oficial de Nginx](https://nginx.org/en/docs/)
* 📄 [Documentación oficial de Apache](https://httpd.apache.org/docs/)

-----