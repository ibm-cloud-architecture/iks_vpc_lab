
# Security Services - Certificate Manager

This folder contains the terraform code to implement the *Security Services - Certificate Manager* layer of the solution architecture and is executed in an [IBM Cloud Schematics](https://cloud.ibm.com/schematics/overview) workspace.

IBM Cloud security services used in this lab include Key Protect used to manage encryption keys for data at rest. Certificate manager manages the SSL certificates for data in motion. Container registry includes a set of security services for your container images. 

The diagram below adds the following IBM Cloud resources:
- the Key Protect service for encryption key management
- The Container registry to manage images and security 
- The Certificate Manager services for SSL certificates

![Security Diagram](../images/ex3_diagram_security.png)

### Certificate Management

Certificate Manager (CMS) helps you to obtain, store and manage SSL/TLS certificates. You can import SSL/TLS certificates that you obtain for your apps and services, store them securely, and get a central view of the certificates that you are using. Or, you can order public certificates through Certificate Manager from supported CAs. In this lab we create an open-ssl certificate and import it.

The figure below reflects how we use CMS in this architecture


![Certificate Manager](../images/ex8_cms.png)


## Dependencies
-   The *Workspace ID* (variable: `groups_ws_id`) of the [01-groups](../01-groups) workspace instance.
-   The *Workspace ID* (variable: `key_ws_id`) of the [04-key_protect](../04-key_protect) workspace instance.

## Documentation References
-   [Key Protect](https://cloud.ibm.com/docs/key-protect?topic=key-protect-about)
-   [Certificate Management Service](https://cloud.ibm.com/docs/services/certificate-manager?topic=certificate-manager-getting-started) 
-   [IBM Container Registry](https://cloud.ibm.com/docs/Registry?topic=va-va_index)
