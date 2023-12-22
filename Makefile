## -----------------------------------------------------------------------------
## Make targets to test Terraform deployments locally.
## -----------------------------------------------------------------------------

# Static variables.
TF_PLAN_FILEPATH=plan.tfplan
TF_STATE_FILEPATH=_state/terraform.tfstate

# Avoid name collisions between targets and files.
.PHONY: help fmt init validate plan apply plan-destroy destroy clean

# A target to format and present all supported targets with their descriptions.
help: Makefile
	@sed -n 's/^##//p' $<

define DEFAULT_PLAN_ARGS
-out=${TF_PLAN_FILEPATH}
endef

## fmt: Run terraform fmt.
fmt:
	terraform  fmt -check=true -diff

## init: Run terraform init.
init:
	terraform  init

## validate: Run terraform validate.
validate:
	terraform  validate

## plan: Run terraform plan for the provided service.
plan: clean fmt init validate
	terraform   plan ${DEFAULT_PLAN_ARGS} -state=${TF_STATE_FILEPATH}

## apply: Run terraform apply for the provided service.
apply:
	terraform   apply -auto-approve -input=false -state=${TF_STATE_FILEPATH}

## plan-destroy: Run terraform plan destroy for the provided service.
plan-destroy: clean
	terraform   plan -destroy ${DEFAULT_PLAN_ARGS} -state=${TF_STATE_FILEPATH}

## destroy: Run terraform destroy for the provided service.
destroy:
	terraform   destroy -auto-approve -state=${TF_STATE_FILEPATH}

## clean: Find and remove all the temporary files.
clean:
	@find . -name ".terraform" -type d -print0 | xargs -0 -I {} rm -rf "{}"
	@find . -name ".terraform.lock.hcl" -type f -print0 | xargs -0 -I {} rm -rf "{}"
	@find . -name "plan.tfplan" -type f -print0 | xargs -0 -I {} rm -rf "{}"
	@rm -f ${TF_STATE_FILEPATH}