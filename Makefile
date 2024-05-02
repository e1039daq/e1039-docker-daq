build:
	docker build -t slbuild:7 -f buildenv.dockerfile .
	docker run --mount type=bind,source=/data4/dockerDAQ/assets/beam/BeamDAQ,target=/build slbuild:7 
	docker compose build --no-cache
run: build
	./run.sh