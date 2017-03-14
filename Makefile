Dockerfile: Dockerfile.in ./include/*.docker
	cpp -P -o Dockerfile Dockerfile.in

update:
	git pull origin master
	git submodule update --init --recursive
	git submodule foreach git pull origin master
	cd ./9zilla/ && git submodule foreach git pull origin master && cd ../
	cp ./9zilla/Dockerfile.in.volume-anyenv ./Dockerfile.in

build: Dockerfile
	docker build --no-cache -t 9zilla-volume-anyenv:latest .
