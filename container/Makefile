all: build run

.PHONY: run build

clean:
	- docker stop nagdash
	- docker rmi nagdash
	#- rm -rf Nagdash

build:
	- git clone https://github.com/luiz1361/Nagdash.git
	docker build -t nagdash .

shell:
	# build the environment, and open a shell
	docker run -it --name nagdash --rm \
		-p 81:80 \
		nagdash \
		/bin/bash

run:
	docker run -it --name nagdash --rm \
		-p 81:80 \
		nagdash
