.ONESHELL:

all: deploy-terraform deploy-ansible

deploy-terraform:
	@cd terraform
	@export GOOGLE_APPLICATION_CREDENTIALS=../whanos_gcp_creds.json
	@terraform init
	@terraform plan
	@terraform apply -auto-approve

deploy-ansible:
	@cd ansible
	@ansible-playbook -i inventory roles/jenkins.yml -u deploy --key-file ../whanos_deployment -vvv

ansible-lint:
	@ansible-lint ansible

dockerfile-lint:
	@find images -type f -name "*.base" -o -name "*.standalone" -exec hadolint --ignore DL3006 {} \;

helm-lint:
	@helm lint kubernetes

terraform-fmt:
	@find terraform -type f -name "*.tf" -exec terraform fmt {} \;
