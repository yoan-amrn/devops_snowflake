# Snowflake Automation

## Pre-requisites

To be able to do change automatically, your CICD dedicated Snowflake user must have the SYSADMIN & SECADMIN roles assigned.

## Usage

Here's the list of actions to enable automation on your Snowflake repository:

### Environments Definition

- Depending on your configuration, [create following environments](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#creating-an-environment):

  - DEV
  - UAT
  - PROD
  - DEV-manual (optional)
  - UAT-manual (optional)
  - PROD-manual (optional)

- In each environment, add the environment variables:

  - `SNOWFLAKE_ACCOUNT`
  - `SNOWFLAKE_DB`
  - `SNOWFLAKE_ROLE`
  - `SNOWFLAKE_USER`
  - `SNOWFLAKE_WAREHOUSE`

- In each environment, add the environment secrets:

  - `SNOWFLAKE_PASSWORD`

- Create the files `dev.env`, `uat.env` & `prod.env`, following below example:

```shell
env=dev
env_shr=uat
```

### Setup automation

- Create the following hierarchy in the repo:

```shell
root
└─ .github
   └─ workflows
      ├─ deploy.yml
      ├─ init.yml
      └─ tests.yml
```

- Paste the content of the below files into the newly created files:
  - [deploy.yml](github_workflows_example/deploy.yml)
  - [init.yml](github_workflows_example/init.yml)
  - [tests.yml](github_workflows_example/tests.yml)

> **_Note:_** To disable manual validation before actual execution of scripts, remove the `-manual` in the `environment` of the `execute` job

- [Manually run](https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow) the `init` workflow in your project

## Deploy.sh script

Prepare and deploy version scripts for Snowflake.

Syntax: `deploy.sh action [-e env] [-v] [-y] [-h]`

### Parameters

action  Action to perform. Possible values:

- `init`: Setup the deployment structures in Snowflake
- `prep[are]`: Prepare the scripts files for a given version
- `exec[ute]`: Run the prepared scripts
- `clean`: Remove deploy folder and logs

### Options

- `e`  Target deployment env (dev/uat/prod). Defaults to current git branch.
- `y`  Do not ask for confirmation before deploying.
- `h`  Display this help.

## External dependencies

- SnowSQL [v1.3.3](https://docs.snowflake.com/en/release-notes/clients-drivers/snowsql)
- JQ
