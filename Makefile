# Variables
BAD_IMAGE=fastapi-bad
GOOD_IMAGE=fastapi-good

# Construye la imagen no optimizada
build-bad:
	docker build -f Dockerfile.bad -t $(BAD_IMAGE) .

# Construye la imagen optimizada
build-good:
	docker build -f Dockerfile.good -t $(GOOD_IMAGE) .

# Muestra los tamaños de las dos imágenes
compare-sizes:
	@echo "\n🔍 Tamaños de imágenes:"
	@docker images | grep fastapi

# Ejecuta ambas tareas de build y compara tamaños
compare:
	make build-bad
	make build-good
	make compare-sizes

# Elimina las imágenes creadas
clean:
	docker rmi -f $(BAD_IMAGE) $(GOOD_IMAGE) || true
