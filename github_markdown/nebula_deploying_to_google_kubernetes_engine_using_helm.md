---
author: Heston Hoffman <heston.hoffman@puppet.com\>
---

# Deploying to Google Kubernetes Engine using Helm

Use the following step specification for a step that deploys an application to Google Kubernetes Engine using a Helm chart.

The `spec` for a Helm deployment consists of six keys:

-   `credentials`: If your Helm chart is secured, pass in your `ca`, `key`, and `cert` as secrets. For example:

    ```
    spec:
      credentials:
        ca:
          $type: Secret
          name: ca
        key:
          $type: Secret
          name: key
        cert:
          $type: Secret
          name: cert
    ```

-   `values`: Use the `values` key to override specific values in the chart. For example, this spec overrides some of the chart's API values:

    ```
    spec:
    ...
    
      values:
        api:
          image:
            tag: 
              $type: Secret
              name: api.image.tag
          db:
            secretRef:
              name: app-edgedb-credentials
              key: url
          githubClient:
            secretRef:
              name: app-github-client-credentials
              clientIdKey: client-id
              clientSecretKey: client-secret
          bitbucketClient:
            secretRef:
              name: app-bitbucket-client-credentials
              clientIdKey: client-id
              clientSecretKey: client-secret
          vault:
            agent:
              serviceAccount:
                create: false
                name: nebula-api-vault
            address: "http://vault-vault.app.svc:8200"
    ```

-   `chart`: The path to the Helm chart in the repo.

    ```
    chart: helm/nebula
    ```

-   `namespace`: The namespace where you're deploying the Helm chart.

    ```
    namespace: default
    ```

-   `git`: The path to the chart's repository, and the credentials needed to access it.

    ```
    spec:
    ...
    
      git:
        ssh_key:
          $type: Secret
          name: ssh_key
        known_hosts:
          $type: Secret
          name: known_hosts
        name: nebula
        repository: git@github.com:puppetlabs/nebula-deploy.git
    ```

-   `cluster`: The cluster where you're deploying the Helm chart.

    ```
    spec:
      cluster:
        name: nebula-cluster
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


Here is an example of a workflow that deploys to a GKE cluster using a Helm Chart.

```
version: v1
description: Nebula Workflow

steps:
- name: nebula-deploy-app
  image: gcr.io/nebula-tasks/nebula-helm-deployer:latest
  spec:
    credentials:
      ca:
        $type: Secret
        name: ca
      key:
        $type: Secret
        name: key
      cert:
        $type: Secret
        name: cert
    values:
      api:
        image:
          tag: 
            $type: Secret
            name: api.image.tag
        db:
          secretRef:
            name: app-edgedb-nebula-ddl-credentials
            key: url
        githubClient:
          secretRef:
            name: app-github-client-credentials
            clientIdKey: client-id
            clientSecretKey: client-secret
        bitbucketClient:
          secretRef:
            name: app-bitbucket-client-credentials
            clientIdKey: client-id
            clientSecretKey: client-secret
        vault:
          agent:
            serviceAccount:
              create: false
              name: nebula-api-vault
          address: "http://vault-vault.nebula-system.svc:8200"
    chart: helm/nebula
    namespace: default
    git:
      ssh_key:
        $type: Secret
        name: ssh_key
      known_hosts:
        $type: Secret
        name: known_hosts
      name: nebula
      repository: git@github.com:puppetlabs/nebula-deploy.git      
    cluster:
      name: nebula-cluster
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

**Parent topic:**[Step specifications](nebula_step_specifications.md)

