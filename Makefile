# The shell we use

# The shell we use
SHELL := /bin/bash

# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
help: ## This help message
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

test: ## Show a test message
	@echo "$(GREEN)==> Installing dependencies$(RESET)"

pull: ## Get/Update needed docker container
	@echo "$(GREEN)==> Getting mr.docs ....$(RESET)"
	docker pull quay.io/tiramisu/mr.docs
	@echo "$(GREEN)==> Getting mr.alex ....$(RESET)"
	docker pull quay.io/tiramisu/mr.alex
	@echo "$(GREEN)==> Getting mr.ansible ....$(RESET)"
	docker pull quay.io/tiramisu/mr.ansible

image: ## building the image
	make -C builder/packer/ build

setup:  ## Run all setup steps at once
	@echo ""
	@echo "$(YELLOW)Please source the functions from the *func* directory!$(RESET)"

docs-prod: ## Building prod version of the docs [docs ready for release]
	@echo ""
	@echo "$(GREEN)==> Building prod. version of the docs ....$(RESET)"
	bash ./bin/docs_deploy.sh

spellcheck: ## Running locally spell-check against the docs
	@echo ""
	@echo "$(GREEN)==> Running spell-check against the docs ....$(RESET)"
	bash ./tests/spellcheck.sh

linkcheck: ## Running locally link-check against the docs
	@echo ""
	@echo "$(GREEN)==> Running link-check against the docs ....$(RESET)"
	bash ./tests/linkcheck.sh

html-test: ## Build a html testing version of the docs
	@echo ""
	@echo "$(GREEN)==> Running link-check against the docs ....$(RESET)"
	bash ./tests/html-test.sh

docs-test: ## Building test version of the docs [testing version of docs]
