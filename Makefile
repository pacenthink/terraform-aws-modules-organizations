## -----------------------------------------------------------------------------
## Make targets to test Terraform deployments locally.
## -----------------------------------------------------------------------------

# Static variables.
TF_PLAN_FILEDIR=plan.tfplan

# Avoid name collisions between targets and files.
.PHONY: help fmt init validate plan apply plan-destroy destroy clean

# Dynamic variables
DIR ?= $(CURDIR)

# A target to format and present all supported targets with their descriptions.
help: Makefile
	@sed -n 's/^##//p' $<

define DEFAULT_PLAN_ARGS
-out=${TF_PLAN_FILEDIR}
endef

## fmt: Run terraform fmt.
fmt:
	terraform -chdir=${DIR} fmt -check=true -diff

## init: Run terraform init.
init:
	terraform -chdir=${DIR} init

## validate: Run terraform validate.
validate:
	terraform -chdir=${DIR} validate

## plan: Run terraform plan for the provided service.
plan: clean fmt init validate
	terraform -chdir=${DIR} plan ${DEFAULT_PLAN_ARGS}

## apply: Run terraform apply for the provided service.
apply:
	terraform -chdir=${DIR} apply -auto-approve -input=false

## plan-destroy: Run terraform plan destroy for the provided service.
plan-destroy: clean
	terraform -chdir=${DIR} plan -destroy ${DEFAULT_PLAN_ARGS}

## destroy: Run terraform destroy for the provided service.
destroy:
	terraform -chdir=${DIR} destroy -auto-approve

## clean: Find and remove all the temporary files.
clean:
	@find . -name ".terraform" -type d -print0 | xargs -0 -I {} rm -rf "{}"
	@find . -name ".terraform.lock.hcl" -type f -print0 | xargs -0 -I {} rm -rf "{}"
	@find . -name "plan.tfplan" -type f -print0 | xargs -0 -I {} rm -rf "{}"

## docs : Generate documentation for the module.
docs:
	@terraform-docs markdown .