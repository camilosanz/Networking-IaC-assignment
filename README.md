# AWS VPC provision (Terraform)

### Network requirements
We have 4 offices:
- Office 1: 80 hosts
- Office 2: 500 hosts
- Office 3: 40 hosts
- Remote Office: 30 hosts (public subnet)

These were the modules used to provision a vpc with above requirements:

| Module | README |
| ------ | ------ |
| VPC | https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest|
| Security group | https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest|
| ec2-instance | https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest|

##### VPC: 
Generates and configure a vpc module with its routing tables, internet access getways, among other features. 
##### Security group: 
Generates and configure a security group with default or user defined rules.
##### ec2-instance:
Generates and configure an ec2 instance and allows its attachment to a given VPC, security group and keyPair.
##### KeyPair
It was necessary to add a resource to generate a keypair in the working directory which may be found as:

```sh
terraform-key-pair.pem
```