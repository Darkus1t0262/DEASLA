FROM rustlang/rust:nightly AS builder
WORKDIR /app
COPY . .

RUN cargo build --release

FROM debian:bookworm-slim AS runtime
WORKDIR /app

RUN apt-get update && apt-get install -y \
    libssl3 \
 && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/target/release/stat-analyzer .

EXPOSE 4205
CMD ["./stat-analyzer"]
