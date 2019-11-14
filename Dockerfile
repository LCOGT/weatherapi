# Builder Container
FROM golang:1.13-alpine as builder

WORKDIR /go/src/weather

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o weather-server .

# Production container
FROM scratch
EXPOSE 8080
WORKDIR /app
COPY --from=builder /go/src/weather/*.json /app/
COPY --from=builder /go/src/weather/weather-server /app/
CMD [ "/app/weather-server" ]
