# projectnebula/kubectl

The kubectl step task allows general `kubectl` use and can take `kubectl` commands.

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `cluster` || mapping | A map of configuration and credentials for accessing a Kubernetes cluster. | None | True |
|| `name`   | string | A name for the Kubernetes cluster. Used for referencing it via `kubectl` contexts. | None    | True     |
|| `url`    | string | The URL to the Kubernetes cluster master. You can pass the URL to Nebula as a secret. See the example below. | None    | True     |
|| `cadata` | string | A file containing the Kubernetes master CA contents. Pass the file contents to Nebula as a secret. See the example below. | None    | True     |
|| `token`  | string | A token for the Kubernetes master. You can pass the token to Nebula as a secret. See the example below. | None    | True     |
| `command` || mapping | The command to pass to the vault CLI. | None | True |
| `args` || sequence of strings | An sequence of arguments for the command. | None | False |
| `file` || string | A resource file to use. | None | False    |
| `namespace` || string | The namespace to run the command under. | `default` | False    |
| `git` || mapping | A map of git configuration. | None | False |
|| `ssh_key` | string | The SSH key to use when cloning the git repository. You can pass the key to Nebula as a secret. See the example below. | None | True |
|| `known_hosts` | string | SSH known hosts file. You can pass the token to Nebula as a secret. See the example below. | None | True |
|| `name` | string | A directory name for the git clone. | None | True |
|| `repository` | string | The git repository URL. | None | True |

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: kubectl
  image: projectnebula/kubectl:latest
  spec:
    command: apply
    args: 
    - "-k"
    - "dir/"
    file: infra/resources.yaml
    namespace: default
    cluster:
      name: my-cluster
      url:
        $type: Secret
        name: url
      cadata:
        $type: Secret
        name: cadata
      token:
        $type: Secret
        name: token        
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