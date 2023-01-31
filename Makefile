build:
	./prebuild.sh
	sudo docker compose build --no-cache
run: build
	./run.sh