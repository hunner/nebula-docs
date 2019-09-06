# projectnebula/jenkins-job-runner

The Jenkins job runner task runs a parameterized build on a Jenkins instance.

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `masterURL` || string | The fully-qualified HTTP URL to the Jenkins master instance.| None | True |
| `credentials` || mapping | A map of cert credentials to use for authenticating with Jenkins. | None | True |
|| `method` | string | The method to use to authenticate to Jenkins. Currently the only valid value is `http`.| None | True |
|| `user` | string | The Jenkins username to use for authentication. | None | True |
|| `token` | string | For `http` authentication, the API token to use for authentication. | None | True |
| `job` || string | The complete ID of the job or project to build. | None | True |
| `parameters` || mapping | A mapping of parameters for building the job. | None | False |
| qeueOptions || mapping | A mapping of Jenkins queue options. | None | True |
|| `waitFor` | string | The level of completion to wait for after enqueuing this Jenkins build. If set to `none`, this task completes successfully as soon as the corresponding build is enqueued. If set to `build`, this task completes when the Jenkins build completes, succeeding only if the build succeeds. If set to `downstreams`, this task completes when all downstream project builds of the Jenkins build complete. If any downstream build fails, this task also fails. | `build` | False |
|| `timeoutSeconds`  | integer | The amount of time to wait for a build to start. | 3600 | False    |
|| `cancelOnTimeout` | boolean | Whether the Jenkins build should be canceled if a timeout occurs. | `false` | False    |

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: jenkins
  image: projectnebula/jenkins-job-runner:latest
  spec:
    masterURL: http://example.com
    credentials: 
      method: http
      user: my-username
      token: 
        $type: Secret
        name: token
    job: my-jenkins-job
    parameters: 
      HOST: web2
      VERSION: 287
      DB_UPDATE: true
    queueOptions:
      waitFor: downstreams
      timeoutSeconds: 5000
      cancelOnTimeout: false
```