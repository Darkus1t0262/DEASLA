# --- Builder Stage ---
FROM node:20-slim AS builder
WORKDIR /app

# Install only what’s needed first for cache optimization
COPY package*.json ./
RUN npm install --omit=dev

# Copy app source code
COPY ./src ./src
COPY .env .env

# --- Final Lightweight Image ---
FROM node:20-alpine AS production
WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src
COPY --from=builder /app/.env .env
COPY package*.json ./

# Start the app
CMD ["node", "src/app.js"]
EXPOSE 3002
