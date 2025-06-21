# Día 01 - DevOps y la Importancia de Linux

📅 **Fecha:** 16/06/2025  
📂 **Semana:** 1 — Día 3

---

## ✅ Tema del día

Hoy vimos **Vagrant** una herrammienta fundamental en DevOps que permite crear y gestionar entornos de desarrollo virtuales de forma automatizada y reproducible. Esto nos permite estandarizar los entornos para dejar de decir "funciona en mi maquina" y mejor decir "funciona en cualquier maquina".

-----

## 🧠 Lo que aprendí

Hoy principalmente aprendi:

* **Fundamentos de Vagrant:** Qué es Vagrant y cómo se integra con proveedores de virtualización como VirtualBox.
* **Ciclo de Vida de una VM con Vagrant:** Comandos esenciales para trabajar con Vagrant:
  * `vagrant init`: Para crear un nuevo Vagrantfile.
  * `vagrant up`: Para levantar la VM y ejecutar el provisionamiento.
  * `vagrant ssh`: Para conectarme fácilmente a la VM sin configurar SSH manualmente.
  * `vagrant halt`: Para apagar la VM de forma segura.
  * `vagrant destroy`: Para eliminar completamente la VM y liberar recursos.
* **Provisionamiento con Shell:** Automatizar la configuración inicial de una VM utilizando scripts de shell. Permite instalar software, configurar servicios y desplegar aplicaciones automáticamente cada vez que se levanta una VM.
* **Buenas Prácticas:** La importancia de usar IPs privadas para acceder a servicios dentro de la VM desde el navegador del host, y la conveniencia de separar los scripts de provisionamiento en directorios dedicados (scripts/) para mantener el Vagrantfile limpio y modular.

-----

## ⚙️ Ejercicios realizados

### ✅ Ejercicio 1: Mi Primer `Vagrantfile`

Este ejercicio es el "hola mundo " que me permitio ver la sintaxis basica del `Vagrantfile` y el concepto de provisionamiento `inline`.

* *Ruta al proyecto:* [`primer-vagrantfile`](/challenges/week01/day03/hellow-world/)

```ruby
Vagrant.configure("2") do |config|
  # Usa una imagen ligera de Ubuntu 22.04
  config.vm.box = "ubuntu/jammy64"
  
  # Configuración de red (accesible via IP)
  config.vm.network "private_network", ip: "192.168.33.10"
  
  # Provisionamiento con Shell
  config.vm.provision "shell", inline: <<-SHELL
    echo "¡Hola desde el provisionamiento!" > /tmp/hola.txt
    apt update && apt install -y nginx
    systemctl start nginx
  SHELL
end
```
* Inicia la VM y ejecuta el Shell provisioner `vagrant up` 
* Accede a la VM `vagrant ssh` 
* Verifica el archivo creado `cat /tmp/hola.txt`
* Verificar estado de nginx `systemctl status nginx`

* *Captura de terminal:
![Primer Vagrantfile](/assets/day-03/terminal_ssh_vagrant.png "Primer Vagranfile")*

### ✅ Ejercicio 2: Servidor Web Nginx Personalizado
Este fue el reto del dia, donde:

* Crear una VM e instalar Nginx.
* Personalizá el mensaje del index.html con tu nombre y fecha
* Acceder via browser en http://192.168.33.20.

```ruby
Vagrant.configure("2") do |config|
  # Usa una imagen ligera de Ubuntu 22.04
  config.vm.box = "ubuntu/jammy64"
  
  # Configuración de red (accesible via IP)
  config.vm.network "private_network", ip: "192.168.33.20"
  
  # Provisionamiento utilizando un script de shell externo para mayor organización
  config.vm.provision "shell", path: "scripts/instalar_nginx.sh"
end
```

```bash
#!/bin/bash

echo "Iniciando script de provisionamiento..."

# Actualizar paquetes e instalar Nginx
sudo apt update -y
sudo apt install -y nginx

# Asegurar que Nginx esté iniciado y habilitado al arranque
sudo systemctl start nginx
sudo systemctl enable nginx

# Un archivo en /var/www/html/index.html con tu nombre y fecha
NOMBRE="PEPE"
FECHA_ACTUAL=$(date +"%d/%m/%Y %H:%M:%S") # Formato Día/Mes/Año Hora:Minuto:Segundo

# Archivo HTML
sudo bash -c "cat > /var/www/html/index.html <<EOF
... codigo HTML ...
EOF"

echo "Provisionamiento completado."
```

* *Captura de terminal:
![Personalizando Vagrantfile](/assets/day-03/vagrant_nginx.png "Personalizando Vagranfile")*

-----

## 📎 Recursos

* 🧠 [Artículo del reto Día 3](https://90daysdevops.295devops.com/semana-01/dia3)
* 📄 [Vagrant Cloud - Official Boxes](https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&q=official)

-----