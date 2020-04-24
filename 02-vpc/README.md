
### About
This Terraform will create the VPC along with Zones, subnets and public gateway for the VPC on IBM Cloud.

NOTE: This Terraform configuration is part of IBM Cloud Schematics lab series and is expected to be part of lab defined [here](../schematics/01-vpc).
### Prerequisite

* This has been tested using Terraform v0.11.x we advise you use this version as we will test your code with the same

* Export ibmcloud_api_key to IC_API_KEY . Refer [here](https://cloud.ibm.com/docs/iam?topic=iam-userapikey#userapikey) to generate ibmcloud_api_key.

### Variables

#### Input
|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|unique_id|a unique string to differentiate the names of resource in a multi-tenant cloud account|orangeuglad|
|ibm_region|the ibm cloud regiuon for the lab|us-south|
|resource_group|the resource group name|default|
|labuser id|the IBMid of the lab participant|userid.ibm.com|

#### Output
|Variable Name|Description|
|-------------|-----------|
|vpc_id||
|subnet_ids||

#### Validate

Execute "terraform output" command to verify output variable are set.

#### Clean-up
terraform destory

*NOTE: Given that this Terraform is part of IBM Cloud Schematics lab, it is advised to use clean-up script provided in [IBM Cloud Schematics lab](../schematics/01-vpc) to ensure any dependencies are taken care off during clean up.*