### builder
FROM golang:alpine AS builder

RUN go install github.com/farsightsec/dnstap-sensor@latest

### runtime
FROM alpine:latest
WORKDIR /app

# get compiled binary
COPY --from=builder /go/bin/dnstap-sensor .

# setup entrypoint
COPY docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]


