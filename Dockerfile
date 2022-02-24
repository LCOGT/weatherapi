# Builder Container
FROM golang:1.13-alpine as builder

WORKDIR /go/src/weather

# This will download all certificates (ca-certificates) and builds it in a
# single file under /etc/ssl/certs/ca-certificates.crt (update-ca-certificates)
RUN apk --update add --no-cache ca-certificates openssl && update-ca-certificates

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o weather-server .

# Production container
FROM scratch
EXPOSE 8080
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
WORKDIR /app
COPY --from=builder /go/src/weather/*.json /app/
COPY --from=builder /go/src/weather/weather-server /app/
CMD [ "/app/weather-server" ]
