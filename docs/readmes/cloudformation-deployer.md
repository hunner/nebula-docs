# projectnebula/cloudformation-deployer

The AWS CloudFormation deployer task creates or updates a CloudFormation stack using a provided template.

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `aws` || mapping | A mapping of AWS account configuration. | None | True |
|| `accessKeyID` | string | An access key ID for the AWS account. You can pass the ID in to Nebula as a secret. See the example below. | None | True |
|| `secretAccessKey` | string | The secret access key corresponding to the access key ID. Pass the key in to Nebula as a secret. See the example below.| None | True |
|| `region` | string | The AWS region to use (for example, `us-west-2`). | None | True |
| `stackName` || string | The name of the stack to create or update. | None | True |
| `template` || string | The body of the CloudFormation template as a string in YAML or JSON. One of `template` or `templateFile` must be specified. | None | If `templateFile` is not present |
| `templateFile` || string | The relative path, within the Git repository given in the `git` parameters, to the template file to deploy. One of `template` or `templateFile` must be specified. | None | If `template` is not present |
| `git` || mapping | A map of git configuration. | None | False |
|| `ssh_key` | string | The SSH key to use when cloning the git repository. You can pass the key in to Nebula as a secret. See the example below. | None | True |
|| `known_hosts` | string | SSH known hosts file. Pass the contents of the file in to Nebula as a secret. See the example below. | None | True |
|| `name` | string | A directory name for the git clone. | None | True |
|| `repository` | string | The git repository URL. | None | True |
| `parameters` || mapping | A key-value mapping of parameters to pass to the template. | None | False |
| `capabilities` || sequence of strings | A list of capabilities to use for the deployment, such as `CAPABILITY_NAMED_IAM`. | None | False |
| `tags` || mapping | A key-value mapping of tags to add to the deployment. | None | False |

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: cloudformation-deployer
  image: projectnebula/cloudformation-deployer:latest
  spec:
    aws:
      accessKeyID:
        $type: Secret
        name: key-id 
      secretAccessKey:
        $type: Secret
        name: access-key
      region: us-west-2  
    stackName: my-stack 
    templateFile: templates/template.yaml
    git: 
      ssh_key:
        $type: Secret
        name: ssh_key
      known_hosts:
        $type: Secret
        name: known_hosts
      name: my-git-repo
      repository: path/to/your/repo
      parameters: 
        Environment: production
        CertificateARN: arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012
      capabilities:
        - CAPABILITY_NAMED_IAM
      tags:
        lifetime: 4d
```

See a problem with this doc? Submit a pull request to the Nebula docs repo or
open an issue.