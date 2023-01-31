build:
	./prebuild.sh
	sudo docker build -t slbuilder:latest -f buildenv.dockerfile .
	sudo docker run --mount type=bind,source="$$(pwd)"/beam/assets/BeamDAQ,target=/build slbuilder:latest 
	sudo docker compose build --no-cache
run: build
	./run.sh