
# Team Kubernetes Namespace

This folder contains the terraform code to implement the *Team Kubernetes Namespace* layer of the solution architecture and is executed in an [IBM Cloud Schematics](https://cloud.ibm.com/schematics/overview) workspace.

### Manage Multiple Teams

One of the benefits of using Kubernetes cluster in a public cloud is the abiltiy to manage multiple teams within the cluster supporting a multi-tenant model. Using Schematics and terraform scripts, you can componentize the architecture automation to create one or more namespaces ([10-team_iks_namespace](../10-team_iks_namespace)),  object storage buckets ([09-team_cos_bucket](../09-team_cos_bucket)) or Postgresql databases ([08-team-database](../08-team-database)). The components are implemented in IBM Cloud with Schematics workspaces, Terraform scripts and folders within the git repository.  Benefits include: 

- maintain the terraform scripts in one folder for each of these components in the git repository 
- create a Schematics workspace for each **instance** of those components
- provision, change and deprecate the component instances through the workspace
- use the output variables and schematics data blocks to retrieve parameters from other workspaces

### Namespace Binding

The final step with provisioning the database and storage service is to bind the service instance to the namespace. The terraform in this folder creates the kubernetes namespace in the clustter and binds the database and object storage to the namespace.


## Dependencies
-   The *Workspace ID* (variable: `groups_ws_id`) of the [01-groups](../01-groups) workspace instance.
-   The *Workspace ID* (variable: `iks_ws_id`) of the [03-iks_cluster](../03-iks_cluster) workspace instance.
-   The *Workspace ID* (variable: `cos_ws_id`) of the [06-team_cos_bucket](../06-team_cos_bucket) workspace instance.
-   The *Workspace ID* (variable: `db_ws_id`) of the [08-team_database](../08-team_database) workspace instance.


## Documentation References
-   [Binding Services](hhttps://cloud.ibm.com/docs/containers?topic=containers-service-binding#bind-services)
