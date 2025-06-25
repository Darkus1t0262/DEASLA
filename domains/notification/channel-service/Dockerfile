FROM golang:1.22-alpine AS build
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o channel-service ./cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/channel-service .
EXPOSE 4102
ENTRYPOINT ["./channel-service"]
