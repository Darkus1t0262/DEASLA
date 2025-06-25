# Base image
FROM node:18

# Working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source
COPY . .

# Expose API port
EXPOSE 3003

# Start command
CMD ["npm", "start"]
