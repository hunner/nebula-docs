A task that runs commands against vault instances.

Use the following specifications:

| Parameter | Child parameters | Description | Default | Required |
|-----------|------------------|-------------|---------|----------|
| `token` || A token to use for accessing vault. | None | True |
| `url` || The URL to the vault cluster. | None | True |
| `command` || The command to pass to the vault CLI. | None | True |
| `args` || A list of arguments for the command. | None | True |
| `git` || A map of git configuration. | None | False |
|| `ssh_key` | The SSH key to use when cloning the git repository. | None | True |
|| `known_hosts` | SSH known hosts file. | None | True |
|| `name` | A directory name for the git clone. | None | True |
|| `repository` | The git repository URL. | None | True |
