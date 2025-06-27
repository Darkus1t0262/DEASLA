# syntax=docker/dockerfile:1

FROM rustlang/rust:nightly AS builder

WORKDIR /app
COPY . .

# --- Inject the DATABASE_URL for SQLx macros ---
ARG DATABASE_URL
ENV DATABASE_URL=${DATABASE_URL}

RUN cargo build --release

FROM debian:buster-slim

WORKDIR /app
COPY --from=builder /app/target/release/report-generator .

EXPOSE 4204

CMD ["./report-generator"]
