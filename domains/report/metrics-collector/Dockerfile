FROM rust:1.67
WORKDIR /usr/src/app
COPY . .
RUN cargo build --release
CMD ["./target/release/main"]
