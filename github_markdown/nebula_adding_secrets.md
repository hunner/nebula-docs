---
author: Heston Hoffman <heston.hoffman@puppet.com\>
---

# Adding secrets

Add a secret to your workflow and then use Nebula's web interface, or the CLI to set a value for the secret.

To add a secret to your workflow, add the `Secret` type together with a `name` key. For example:

```
credentials:
  $type: Secret
  name: credentials
```

To set a value for the secret, on the workflow's page, click **New secret**, or use the secret set command:

```
./nebula-cli/nebula-cli secret set --workflow <WORKFLOW_NAME> --key <KEY_NAME>
```

**Important:** The value you set for a secret must be a string. If you have multiple key-value pairs to pass in to the secret, or your secret is the contents of a file, you must encode the values using base64 encoding, and use the encoded string as the secret value.

Here's an example of a workflow that provisions a Kubernetes cluster on Google Cloud Project \(GCP\). The workflow makes use of two secrets, `cluster-service-account-credentials` and `cluster-project`.

```
version: v1
description: Nebula Kubernetes cluster provisioner

steps:
- name: create-k8s-cluster
  image: gcr.io/nebula-tasks/nebula-k8s-provisioner:latest
  spec:
    provider: gcp
    credentials:
      $type: Secret
      name: cluster-service-account-credentials
    project:
      $type: Secret
      name: cluster-project
    clusterName: test-cluster
    stateStoreName: demo-gcp-cluster-state
    nodeCount: 3
    zones: ["us-west1-a"]
```

**Parent topic:**[Using workflows](using_workflows.md)

