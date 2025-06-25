FROM golang:1.22-alpine AS build
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o notification-core ./cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/notification-core .
EXPOSE 4103
ENTRYPOINT ["./notification-core"]
