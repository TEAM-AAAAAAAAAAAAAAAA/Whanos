all:
	cd ansible && ansible-playbook -i inventory playbook.yml -u deploy --key-file ../whanos_deployment -vvv

ansible-lint:
	@find ansible -type f -name "*.yml" -exec ansible-lint {} \;

dockerfile-lint:
	@find images -type f -name "*.base" -o -name "*.standalone" -exec ./hadolint --ignore DL3006 {} \;

helm-lint:
	@helm lint kubernetes

terraform-fmt:
	@find terraform -type f -name "*.tf" -exec terraform fmt {} \;

tests-docker:
	@./tests/docker.sh
