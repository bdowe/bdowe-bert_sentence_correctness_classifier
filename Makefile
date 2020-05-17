help:
	@cat Makefile

IMAGE_NAME=pytorch
IMAGE_TAG=bert_sentence_correctness
DATA?=`pwd`
DOCKER=docker
ifdef GPU
	DOCKER=nvidia-docker
endif

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

bash: build
	$(DOCKER) run -it -ti --net=host --ipc=host -v $(DATA):/data -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix --env="QT_X11_NO_MITSHM=1" $(IMAGE_NAME):$(IMAGE_TAG) bash

notebook: build
	$(DOCKER) run -it -v $(DATA):/data -p 8888:8888 --net=host --ipc=host $(IMAGE_NAME):$(IMAGE_TAG)