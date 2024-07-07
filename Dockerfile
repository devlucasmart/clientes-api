# Use a imagem oficial do Node.js 18 como base
FROM node:18

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o package.json e o package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie o restante do código do aplicativo para o diretório de trabalho
COPY . .

# Expor a porta 3333 (ou qualquer porta que seu servidor esteja escutando)
EXPOSE 3333

# Comando para iniciar o aplicativo em modo de desenvolvimento
CMD ["npm", "run", "dev"]
