dockerfile-lint:
	@find . -type f -name "*.base" -o -name "*.standalone" -exec ./hadolint --ignore DL3006 {} \;

terraform-fmt:
	@find . -type f -name "*.tf" -exec terraform fmt {} \;

tests-docker:
	@./tests/docker.sh
