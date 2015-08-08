.PHONY: all

IMAGE_NAME='hound'

all: build

build:
	docker build -t $(IMAGE_NAME) .

backup:
	docker run --volumes-from $(IMAGE_NAME)-data -v $(shell pwd):/backup alpine tar cvzf /backup/backup.tar.gz /var/hound/data

data:
	docker create \
	--name $(IMAGE_NAME)-data \
	--volume /var/hound/data \
	alpine \
	/usr/bin/nologin
