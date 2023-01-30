build:
	-ln -s /localstorage
	for container in beam scaler; do \
		mkdir -p $$container/assets ; \
		sed "s=XAUTHKEY=$$(xauth list | head -n 1)=" $$container/templates/entrypoint.sh > $$container/assets/entrypoint.sh ; \
	done
	sudo docker compose build --no-cache
run: build
	sudo docker compose up