This is a sample Terraform project scaffold with dummy Lambda modules, an API module, and a Route53 module.

Quick start:

1. Package lambdas (creates zips in modules/lambda):

```bash
make pack
```

2. Initialize Terraform:

```bash
make init
```

3. Plan for dev:

```bash
make plan
```

Files of interest:
- `modules/lambda` - simple lambda module and dummy handlers
- `prod.tfvars`, `devl.tfvars` - example variable files
- `.drone.yml` - example Drone CI pipeline

Note: All values are dummy and for illustration only.
