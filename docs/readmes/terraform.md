# projectnebula/terraform

This task step runs Terraform `apply`.

| Parameter | Child parameters | Description | Default | Required |
|-----------|------------------|-------------|---------|----------|
| `provider` || The cloud provider to use. Currently "aws" or "gcp". | `gcp` | False |
| `credentials` || A map of platform credentials. | None | True |
|| `credentials.json` | The GCP service account file contents. Pass the file contents into Nebula as a secret | None | True for `gcp` |
|| `credentials` | The AWS shared account file contents. Pass the file contents into Nebula as a secret | None | True for `aws` |
| `workspace` || A name for the Terraform workspace to use. | `default` | False |
| `directory` || A directory containing Terraform modules and resources. | `default` | False |
| `git` || A map of git configuration. | None | False |
|| `ssh_key` | The SSH key to use when cloning the git repository. Pass the key in to Nebula as a secret. | None | True |
|| `known_hosts` | SSH known hosts file. | None | True |
|| `name` | A directory name for the git clone. | None | True |
|| `repository` | The git repository URL. | None | True |

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: terraform
  image: projectnebula/terraform:latest
  spec:
    provider: gcp
    credentials:
      credentials.json: 
        $type: Secret
        name: credentials
    workspace: my_workspace
    directory: infra/app    
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