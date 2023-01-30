build:
	mkdir -p localstorage
	-sudo mount -o bind /localstorage localstorage/
	for container in beam scaler; do \
		mkdir -p $$container/assets $$container/localstorage; \
		sudo mount -o bind /localstorage $$container/localstorage/; \
		sed "s=XAUTHKEY=$$(xauth list | head -n 1)=" $$container/templates/entrypoint.sh > $$container/assets/entrypoint.sh ; \
	done
	sudo docker compose build --no-cache
run: build
	./run