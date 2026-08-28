build: ## Build the project
	swift build

run: build ## Build and run the project
	swift run

clean: ## Remove build artifacts
	swift package clean

help: ## Show this help
	@grep -E '^[a-zA-Z0-9_-]+:.*##' $(MAKEFILE_LIST) | sort | \
		awk -F ':.*## ' '{printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'

.PHONY: build run clean help
.DEFAULT_GOAL := help
