build: beam scaler

build-container:
	mkdir -p build/assets
	rsync -a --info=progress2 /data4/dockerDAQ/assets/build/ build/assets
	docker build -t slbuild:7 build/

scalerdaq:
	mkdir -p scaler/assets
	rsync -a --info=progress2 /data4/dockerDAQ/assets/scaler/ scaler/assets
	docker compose build scalerdaq

beamdaq: build-container
	mkdir -p beam/assets
	rsync -a --info=progress2  /data4/dockerDAQ/assets/beam/ beam/assets
	docker run --mount type=bind,source=${PWD}/beam/assets/BeamDAQ,target=/build slbuild:7 
	docker compose build beamdaq

beam: beamdaq

scaler: scalerdaq

run: build
	docker compose up

update-data4-assets:
	rsync -a --info=progress2 scaler/assets/ /data4/dockerDAQ/assets/scaler
	rsync -a --info=progress2 beam/assets/ /data4/dockerDAQ/assets/beam
	# rsync -a --info=progress2 build/assets/ /data4/dockerDAQ/assets/build

