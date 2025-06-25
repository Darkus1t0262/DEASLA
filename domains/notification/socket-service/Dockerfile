FROM golang:1.22-alpine AS build
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o socket-service ./cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/socket-service .
EXPOSE 4105
ENTRYPOINT ["./socket-service"]
