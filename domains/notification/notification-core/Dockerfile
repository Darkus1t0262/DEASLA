FROM golang:1.22-alpine AS build
WORKDIR /app

COPY go.mod ./
RUN go mod tidy

COPY . .

RUN go build -o notification-core ./cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/notification-core .
EXPOSE 4103
ENTRYPOINT ["./notification-core"]
