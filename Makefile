# Variables
BAD_IMAGE=fastapi-bad
GOOD_IMAGE=fastapi-good

# Builds the unoptimized image
build-bad:
	docker build -f Dockerfile.bad -t $(BAD_IMAGE) .

# Builds the optimized image
build-good:
	docker build -f Dockerfile.good -t $(GOOD_IMAGE) .

# Displays the sizes of both images (cross-platform)
compare-sizes:
	@echo Image sizes:
	@docker images --format "table {{.Repository}}\t{{.Size}}" | \
		( grep fastapi || findstr fastapi )

# Runs both build tasks and compares image sizes
compare:
	$(MAKE) build-bad
	$(MAKE) build-good
	$(MAKE) compare-sizes

# Removes the created images
clean:
	-docker rmi -f $(BAD_IMAGE) $(GOOD_IMAGE)
