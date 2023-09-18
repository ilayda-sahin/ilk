# Resmi Node.js imajını temel al
FROM node:14

# Uygulamanızın çalışacağı dizini oluştur
WORKDIR /app

# Uygulamanızın bağımlılıklarını kopyala ve kur
COPY package*.json ./
RUN npm install

# Uygulamanızın kodunu kopyala
COPY . .

# Uygulamanızı çalıştır
CMD ["node", "server.js"]
