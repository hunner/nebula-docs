# projectnebula/helm-deployer

The Helm deployer task deploys a Helm chart to a Kubernetes cluster.

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `credentials` || mapping | A map of cert credentials to use for accessing the tiller controller in the cluster | None | True |
|| `ca.pem` | string | The Tiller CA file contents | None | True |
|| `key.pem` | string | The Tiller key file contents | None | True |
|| `cert.pem` | string | The Tiller cert file contents | None | True |
| `name` || string | The name of the deployment.| None| True|
| `values` || mapping | Use the `values` mapping to override specific values in the chart. For example, the example below overrides some of the chart's API values. | None | True |
| `chart` || string | The repo/chart to use. If the `git` map is set, then the chart is referenced from that repository instead of a remote chart repo. | None | True |
| `namespace` || string | The Kubernetes namespace to deploy the chart into. | None | True |
| `recreatePods` || boolean | If `true`, all pods managed by this chart will be destroyed and recreated after the deployment completes. | `false` | False |
| `git` || mapping | A map of git configuration. | None | False |
|| `ssh_key` | string | The SSH key to use when cloning the git repository. You can pass the key in to Nebula as a secret. See the example below. | None | True |
|| `known_hosts` | string | SSH known hosts file. Pass the contents of the file in to Nebula as a secret. See the example below. | None | True |
|| `name` | string | A directory name for the git clone. | None | True |
|| `repository` | string | The git repository URL. | None | True |
| `cluster` || mapping | A map of configuration and credentials for accessing a Kubernetes cluster. | None | True |
|| `name`   | string | A name for the Kubernetes cluster. Used for referencing it via `kubectl` contexts. | None    | True     |
|| `url`    | string | The URL to the Kubernetes cluster master. You can pass the URL to Nebula as a secret. See the example below. | None    | True     |
|| `cadata` | string | A file containing the Kubernetes master CA contents. Pass the file contents to Nebula as a secret. See the example below. | None    | True     |
|| `token`  | string | A token for the Kubernetes master. You can pass the token to Nebula as a secret. See the example below. | None    | True     |

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...
- name: help-deployer
  image: projectnebula/helm-deployer:latest
  spec:
    credentials:
      ca.pem:
        $type: Secret
        name: ca
      key.pem:
        $type: Secret
        name: key
      cert.pem:
        $type: Secret
        name: cert
    values:
      api:
        image:
          tag: 
            $type: Secret
            name: api.image.tag
        adminToken:
          secretRef:
            name: admin-token
        sendGrid:
          secretRef:
            name: sendgrid-ref
        googleCredentials:
          secretRef:
            name: google-creds
        storage:
          address: gs://storage
    chart: helm/my-app
    namespace: default
    recreatePods: true
    git: 
      ssh_key:
        $type: Secret
        name: ssh_key
      known_hosts:
        $type: Secret
        name: known_hosts
      name: my-git-repo
      repository: path/to/your/repo     
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
```