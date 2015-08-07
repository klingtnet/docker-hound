.PHONY: all

IMAGE_NAME='etsy-hound'

all: build

build:
	docker build -t $(IMAGE_NAME) .
