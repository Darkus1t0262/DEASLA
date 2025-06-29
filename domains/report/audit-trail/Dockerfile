# Build Stage
FROM rustlang/rust:nightly AS builder

WORKDIR /app
COPY . .

RUN cargo build --release

# Runtime Stage
FROM debian:bookworm-slim AS runtime

# Install libraries for PostgreSQL and OpenSSL
RUN apt-get update && apt-get install -y \
    libpq5 \
    libssl3 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/target/release/audit-trail .

EXPOSE 4201
CMD ["./audit-trail"]
