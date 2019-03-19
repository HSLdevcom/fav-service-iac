# Suosikit mikropalvelu (fav-service) deployment

This repository contains Ansible playbooks for provisioning and configuring infrastructure for Suosikit mikropalvelu backend services.

## Usage

- Create a new key for the service principal user yritysportaali-iac in Azure Portal
- Create an Azure credentials file if one does not exist already: `~/.azure/credentials`
- Copy the following to the file, and fill the values from the Azure portal:

``` [fav-service]
subscription_id=
client_id=
secret=
tenant=
```

# Setting up the environment

There are three environments set up in `env/`. Dev, test and prod but you can add any amount if you copy the variables.

```
az_environment: test
az_git_branch: test
```

The environment consists of a suffix for azure under which it will create the resource group, function app and redis cache. Git branch is which branch you want to set up for it to automatically pull changes from.

- Run the azure-ansible container with the script `start-ansible-shell.sh`
- You should now be able to run a provisioning playbook in the Ansible shell

## Playbooks

There are separate playbooks for provisioning and destroying resources.
Running the playbooks inside the Ansible shell:

`ansible-playbook <playbook-name> -e @env/dev.yml -e @env/dev_secrets.yml -CD`

Remove the -CD flags when you are certain you wish to actually run the playbook

When configuration is complete ansible will echo the ssh-rsa key and deployment trigger url which you can just copy to gitlab.

Copy the ssh-rsa key to Settings -> Repository -> Deploy keys

Copy the deployment trigger url to Settings -> Integrations -> Webhook

## Notes
- Testing app provisioning playbook locally with -CD fails because the app plan and resource group it needs are not really created.
- Provisioning the redis cache can take a long time (20min+)
