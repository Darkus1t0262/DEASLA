FROM rustlang/rust:nightly as builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:buster-slim
WORKDIR /app
COPY --from=builder /app/target/release/stat-analyzer .
EXPOSE 4205
CMD ["./stat-analyzer"]
