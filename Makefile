.PHONY: all

IMAGE_NAME='hound'

all: build

build:
	docker build -t $(IMAGE_NAME) .
