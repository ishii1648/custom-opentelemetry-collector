FROM golang:1.20.10-bullseye as builder

WORKDIR /app

RUN go install go.opentelemetry.io/collector/cmd/builder@v0.87.0

COPY manifest.yml .

RUN CGO_ENABLED=0 builder --config=manifest.yml

FROM gcr.io/distroless/static-debian12

COPY --from=builder --chown=nonroot:nonroot /app/dist/otelcol /otelcol
COPY config.yml /etc/otelcol/config.yml

USER nonroot

ENTRYPOINT ["/otelcol"]
CMD ["--config", "/etc/otelcol/config.yml"]
EXPOSE 4317
