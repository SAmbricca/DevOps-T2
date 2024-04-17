# Usa una imagen base de Node.js versión 14-alpine
FROM node:14-alpine

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia solo los archivos necesarios para instalar las dependencias
COPY package.json package-lock.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos necesarios para la aplicación
COPY . .

# Expone el puerto 3000
EXPOSE 3000

# Comando por defecto para ejecutar la aplicación
CMD ["node", "app.js"]
