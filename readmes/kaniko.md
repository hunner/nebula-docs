# projectnebula/kaniko

The Kaniko task runs the Kaniko image builder.

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `destination` || string | A destination directory for the build. | None | True |
| `git` || mapping |  | A map of git configuration. | None | False |
|| `ssh_key` | string | The SSH key to use when cloning the git repository. You can pass the key to Nebula as a secret. See the example below. | None | True |
|| `known_hosts` | string | SSH known hosts file. You can pass the token to Nebula as a secret. See the example below. | None | True |
|| `name` | string | A directory name for the git clone. | None | True |
|| `repository` | string | The git repository URL. | None | True |


Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: kaniko
  image: projectnebula/kaniko:latest
  spec:
    destination: builds/image
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