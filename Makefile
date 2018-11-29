PLATFORM := 'vmware'
ENV := 'k8s-kubespray'
#ENV := $(shell jq -r k8s_node_prefix terraform/$(PLATFORM)/terraform.tfvars)
TIMEOUT := 30s


all: help
	
help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

plan-init: ## Applies Terraform init and plan for the cluster
	@echo "Running terraform plan for $(ENV)"
	@cd terraform/$(PLATFORM); terraform init -lock=true -lock-timeout=$(TIMEOUT)
  @cd terraform/$(PLATFORM); terraform plan -lock=true -lock-timeout=$(TIMEOUT)

plan: ## Prints Terraform Plan for the cluster
	@echo "Running terraform plan for $(ENV)"
	@cd terraform/$(PLATFORM); terraform plan -lock=true -lock-timeout=$(TIMEOUT)
	
apply: plan ## Applies terraform to create/modify cluster
	@echo "Running terraform apply for $(ENV)"
	@cd terraform/$(PLATFORM); terraform apply -lock=true -lock-timeout=$(TIMEOUT) 
	
apply_add_worker: ## Applies terraform to add a worker
	@echo "Running terraform apply action=add_worker for $(ENV)"
	@cd terraform/$(PLATFORM); terraform apply -lock=true -lock-timeout=$(TIMEOUT) -var 'action=add_worker'
	
apply_remove_worker: ## Applies terraform to remove a worker
	@echo "Running terraform apply action=remove_worker for $(ENV)"
	@cd terraform/$(PLATFORM); terraform apply -lock=true -lock-timeout=$(TIMEOUT) -var 'action=remove_worker'
	
apply_upgrade: ## Applies terraform to upgrade the cluster
	@echo "Running terraform apply action=upgrade for $(ENV)"
	@cd terraform/$(PLATFORM); terraform apply -lock=true -lock-timeout=$(TIMEOUT) -var 'action=upgrade'
	
destroy: ## Destroys the cluster
	@echo "Running terraform destroy for $(ENV)"
	@cd terraform/$(PLATFORM); terraform destroy -input=false -force