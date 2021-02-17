.DEFAULT_GOAL := default

.PHONY: default
default: build

.PHONY: update
update:
	go get -u ./...
	go mod tidy -v

.PHONY: cleancode
cleancode:
	go fmt ./...
	go vet ./...

.PHONY: build
build: cleancode
	go build

.PHONY: lint
lint:
	docker pull golangci/golangci-lint:latest
	docker run --rm -v $$(pwd):/app -w /app golangci/golangci-lint:latest golangci-lint run

.PHONY: test
test:
	go test ./...
