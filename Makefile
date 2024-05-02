build:
	docker build -t slbuild:7 -f buildenv.dockerfile .
	# docker pull ngpaladi/slbuild:7
	docker run --mount type=bind,source="$$(pwd)"/beam/assets/BeamDAQ,target=/build slbuild:7 
	docker compose build --no-cache
run: build
	./run.sh