DOCKER_IMAGE=andreclaudino/jupyterlab
DOCKER_TAG=1.0.2

docker/image-py3.10:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG)-py3.10 docker/ -f docker/Dockerfile --build-arg BASE_IMAGE=python:3.10-slim-buster
	touch docker/image-py3.10

docker/image-py3.8:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG)-py3.8 docker/ -f docker/Dockerfile --build-arg BASE_IMAGE=python:3.8-slim-buster
	touch docker/image-py3.8

docker/push-py3.10: docker/image-py3.10
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)-py3.10
	touch docker/push-py3.10

docker/push-py3.8: docker/image-py3.8
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)-py3.8
	touch docker/push-py3.8

docker/push-py$(PYTHON_VERSION): docker/image-py$(PYTHON_VERSION)
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)-py$(PYTHON_VERSION)
	touch docker/push-py$(PYTHON_VERSION)


docker/run: docker/image-py$(PYTHON_VERSION)
	docker run -p 8888:8888 -it $(DOCKER_IMAGE):$(DOCKER_TAG)

docker/images: docker/image-py3.10 docker/image-py3.8

docker/push-all: docker/push-py3.10 docker/push-py3.8

clean:
	rm -rf docker/image*
	rm -rf docker/push*
	rm -rf docker/images
	rm -rf docker/push-all
