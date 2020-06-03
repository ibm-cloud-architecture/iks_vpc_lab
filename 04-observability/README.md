
# DevOps/Observability Services

This folder contains the terraform code to implement the *DevOps/Observability Services* layer of the solution architecture and is executed in an [IBM Cloud Schematics](https://cloud.ibm.com/schematics/overview) workspace.

IBM Cloud provides a variety of DevOps services to support full stack automation of your cloud environments, configuration and application workloads. This lab focuses on the use of Terraform in the IBM Cloud Terraform provider with Schematics to automate the provisioning of your environments and you will also explore the monitoring and management services. 

The diagram below adds the following IBM Cloud resources:
- the Schematics and Git repository services for provisioning 
- the Logging, Monitoring and Auditing services

![DevOps Diagram](../images/ex3_diagram_devops.png)

## Dependencies
-   The *Workspace ID* (variable: `groups_ws_id`) of the [01-groups](../01-groups) workspace instance.
-   The *Workspace ID* (variable: `iks_ws_id`) of the [03-iks](../03-iks) workspace instance.

## Documentation References
-   [Git repository](https://cloud.ibm.com/docs/ContinuousDelivery?topic=ContinuousDelivery-git_working)
-   [IBM Cloud Schematics](https://cloud.ibm.com/docs/schematics?topic=schematics-about-schematics) 
-   [LogDNA](https://cloud.ibm.com/docs/containers?topic=containers-health#logging_overview)
-   [Sysdig Monitoring](https://cloud.ibm.com/docs/Monitoring-with-Sysdig?topic=Sysdig-about)
-   [Activity Tracker](https://cloud.ibm.com/docs/containers?topic=containers-at_events)