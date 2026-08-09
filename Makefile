.PHONY: init plan apply pack

init:
	cd terraform && terraform init

plan:
	cd terraform && terraform plan -var-file=devl.tfvars

apply:
	cd terraform && terraform apply -var-file=devl.tfvars -auto-approve

pack:
	bash scripts/pack_lambda.sh
