THIS IS A TEST

## DO NOT ADJUST YOUR SETS

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