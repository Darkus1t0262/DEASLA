FROM golang:1.22-alpine AS build
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o retry-engine ./cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/retry-engine .
EXPOSE 4104
ENTRYPOINT ["./retry-engine"]
