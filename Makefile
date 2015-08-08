.PHONY: all

IMAGE_NAME='hound'

all: build

build:
	docker build -t $(IMAGE_NAME) .

data:
	docker create \
	--name $(IMAGE_NAME)-data \
	--volume /var/hound/data \
	alpine \
	/usr/bin/nologin
