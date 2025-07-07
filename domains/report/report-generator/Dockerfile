FROM rustlang/rust:nightly AS builder

WORKDIR /app
COPY . .

ARG DATABASE_URL
ENV DATABASE_URL=${DATABASE_URL}

RUN cargo build --release

FROM debian:bookworm-slim AS runtime

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libssl3 \
 && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/target/release/report-generator .

EXPOSE 4204

CMD ["./report-generator"]
