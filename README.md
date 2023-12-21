# terraform-aws-organizations

A repository to house shared infrastructure components for the Fajardo Group.

## Assumptions

The repository assumes the following:

- A basic understanding of [Git](https://git-scm.com/).
- Git version `>= 2.33.0`.
- An existing AWS IAM user or role with access to create/update/delete resources defined in [main.tf](https://github.com/pacenthink/terraform-aws-organizations/blob/main.tf).
- A basic understanding of [Terraform](https://www.terraform.io/).
- Terraform version `>= 1.0.2`.
- (Optional - for local testing) A basic understanding of [Make](https://www.gnu.org/software/make/manual/make.html#Introduction).
  - Make version `>= GNU Make 3.81`.
  - **Important Note**: This project includes a [Makefile](https://github.com/pacenthink/terraform-aws-organizations/blob/main/Makefile) to speed up local development in Terraform. The `make` targets act as a wrapper around Terraform commands. As such, `make` has only been tested/verified on **Linux/Mac OS**. Though, it is possible to [install make using Chocolatey](https://community.chocolatey.org/packages/make), we **do not** guarantee this approach as it has not been tested/verified. You may use the commands in the [Makefile](https://github.com/pacenthink/terraform-aws-organizations/blob/main/Makefile) as a guide to run each Terraform command locally on Windows.

## Contributions

Contributions are always welcome. As such, this project uses the `main` branch as the source of truth to track changes.

**Step 1**. Clone this project.
```sh
# Using Git
$ git clone git@github.com:pacenthink/terraform-aws-organizations.git

# Using HTTPS
$ git clone https://github.com/pacenthink/terraform-aws-organizations.git
```

**Step 2**. Checkout a feature branch: `git checkout -b feature/abc`.

**Step 3**. Validate the change/s locally by executing the steps defined under [Test](#test).

**Step 4**. If testing is successful, commit and push the new change/s to the remote.
```sh
$ git add file1 file2 ...

$ git commit -m "Adding some change"

$ git push --set-upstream origin feature/abc
```

**Step 5**. Once pushed, create a [PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) and assign it to a member for review.

**Step 6**. A team member reviews/approves/merges the change/s.

**Step 7**. Once merged, deploy the required changes as needed.

**Step 8**. Once deployed, verify that the changes have been deployed.

## Test

**Important Note**:This project includes a [Makefile](https://github.com/pacenthink/terraform-aws-organizations/blob/main/Makefile) to speed up local development in Terraform. The `make` targets act as a wrapper around Terraform commands. As such, `make` has only been tested/verified on **Linux/Mac OS**. Though, it is possible to [install make using Chocolatey](https://community.chocolatey.org/packages/make), we **do not** guarantee this approach as it has not been tested/verified. You may use the commands in the [Makefile](https://github.com/nurdsoft/pacenthink/terraform-aws-organizations/blob/main/Makefile) as a guide to run each Terraform command locally on Windows.

```sh
# Perform a dry-run on the infrastructure
$ make plan
# Create the infrastructure
$ make apply
# Perform a dry-run on a destroy
$ make plan-destroy
# Destroy the infrastructure
$ make destroy
```