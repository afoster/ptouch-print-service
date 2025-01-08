# Build ptouch-print
FROM debian:bookworm-slim AS maker
WORKDIR /src
RUN apt-get update && apt-get install -y git cmake gettext libgettextpo-dev libgd-dev libusb-1.0-0-dev
RUN git clone https://git.familie-radermacher.ch/linux/ptouch-print.git
WORKDIR /src/ptouch-print
RUN ./build.sh

# Build ptouch-print-service
FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o ptouch-print-service .

# Final image
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=maker /src/ptouch-print/build/ptouch-print /usr/local/bin/ptouch-print
COPY --from=builder /app/ptouch-print-service ./
EXPOSE 8080
CMD ["./ptouch-print-service"]
