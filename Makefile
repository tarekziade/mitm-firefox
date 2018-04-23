

build:
	docker build -t tarek/firefox-proxy:latest .

run:
	docker run \
		-i -t \
		-p 5800:5800 \
		-v ${PWD}/appdata:/config:rw \
		--shm-size 2g \
		--rm \
		tarek/firefox-proxy 
