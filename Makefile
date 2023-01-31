build:
	./prebuild.sh
	# sudo docker build -t slbuild:7 -f buildenv.dockerfile .
	sudo docker pull ngpaladi/slbuild
	sudo docker run --mount type=bind,source="$$(pwd)"/beam/assets/BeamDAQ,target=/build ngpaladi/slbuild:7 
	sudo docker compose build --no-cache
run: build
	./run.sh