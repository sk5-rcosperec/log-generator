TAG = v0.2
PREFIX = ghcr.io/sk5-rcosperec/



build-amd64:
	export GOARCH=amd64
	go build .

build-arm64:
	export GOARCH=arm64
	go build .

build-and-push-amd64: build-amd64
	docker buildx build --platform linux/amd64 --build-arg DOCKERIMAGE=golang:1.20 -t $(PREFIX)log-generator:latest -t $(PREFIX)log-generator:$(TAG) . --push

build-and-push-arm64: build-arm64
	docker buildx build --platform linux/arm64 --build-arg DOCKERIMAGE=arm64v8/golang -t $(PREFIX)log-generator:latest -t $(PREFIX)log-generator:$(TAG) . --push
