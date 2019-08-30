# Using workflows

Project Nebula uses YAML workflows to define the steps in an application deployment.

Each step in a Nebula workflow runs in a separate container. Nebula executes the steps simultaneously unless you explicitly define a sequential order for the steps to run in.

-   **[Understanding workflows](nebula_understanding_workflows.md)**  
Project Nebula uses YAML workflows to define the steps in an application deployment.
-   **[Writing a workflow](nebula_create_workflow.md)**  
Use a Project Nebula workflow to define the steps in your deployment.
-   **[Running a workflow](nebula_running_a_workflow.md)**  
Run a workflow from Nebula's web interface, or use the CLI.
-   **[Adding secrets](nebula_adding_secrets.md)**  
Add a secret to your workflow and then use Nebula's web interface, or the CLI to set a value for the secret.
-   **[Step specifications](nebula_step_specifications.md)**  
The specification \(`spec`\) section of a workflow defines the task that the step is performing.

