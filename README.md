# Production-Ready VPC Architecture

A comprehensive Terraform configuration for deploying a production-ready AWS VPC infrastructure with public and private subnets, Internet Gateway, NAT Gateway, and EC2 instances.

## Architecture Overview

This infrastructure creates:

- **VPC** - Virtual Private Cloud with CIDR block `10.0.0.0/16`
- **Public Subnet** - `10.0.1.0/24` with direct internet access via IGW
- **Private Subnet** - `10.0.11.0/24` with outbound internet via NAT Gateway
- **Internet Gateway** - For public subnet internet connectivity
- **NAT Gateway** - For private subnet outbound connectivity
- **Route Tables** - Separate routing for public and private subnets
- **Security Groups** - EC2 instance security configurations
- **EC2 Instances** - One in public subnet, one in private subnet
- **Key Pair** - SSH key for EC2 access

## Directory Structure

```
Production-ReadyVPCArchitecture/
├── provider.tf              # AWS provider configuration
├── variables.tf             # Variable definitions
├── terraform.tfvars         # Variable values
├── main.tf                  # VPC resource
├── subnets.tf               # Public and private subnets
├── internet_gateway.tf      # Internet Gateway
├── nat_gateway.tf           # NAT Gateway and EIP
├── route_tables.tf          # Route table configurations
├── security_groups.tf       # Security group rules
├── ec2_instances.tf         # EC2 instance definitions
├── key_pair.tf              # SSH key pair generation
├── outputs.tf               # Output values
├── .gitignore               # Git ignore file
└── README.md                # This file
```

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with credentials
- AWS account with appropriate permissions

## Installation

1. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/production-ready-vpc-infrastructure.git
cd Production-ReadyVPCArchitecture
```

2. Initialize Terraform:
```bash
terraform init
```

3. Review the plan:
```bash
terraform plan
```

4. Apply the configuration:
```bash
terraform apply
```

## Variables

Edit `terraform.tfvars` to customize:

```hcl
region = "us-east-1"  # AWS region (default: us-east-1)
```

Key variables defined in `variables.tf`:
- `region` - AWS region for deployment

## Outputs

After applying, Terraform will output:

```
public_instance_public_ip    - Public IP of the instance in public subnet
public_instance_private_ip   - Private IP of the instance in public subnet
private_instance_private_ip  - Private IP of the instance in private subnet
private_key_path             - Path to SSH private key file
key_pair_name                - Name of the AWS key pair
```

## How to Connect to Instances

### Public Instance (via SSH):
```bash
ssh -i production-ready-key.pem ec2-user@<public_instance_public_ip>
```

### Private Instance (via Bastion Host):
```bash
ssh -i production-ready-key.pem ec2-user@<public_instance_public_ip>
# Then from public instance:
ssh -i production-ready-key.pem ec2-user@<private_instance_private_ip>
```

## Security Considerations

- ⚠️ Default security group allows SSH (22) from anywhere: `0.0.0.0/0`
- ⚠️ Private key is stored locally in `production-ready-key.pem`
- 📌 For production, restrict SSH access to specific IPs
- 📌 Enable VPC Flow Logs for network monitoring
- 📌 Consider using AWS Systems Manager Session Manager for EC2 access

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Cost Estimation

Approximate monthly costs (as of Feb 2026):
- VPC: Free
- NAT Gateway: ~$32 (data processing charges apply)
- EC2 t2.micro: ~$7-10 (eligible for free tier for 12 months)
- Elastic IP: Free (if associated)

**Total: ~$40-45/month** (varies by region and usage)

## Troubleshooting

### Error: CIDR is invalid
- Ensure subnet CIDR blocks are within VPC CIDR range

### Error: Key pair already exists
- Remove existing key pair or use different name in `key_pair.tf`

### Terraform state issues
- `.tfstate` files are in `.gitignore` for security
- State is stored locally; use S3 backend for team collaboration

## Contributing

Feel free to fork and submit pull requests for improvements!

## License

This configuration is provided as-is. Modify as needed for your use case.

## Support

For issues or questions, open a GitHub issue or contact the repository maintainer.
