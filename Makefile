
clean: ## clean all the things
	echo implement clean makefile rule

work: ## open all files in editor
	emacs -nw *.v

# cloud rules ------------------------------------------------------------------

# cloud rules are only relevent in the context of the hosting cloud
# platform, don't use these on your dev machine.

cloud.pull: ## pull the current main version of this repo
	git pull

cloud.apply: ## apply kubernetes config files
	kubectl apply -f service.yaml
	kubectl apply -f deployment.yaml

cloud.test: ## cloud testing
	@echo how to test?


# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[\\.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk \
	'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

FORCE:

