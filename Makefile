# Variables
BAD_IMAGE=fastapi-bad
GOOD_IMAGE=fastapi-good

# Builds the unoptimized image
build-bad:
	docker build -f Dockerfile.bad -t $(BAD_IMAGE) .

# Builds the optimized image
build-good:
	docker build -f Dockerfile.good -t $(GOOD_IMAGE) .

# Displays the sizes of both images (cross-platform) with formatted table
compare-sizes:
	@echo ""
	@echo "╔════════════════════════════════════════════════════════════╗"
	@echo "║           DOCKER IMAGES SIZE COMPARISON                     ║"
	@echo "╚════════════════════════════════════════════════════════════╝"
	@echo ""
	@echo "┌─────────────────────┬──────────────────┬──────────────────┐"
	@echo "│ Image               │ Size             │ Status           │"
	@echo "├─────────────────────┼──────────────────┼──────────────────┤"
	@if docker images $(BAD_IMAGE) --format "{{.Size}}" 2>/dev/null | grep -q .; then \
		BAD_SIZE=$$(docker images $(BAD_IMAGE) --format "{{.Size}}" | head -1); \
		echo "│ Dockerfile.bad      │ $$(printf '%-16s' $$BAD_SIZE) │ ❌ Not optimized │"; \
	else \
		echo "│ Dockerfile.bad      │ Not built        │ -                │"; \
	fi
	@if docker images $(GOOD_IMAGE) --format "{{.Size}}" 2>/dev/null | grep -q .; then \
		GOOD_SIZE=$$(docker images $(GOOD_IMAGE) --format "{{.Size}}" | head -1); \
		echo "│ Dockerfile.good     │ $$(printf '%-16s' $$GOOD_SIZE) │ ✅ Optimized     │"; \
	else \
		echo "│ Dockerfile.good     │ Not built        │ -                │"; \
	fi
	@echo "└─────────────────────┴──────────────────┴──────────────────┘"
	@echo ""
	@echo "💡 Tip: Visit http://localhost:8000/comparison to see detailed analysis"
	@echo ""

# Runs both build tasks and compares image sizes
compare:
	$(MAKE) build-bad
	$(MAKE) build-good
	$(MAKE) compare-sizes

# Removes the created images
clean:
	-docker rmi -f $(BAD_IMAGE) $(GOOD_IMAGE)
