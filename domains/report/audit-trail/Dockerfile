# --- Build Stage ---
FROM rustlang/rust:nightly AS builder

WORKDIR /app
COPY . .

# Build the release binary
RUN cargo build --release

# --- Runtime Stage ---
FROM debian:buster-slim

# Install required shared libs (for SQLx PostgreSQL)
RUN apt-get update && apt-get install -y \
    libpq5 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy only the final binary from builder stage
COPY --from=builder /app/target/release/audit-trail .

# Optional: if you use dotenv at runtime
# COPY .env .env

# Expose the service port
EXPOSE 4201

# Run the app
CMD ["./audit-trail"]
