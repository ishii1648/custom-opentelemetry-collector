# custom-opentelemetry-collector

## How to build & run container

First of all, craete service account on Google Cloud Project, then download service account key to `$HOME/Downloads/sa.json`

```console
docker build -t custom-opentelemetry-collector:latest .
docker run \
	-e GOOGLE_APPLICATION_CREDENTIALS=/tmp/sa.json \
	-v $HOME/Downloads/sa.json:/tmp/sa.json \
	custom-opentelemetry-collector:latest
```
