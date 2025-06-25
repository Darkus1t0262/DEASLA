FROM golang:1.22-alpine AS build
WORKDIR /app
COPY . .
RUN go mod init notification && go mod tidy
RUN go build -o broadcast-service ./cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/broadcast-service .
EXPOSE 4101
ENTRYPOINT ["./broadcast-service"]
