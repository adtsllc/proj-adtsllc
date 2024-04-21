
#define terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider block
provider "aws" {
  region = "us-east-1"
}

#Types of Blocks in Terraform
#Terraform Block
# It is used to define global configuration and behavior for terraform execution
#Setting the required Terraform version.
# Configuring the backend for storing the state file.
# Defining experimental or optional features.
#Specifying variables used across multiple modules or configurations.
#
#Provider Block
#The provider block is used to configure and define the provider for a specific cloud or infrastructure program,It specifies details such as the provider name and version, authentication credentials, and other settings. By correctly configuring the provider block, you ensure that Terraform knows which provider to use and how to authenticate with it.
# Configuring the provider for a specific cloud or infrastructure platform.
# Defining the authentication credentials required to interact with the provider.
##
#Data Block
# This block is used to fetch data from external sources or existing resources. we can use a data block to fetch information about existing resources, such as a list of available AWS AMIs or the currently existing state of a Kubernetes cluster. By utilizing data blocks, you can incorporate external data into your infrastructure configuration and make informed decisions based on that information.
# Retrieving information about existing infrastructure to be used in the Terraform configuration.
# Querying and filtering data for use in resource configuration.
# Example:
# data "aws_vpc" "existing_vpc" { id = "vpc-12345678" }
## 
# Resource Block
# It is used to declare and define the provider for a specific cloud or infrastructure program. Resources represent components such as virtual machines, networks, storage, databases, and other services. Each resource block specifies the resource type, name, and configuration parameters specific to that resource. By using resource blocks effectively, we can create and manage the desired infrastructure resources in a consistent and repeatable manner.
# Configuring the properties and attributes of the resources.
# Specifying dependencies and relationships between resources.
# Example:
# resource "aws_instance" "example" 
# { ami = "ami-0c94855ba95c71c99" 
#instance_type = "t2.micro" } 
##
# Module Block
# Defining and configuring reusable modules to encapsulate and manage infrastructure components. It allows us to organize and modularize your infrastructure code, promoting reusability, maintainability, and scalability.
# Including and configuring reusable modules in Terraform configurations.
# Encapsulating a set of resources and configurations into a self-contained module.
# Promoting modularity, reusability, and maintainability of infrastructure code.
# Example:
# module "vpc" { source = "./modules/vpc" region = "us-west-2" } 
##
# Variable Block
# Declaring input variables that can be provided during Terraform execution for flexible configurations.Variables enable you to give arguments your infrastructure and make it more flexible. You can define variables for values that may vary across environments or deployments, such as the number of instances or the size of a storage volume. By utilizing variable blocks, you can easily customize and reuse your configuration for different scenarios without modifying the underlying code.
# Defining input variables for the Terraform configuration.
# Providing flexibility and parameterization to the configuration.
# Allowing users to provide values during Terraform runs or through variable files.
# Example:
# variable "instance_count" { description = 
# "Number of instances to create" type
#  = number default = 1 } 
##
# Output Block
# Defining values that are displayed as output after executing terraform apply or terraform output commands.Outputs can include information like IP addresses, URLs, or resource identifiers that are useful for interacting with the given infrastructure. By defining output blocks, you can extract important information from your infrastructure and provide it to users or other systems for further actions or integrations.
# Exposing calculated or derived values from the Terraform configuration.
# Communicating important information to users after the Terraform run.
# Sharing outputs with other configurations or scripts.
# output "instance_ip" { value = aws_instance.example.
# public_ip description = "Public IP of the created instance" } 
##
# Local Block
# Declaring local variables within the Terraform configuration for easier code readability and reusability.Local variables are temporary and can be defined within a block to compute and store intermediate values that are used within the same configuration file. These variables are not exposed to other configurations or modules and are purely for internal use within the same configuration.
# Defining local variables within a Terraform configuration.
# Calculating derived values or performing transformations on other variables.
# Improving readability and reducing duplication by storing intermediate values.
# Example:
# locals { instance_name = "my-instance" 
# instance_tags = { Name = local.instance_name } } 
##
# Terraform_backend_config
# Configuring the backend-specific settings for storing the Terraform state file. The backend configuration is typically specified in a separate configuration file, often named backend.tf or included within the main.tf file. It defines the backend provider and the specific settings required to connect to and use the backend.
# Configuring Backend variables you can use the terraform_backend_config
# setting provider-specific backend configuration
# defining remote state encryption
# setting custom backend configuration
# Example:
# terraform_backend_config "s3" 
# { bucket = "terraform-state-bucket" key = 
# "terraform.tfstate" region = "us-west-2" }
##
# Provisoner Block
# Provisioners allow us to specify actions to be performed on local or remote machines to prepare resources for service. Provisioners allow us to perform tasks such as installing the desired software, configuring the resource, running scripts, or executing commands on the resource.
# Provisioners can be defined within a resource block and are executed in a specific order depending on the type of provisioner.