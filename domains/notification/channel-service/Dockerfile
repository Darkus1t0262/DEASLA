FROM golang:1.22-alpine AS build
WORKDIR /app

# Copy go.mod first and download dependencies
COPY go.mod ./
RUN go mod tidy

# Now copy the rest of the source code
COPY . .

RUN go build -o channel-service ./cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/channel-service .
EXPOSE 4102
ENTRYPOINT ["./channel-service"]
