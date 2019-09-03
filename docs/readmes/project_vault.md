A task that runs commands against vault instances.

Use the following specifications:

| Parameter | Child parameters | Description | Default | Required |
|-----------|------------------|-------------|---------|----------|
| `token` || A token to use for accessing vault. | None | True |
| `url` || The URL to the vault cluster. | None | True |
| `command` || The command to pass to the vault CLI. | None | True |
| `args` || A list of arguments for the command. | None | True |
| `git` || A map of git configuration. See [git specification](#common-spec-git) | None | False |
||git.ssh_key| The SSH key to use when cloning the git repository. | None | True |   