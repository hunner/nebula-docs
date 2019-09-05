# projectnebula/jira-resolve

A task that can update the state of a Jira ticket.

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| `username`           || string | Jira username        | None                 | True     |
| `password`           || string | Jira password        | None                 | True     |
| `url`                || string | Jira server URL      | None                 | True     |
| `issue`              || string | Issue ID             | None                 | True     |
| `resolution` || mapping | Mapping for resolution status and comment. | None | False |
| `resolution.status`  || string | Desired issue status | `Closed`             | False    |
| `resolution.comment` || string | Issue update comment | `Resolved by Nebula` | False    |

The  task runs a parameterized build on a Jenkins instance.


Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: jenkins
  image: projectnebula/jenkins-job-runner:latest
  spec:
    username:
    password:
    url:
    issue:

```

See a problem with this doc? Submit a pull request to the Nebula docs repo or
open an issue.