build:
	mkdir -p {beam,scaler,build}/assets
	rsync -a --info=progress2 /data4/dockerDAQ/assets/scaler/ scaler/assets
	rsync -a --info=progress2  /data4/dockerDAQ/assets/beam/ beam/assets
	# rsync -a --info=progress2 /data4/dockerDAQ/assets/build/ build/assets
	docker build -t slbuild:7 build/
	docker run --mount type=bind,source=${PWD}/beam/assets/BeamDAQ,target=/build slbuild:7 
	docker compose build 

run: build
	docker compose up

update-data4-assets:
	rsync -a --info=progress2 scaler/assets/ /data4/dockerDAQ/assets/scaler
	rsync -a --info=progress2 beam/assets/ /data4/dockerDAQ/assets/beam
	# rsync -a --info=progress2 build/assets/ /data4/dockerDAQ/assets/build

