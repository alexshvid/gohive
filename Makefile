VERSION := $(shell git describe --tags --always --dirty)

all: build

version:
	@echo $(VERSION)

thrift:
	rm -rf vendor/shared vendor/tutorial
	thrift -version || true # thrift -version needs to be 1.0.0-dev !
	thrift --gen go -out . -r -I idl thrift/HiveServer.thrift

build:
	go test -cover ./...
	go build  -v







