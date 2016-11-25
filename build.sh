#!/bin/bash

set -e
base_dir=$(realpath $(dirname $0)) 


docker build -t webcam .

tag=dev

if [[ $1 != '' ]]; then

tag=$1

fi

docker tag webcam hub.srv.webeye.services:5000/webeye/webcam
docker tag webcam hub.srv.webeye.services:5000/webeye/webcam:$tag


if [[ $tag != 'dev' ]]; then
 docker push hub.srv.webeye.services:5000/webeye/webcam
 docker push hub.srv.webeye.services:5000/webeye/webcam:$tag
fi


docker build -t beat beat/
docker tag beat hub.srv.webeye.services:5000/webeye/webcam-beat
if [[ $tag != 'dev' ]]; then
 docker tag beat hub.srv.webeye.services:5000/webeye/webcam-beat:$tag
 docker push hub.srv.webeye.services:5000/webeye/webcam-beat
 docker push hub.srv.webeye.services:5000/webeye/webcam-beat:$tag
fi


docker build -t work work/
docker tag work hub.srv.webeye.services:5000/webeye/webcam-worker
if [[ $tag != 'dev' ]]; then
 docker tag work hub.srv.webeye.services:5000/webeye/webcam-worker:$tag
 docker push hub.removed srv.webeye.services:5000/webeye/webcam-worker
 docker push hub.srv.webeye.services:5000/webeye/webcam-worker:$tag
fi

docker build -t serial serial/
docker tag serial hub.srv.webeye.services:5000/webeye/webcam-serial
if [[ $tag != 'dev' ]]; then
 docker tag serial hub.srv.webeye.services:5000/webeye/webcam-serial:$tag
 docker push hub.srv.webeye.services:5000/webeye/webcam-serial
 docker push hub.srv.webeye.services:5000/webeye/webcam-serial:$tag
fi



