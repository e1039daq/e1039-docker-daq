build:
	mkdir -p {beam,scaler}/assets
	cp -r -u /data4/dockerDAQ/assets/scaler/* scaler/assets
	cp -r -u /data4/dockerDAQ/assets/beam/* beam/assets
	docker build -t slbuild:7 -f buildenv.dockerfile .
	docker run --mount type=bind,source=${PWD}/beam/assets/BeamDAQ,target=/build slbuild:7 
	docker compose build 
run: build
	./run.sh

update-assets:
	rsync -a --info=progress2 scaler/assets/ /data4/dockerDAQ/assets/scaler
	rsync -a --info=progress2 beam/assets/ /data4/dockerDAQ/assets/beam