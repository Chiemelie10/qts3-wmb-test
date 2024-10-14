
export ROOT_DIR=${PWD}
export IMAGE=quickstatements3:dev

VERSION ?= $(shell date +"%Y%m%d_%H%M")


build:
	sudo docker build -t ${IMAGE} -f Dockerfile .


shell: 
	sudo docker run --rm -ti --env-file etc/env -p 8765:80 -p 8000:8000 -v ${ROOT_DIR}/src:/home/wmb/www/src ${IMAGE} bash

run: 
	sudo docker run --rm -ti --env-file etc/env -p 8765:80 -p 8000:8000 -v ${ROOT_DIR}/src:/home/wmb/www/src ${IMAGE} /home/wmb/www/cmd_run.sh
