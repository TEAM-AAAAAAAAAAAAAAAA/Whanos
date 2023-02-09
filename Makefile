dockerfile-lint:
	@find . -type f -name "*.base" -o -name "*.standalone" -exec hadolint --ignore DL3006 {} \;

terraform-fmt:
	@find . -type f -name "*.tf" -exec terraform fmt {} \;

build-all: \
	build-whanos-befunge \
	build-whanos-c \
	build-whanos-golang \
	build-whanos-java \
	build-whanos-javascript \
	build-whanos-python

build-whanos-befunge build-whanos-c build-whanos-golang build-whanos-java build-whanos-javascript build-whanos-python:
	@$(eval lang=$(subst build-whanos-,,$@))
	@$(eval image=$(subst build-,,$@))
	docker build -t $(image) - < jenkins/images/$(lang)/Dockerfile.base

scan-whanos-befunge scan-whanos-c scan-whanos-golang scan-whanos-java scan-whanos-javascript scan-whanos-python:
	@$(eval lang=$(subst scan-whanos-,,$@))
	@$(eval image=$(subst scan-,,$@))
	docker scan --json --accept-license $(image) > $(image)-scan.json
