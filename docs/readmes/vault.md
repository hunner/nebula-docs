# projectnebula/vault

This task step runs commands against Hashicorp Vault instances. For more
information, see [Vault](https://www.vaultproject.io/). 

Use the following specifications:

| Parameter | Child parameters | Description | Default | Required |
|-----------|------------------|-------------|---------|----------|
| `token` || A token to use for accessing vault. Pass the token in to Nebula as a secret. | None | True |
| `url` || The URL to the vault cluster. | None | True |
| `command` || The command to pass to the vault CLI. | None | True |
|| `args` | A list of arguments for the command. | None | True |
| `git` || A map of git configuration. | None | False |
|| `ssh_key` | The SSH key to use when cloning the git repository. Pass the key in to Nebula as a secret. | None | True |
|| `known_hosts` | SSH known hosts file. | None | True |
|| `name` | A directory name for the git clone. | None | True |
|| `repository` | The git repository URL. | None | True |

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: vault
  image: projectnebula/vault:latest
  spec:
    token:
      $type: Secret
      name: vault_token
    url: path/to/your/cluster.com
    command:
      args: ./my_script.sh
    git: 
      ssh_key:
        $type: Secret
        name: ssh_key
      known_hosts:
        $type: Secret
        name: known_hosts
      name: my-git-repo
      repository: path/to/your/repo
```