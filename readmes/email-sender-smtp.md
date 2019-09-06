# projectnebula/email-sender-smtp

<!--- Note: Not sure what's going on with this one, but the YAML it doesn't want to render properly using backticks - I had to indent 4 spaces instead. --->

The email sender smtp task sends an email using SMTP.

| Parameter | Child parameters | Data type | Description | Default | Required |
|-----------|------------------|-----------|-------------|---------|----------|
| server || mapping | A map of server configuration values and credentials. | None | True |
|| `host` | string | The hostname of the SMTP server to connect to. | None | True |
|| `port` | integer | The server's SMTP or SMTPS port. | 25 | False |
|| `username` | string | The username to use when authenticating to the server. A username and password are required as this task does not support connecting to open relays. | None | True |
|| `password` | string | The password to use when authenticating to the server. | None | True |
|| `tls` | boolean | Whether to use TLS to connect to the server. If `false`, this task uses the `STARTTLS` extension instead. This task does not support unencrypted connections. | `true` if `port` is 465, `false` otherwise | False |
| `from` || string | The `From` header address to use, in an RFC 5322-compatible format, such as user@example.com or `John Doe <user@example.com>`. | None | True |
| `to` || sequence of strings | A list of email addresses to send the email to, represented as a YAML sequence (sequence). | None | True |
| `cc` || sequence of strings | A list of email addresses to carbon copy, represented as a YAML sequence. | None | False |
| `bcc` || sequence of strings | A list of email addresses to blind carbon copy, represented as a YAML sequence. | None | False |
| `subject` || string | The subject line for the email. | None | False |
| `body` || mapping |  
|| `text` | string | The plain-text representation of the email body. At least one of `body.text` or `body.html` should be specified. | None | False |
|| `html` | string | The HTML representation of the email body. At least one of `body.text` or `body.html` should be specified. | None | False |
| `timeoutSeconds` || integer | The amount of time to wait for a connection to the email server to be established. | None (default TCP timeout) | False |

Here is an example of the step in a Nebula workflow:


    steps:

    ...
       
    - name: email-sender-smtp
      image: projectnebula/email-sender-smtp:latest
      spec:
        server:  
          host: smtp.example.com
          port: 465
          username: me@example.com
          password:
            $type: Secret
            name: email-password
          tls: true
        from: me@example.com
        to: 
          - "wolf@example.com"
          - "hamster@example.com"
        cc:
          - "elephant@example.com"
          - "squirrel@example.com"
        bcc:
          - "otter@example.com"
          - "lion@example.com"
        subject: RE: Last night's episode of Lost.
        body:
          text: ZOMG! MIND BLOWN!
          html: |
            <!DOCTYPE html>
            <html>
              <body>
                <p>ZOMG! MIND BLOWN!</p>
              </body>
            </html>
        timeoutSeconds: 360