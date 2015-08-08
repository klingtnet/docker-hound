#!/bin/sh
HTTP_PORT=${1:-8080}
docker run --name hound -p ${HTTP_PORT}:6080 --volumes-from hound-data -it hound
