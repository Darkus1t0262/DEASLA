FROM node:20
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
COPY .env .env
# Start the app (adjust if your entry file is src/app.js)
CMD ["node", "src/app.js"]