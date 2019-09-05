# projectnebula/terraform

This task step runs Terraform `apply`.

Use the following specifications:

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `provider` || string | The cloud provider to use. Currently "aws" or "gcp". | `gcp` | False |
| `credentials` || mapping | A map of platform credentials. | None | True |
|| `credentials.json` | mapping |  The GCP service account file contents. Pass the contents to Nebula as a secret. See the example below. | None | True for `gcp` |
|| `credentials` | mapping | The AWS shared account file contents. Pass the file contents into Nebula as a secret. See the example below. | None | True for `aws` |
| `workspace` || string | A name for the Terraform workspace to use. | `default` | False |
| `directory` || string | A directory containing Terraform modules and resources. | `default` | False |
| `git` || mapping | A map of git configuration. | None | False |
|| `ssh_key` | string | The SSH key to use when cloning the git repository. You can pass the key in to Nebula as a secret. See the example below. | None | True |
|| `known_hosts` | string | SSH known hosts file. Pass the contents of the file in to Nebula as a secret. See the example below. | None | True |
|| `name` | string | A directory name for the git clone. | None | True |
|| `repository` | string | The git repository URL. | None | True |

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

See a problem with this doc? Submit a pull request to the Nebula docs repo or
open an issue.