#!/bin/bash

echo "Iniciando script de provisionamiento..."

# Actualizar paquetes e instalar Nginx
echo "Actualizando paquetes e instalando Nginx..."
sudo apt update -y
sudo apt install -y nginx

# Asegurar que Nginx esté iniciado y habilitado al arranque
echo "Asegurando que Nginx esté iniciado y habilitado..."
sudo systemctl start nginx
sudo systemctl enable nginx

# Un archivo en /var/www/html/index.html con tu nombre y fecha
NOMBRE="PEPE"
FECHA_ACTUAL=$(date +"%d/%m/%Y %H:%M:%S") # Formato Día/Mes/Año Hora:Minuto:Segundo

# Archivo HTML
echo "Creando /var/www/html/index.html..."
sudo bash -c "cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Servidor Nginx</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 2em;
      background-color: #f0f0f0;
      color: #333;
    }
    h1 {
      color: #0e639c;
    }
    .footer {
      font-size: 0.9em;
      color: #777;
      margin-top: 2em;
    }
  </style>
</head>
<body>
  <h1>Este es mi servidor Nginx</h1>
  <p>Desplegado por: <strong>$NOMBRE</strong></p>
  <p class="footer">Fecha del despliegue: $FECHA_ACTUAL</p>
  <p>Reto 90 Days DevOps en acción!</p>
</body>
</html>
EOF"

echo "Provisionamiento completado."