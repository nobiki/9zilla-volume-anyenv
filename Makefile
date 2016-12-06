Dockerfile: Dockerfile.in ./include/*.docker
	cpp -P -o Dockerfile Dockerfile.in

build: Dockerfile
	docker build --no-cache -t 9zilla-volume-anyenv:latest .
