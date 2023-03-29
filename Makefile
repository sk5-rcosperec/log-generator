TAG = v0.30
PREFIX = ghcr.io/sk5-rcosperec/

build-local:
	export GOARCH=amd64
	go build -o linux/amd64/log-generator .
	docker build --platform linux/amd64 -t log-generator:${TAG} .

build-amd64:
	export GOARCH=amd64
	go build -o linux/amd64/log-generator . 

build-arm64:
	export GOARCH=arm64
	go build -o linux/arm64/v8/log-generator .

build-and-push-amd64: build-amd64
	docker buildx build --platform linux/amd64 -t $(PREFIX)log-generator:latest-amd64 -t $(PREFIX)log-generator:$(TAG) . --push

build-and-push-arm64: build-arm64
	docker buildx build --no-cache --platform linux/arm64/v8 -t $(PREFIX)log-generator:latest -t $(PREFIX)log-generator:$(TAG) . --push

build-all: build-amd64 build-arm64
	docker buildx build --no-cache --platform linux/arm64/v8,linux/amd64 -t $(PREFIX)log-generator:latest -t $(PREFIX)log-generator:$(TAG) . --push