# projectnebula/msteams-notification

This task step sends a markdown-formatted message to Microsoft Teams via an
[Actionable Message](https://docs.microsoft.com/en-us/outlook/actionable-messages/)
incoming webhook connector.

To use this task step, you must first [set up an incoming webhook](https://docs.microsoft.com/en-us/microsoftteams/platform/concepts/connectors/connectors-using#setting-up-a-custom-incoming-webhook)
for your team so that you can pass the webhook URL to the task.

| Parameter    | Data type | Description                     | Default | Required |
|--------------|-----------|---------------------------------|---------|----------|
| `message`    | string | The markdown message to send.   | None    | True     |
| `webhookURL` | string | The Teams incoming webhook URL. | None    | True     |


Here is an example of the step in a Nebula workflow:

```YAML
steps:

...

- name: msteams-notification
  image: projectnebula/msteams-notification:latest
  spec:
    message: "You got notified with Nebula! Good job everyone."
    webhookURL: https://example.com
```