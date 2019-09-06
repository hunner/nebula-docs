# projectnebula/k8s-provisioner

The k8s-provisioner task creates and manages Kubernetes clusters in cloud platforms.

> **Note**: This task provisions resources in your cloud platform account. Deploying infrastructure creates real resources and could incur a charge from your cloud provider.

Current supported platforms:
- Google Cloud Platform (GCP)
- Amazon Web Services (AWS)

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `provider` || string | The cloud provider to use. Use `aws` or `gcp`. | None | True |
| `project` || string The GCP project ID. | None | True for GCP |
| `clusterName` || string | A name for your cluster. This must be a fully qualified domain name (FQDN). You can use a root domain in route53 or GCP domain name service (DNS), or you can set the domain to `k8s.local` if you don't want to use one of your roots. | None | True |
| `credentials` || string | A map of credentials used for platform authentication. | None | True |
|| `gcpServiceAccountFile` | string | The GCP service account JSON. Pass the file contents to Nebula as a secret. See the example below. | None | True for GCP |
|| `awsAccessKeyID` | string | The AWS access key ID. | None | True for AWS |
|| `awsSecretAccessKey` | string | The AWS secret access key. | None | True for AWS |
|| `sshPublicKey` | string | An SSH public key to install on the virtual machine instances that run the cluster. | None | True for AWS |
| `stateStoreName` || string | A storage bucket name to store cluster state. This configuration uses the storage system of your cloud provider. AWS uses s3, GCP uses GS. If the bucket exists, the task tries to just use it. If the bucket does not exist, the task attempts to create the bucket. Multiple clusters can use the same state storage as long as the `clusterName` values are different. | None | True |
| `masterCount` || integer | A count of how many master nodes to provision. | 1 | False |
| `nodeCount` || integer | A count of how many agent nodes to provision. | 3 | False |
| `zones` || An sequence of strings | An sequence of zones in the cloud platform to run node instances in. | None | True (at least one) |
| `region` || string | A platform region to use when provisioning a cluster. | None | True |

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: k8s-provisioner
  image: projectnebula/k8s-provisioner:latest
  spec:
    provider: gcp
    project: my-project
    clusterName: my-cluster
    credentials:
      gcpServiceAccountFile: 
        $type: Secret
        name: credentials
    stateStoreName: my-bucket
    masterCount: 1
    nodeCount: 3
    zones: 
    - "us-west-2a"
    region: us-west2
```