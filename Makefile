build:
	mkdir -p {beam,scaler}/assets
	cp -r -u /data4/dockerDAQ/assets/scaler/ scaler/assets
	cp -r -u /data4/dockerDAQ/assets/beam/ beam/assets
	docker build -t slbuild:7 -f buildenv.dockerfile .
	docker run --mount type=bind,source="$$(pwd)"/beam/assets/BeamDAQ,target=/build slbuild:7 
	docker compose build --no-cache
run: build
	./run.sh