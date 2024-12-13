terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}



resource "random_pet" "example_var" {
  length = 4
}

locals {
    sub_resource = {
        example_var = "subresource-${random_pet.example_var.id}"
    }
}

output "example_var" {
    value = random_pet.example_var.id
}
output "sub_resource" {
    value = local.sub_resource
}
