# projectnebula/vault

This task step runs commands against Hashicorp Vault instances. For more
information, see [Vault](https://www.vaultproject.io/). 

Use the following specifications:

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `token` || string | A token to use for accessing vault. You can pass the token to Nebula as a secret. See the example below. | None | True |
| `url` || string | The URL to the vault cluster. | None | True |
| `command` || mapping | The command to pass to the vault CLI. | None | True |
| `args` || sequence of strings | An sequence of arguments for the command. | None | False |
| `git` || mapping | A map of git configuration. | None | False |
|| `ssh_key` | string | The SSH key to use when cloning the git repository. You can pass the key to Nebula as a secret. See the example below. | None | True |
|| `known_hosts` | string | SSH known hosts file. You can pass the token to Nebula as a secret. See the example below. | None | True |
|| `name` | string | A directory name for the git clone. | None | True |
|| `repository` | string | The git repository URL. | None | True |

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
    command: ls
    args: 
    - "-la"
    - "/" 
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