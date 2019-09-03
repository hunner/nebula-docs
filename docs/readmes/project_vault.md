A task that runs commands against vault instances.

Use the following specifications:

| Parameter | Child parameters | Description | Default | Required |
|-----------|------------------|-------------|---------|----------|
| `token` || A token to use for accessing vault. | None | True |
| `url` || The URL to the vault cluster. | None | True |
| `command` || The command to pass to the vault CLI. | None | True |
| `args` || A list of arguments for the command. | None | True |
| `git` || A map of git configuration. | None | False |
|| `git.ssh_key` | The SSH key to use when cloning the git repository. | None | True |
|| `git.known_hosts` | SSH known hosts file. | None | True |
|| `git.name` | A directory name for the git clone. | None | True |
|| `git.repository` | The git repository URL. | None | True |
