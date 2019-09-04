# projectnebula/slack-notification

This task sends a message to a Slack channel.

Use the following specifications:

| Parameter  | Description                        | Default  | Required | Notes |
|------------|------------------------------------|----------|----------||
| `apitoken` | The Slack legacy API token to use. Pass the token in as a Nebula secret.  | None     | True     | For more information, see [Getting a slack token](https://get.slack.help/hc/en-us/articles/215770388-Create-and-regenerate-API-tokens) |
| `channel`  | The channel to send the message to | None     | True     ||
| `message`  | The message to send                | None     | True     ||
| `username` | The username to use in Slack       | `Nebula` | False    ||

Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: slack-notification
  image: projectnebula/slack-notification:latest
  spec:
    apitoken:
      $type: Secret
      name: slack-token
    channel: "#nebula-workflows"
    message: "You got notified with Nebula! Good job everyone."
    username: me
```