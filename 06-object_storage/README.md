
# Data Services

This folder contains the terraform code to implement the *Data Services* layer of the solution architecture and is executed in an [IBM Cloud Schematics](https://cloud.ibm.com/schematics/overview) workspace.

The data services are provisioned and then bound to the Kubernetes cluster namespace. IBM provides multiple database and storage options for your application workloads. For this lab, PostgreSQL, block storage and object storage services are included. Automation provisions, assigns access policies, binds to the namespace and encrypts data.  

The diagram below adds the following IBM Cloud resources:
- Object storage bucket
- PostgreSQL database
- Block storage for VPCs

![DevOps Diagram](../images/ex3_diagram_data.png)

## Dependencies
-   The *Workspace ID* (variable: `groups_ws_id`) of the [01-groups](../01-groups) workspace instance.
-   The *Workspace ID* (variable: `key_ws_id`) of the [04-key_protect](../04-key_protect) workspace instance.

## Documentation References
-   [IKS namespace quota](https://kubernetes.io/docs/concepts/policy/resource-quotas/#quota-scopes)
-   [Block Storage](https://cloud.ibm.com/docs/vpc?topic=vpc-block-storage-about) 
-   [IBM Cloud Database for PostgreSQL](https://cloud.ibm.com/docs/services/databases-for-postgresql?topic=databases-for-postgresql-getting-started)
-   [Object Storage](https://cloud.ibm.com/docs/services/cloud-object-storage?topic=cloud-object-storage-getting-started)