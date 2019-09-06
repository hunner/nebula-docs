# projectnebula/slack-notification

The Slack notification task sends a message to a Slack channel.

Use the following specifications:

| Parameter | Data type | Description | Default | Required |
|-----------|-----------|-------------|---------|----------|
| `apitoken` | string | The Slack legacy API token to use. You can pass the key in to Nebula as a secret. See the example below.  | None     | True     | For more information, see [Getting a slack token](https://get.slack.help/hc/en-us/articles/215770388-Create-and-regenerate-API-tokens) |
| `channel`  | string | The channel to send the message to | None     | True     ||
| `message`  | string | The message to send                | None     | True     ||
| `username` | string | The username to use in Slack       | `Nebula` | False    ||

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