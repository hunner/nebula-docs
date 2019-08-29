# Setting up Project Nebula

To set up Nebula, integrate a repository using Nebula's web interface, and install the command-line interface \(CLI\).

## Integrate a repository with Project Nebula

You must integrate a repository with Nebula before you can add a workflow.

To integrate your repository, log in to the Nebula web interface at [http://ui.prod.nebula.puppet.net/](http://ui.prod.nebula.puppet.net/) and click **Integrations** \> **Add Integration**.

## Download and install the Nebula CLI

Use the Nebula command line interface \(CLI\) to manage your workflows and secrets.

To set up the Nebula CLI:

1.  Download `nebula-cli-v1.2.0-darwin-amd64` from Nebula's [releases page](https://github.com/puppetlabs/nebula-cli/releases/download/v1.2.0/nebula-cli-v1.2.0-darwin-amd64).
2.  Rename the file `nebula-cli`:

    ```
    mv nebula-cli-v1.2.0-darwin-amd64 nebula-cli 
    ```

3.  Make the file executable:

    ```
    chmod +x nebula-cli
    ```

4.  Log in to Nebula with your username and password:

    ```
    ./nebula-cli login
    ```


