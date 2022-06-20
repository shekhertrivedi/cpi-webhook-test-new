
provider "aws" {
  region     = "ap-south-1"
}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
    Owner = "operations"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

output "sample_output1" {
  value       = aws_vpc.first-vpc.id
  description = "The VPC ID sensitive"
  sensitive   = true
}

output "sample_output2" {
  value       = aws_vpc.first-vpc.id
  description = "The VPC ID non-sensitive"
}

output "sample_output3" {
  value       = aws_vpc.first-vpc.tags_all
  description = "all tags"
}

# resource "aws_instance" "my-ec2-server1" {  // Sample example => https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
#   ami           = "ami-04bde106886a53080" // AMI should be specific to the region selected
#   instance_type = "t2.micro"
#   tags = {
#     Name = "ubuntu1"
#   }
# }

# resource "aws_instance" "my-ec2-server2" {  // Sample example => https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
#   ami           = "ami-04bde106886a53080" // AMI should be specific to the region selected
#   instance_type = "t2.micro"
#   tags = {
#     Name = "ubuntu2"
#   }
# }
