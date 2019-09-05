# projectnebula/ecs-provisioner

The ECS provisioner task provisions ECS clusters in AWS.

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `cluster` || mapping | A map of ECS cluster configurations. | None | True |
|| `name` | string | A name for the cluster. | None | True |
|| `region` | string | A region for the cluster. | None | True |
| `path` || string | A path to the workspace to use for provisioning. | None | True |
| `credentials` | mapping | A map of platform credentials. | None | True |
|| `credentials.json` | mapping |  The GCP service account file contents. Pass the contents to Nebula as a secret. See the example below. | None | True for `gcp` |
|| `credentials` | mapping | The AWS shared account file contents. Pass the file contents into Nebula as a secret. See the example below. | None | True for `aws` |
| `git` || mapping | A map of git configuration. | None | False |
|| `ssh_key` | string | The SSH key to use when cloning the git repository. You can pass the key to Nebula as a secret. See the example below. | None | True |
|| `known_hosts` | string | SSH known hosts file. You can pass the token to Nebula as a secret. See the example below. | None | True |
|| `name` | string | A directory name for the git clone. | None | True |
|| `repository` | string | The git repository URL. | None | True |

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: ecs-provisioner
  image: projectnebula/ecs-provisioner:latest
  spec:
    cluster: 
      name: my-cluster
      region: us-west-2
    path: workspaces/aws
    credentials:
      credentials: 
        $type: Secret
        name: credentials
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