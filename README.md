# Terraform AWS Infrastructure Setup

This repository contains the **Terraform** configuration files required to provision and manage a secure cloud infrastructure on **Amazon Web Services (AWS)**. It automates the deployment of an EC2 virtual machine utilizing a custom Amazon Machine Image (AMI).

## 🚀 Infrastructure Components

The configuration provisions the following core AWS resources:
* **EC2 Instance**: A virtual machine initiated using the `ami-0b6d93d33ba97d99` image.


## 🛠️ Prerequisites

Ensure you have the following utilities configured before deployment:
* **[Terraform CLI](https://developer.hashicorp.com/terraform/downloads)** (v1.5.0 or higher recommended)
* **[AWS CLI](https://aws.amazon.com/cli/)** installed and authenticated via `aws configure`
* Valid AWS credentials with permissions for IAM, EC2, and VPC creation

## 📂 Repository Structure

```text
├── main.tf          # Core resource definitions (EC2, VPC, Security Groups)
└── README.md        # Project documentation
```

## 💻 Getting Started

Follow these operational steps to deploy the infrastructure:

### 1. Clone the Repository
```bash
git clone <your-repository-url>
cd <repository-directory>
```

### 2. Initialize Terraform
Download the required AWS provider plug-ins and set up the local backend state:
```bash
terraform init
```

### 3. Review the Execution Plan
Generate and inspect an execution plan to verify exactly what resources will be created or modified:
```bash
terraform plan
```

### 4. Deploy Infrastructure
Apply the configuration changes to build your infrastructure on AWS. Confirm the prompt by typing `yes`:
```bash
terraform apply
```

### 5. Clean Up Resources
To destroy all provisioned infrastructure and prevent ongoing AWS charges, run:
```bash
terraform destroy
```

## ⚙️ Configuration Variables

| Variable Name | Description | Default Value |
| :--- | :--- | :--- |
| `aws_region` | The targeted AWS region for deployment | `us-east-1` |
| `instance_type` | The computing hardware specifications of the instance | `t3.micro` |
| `ami_id` | The Amazon Machine Image identifier used to launch EC2 | `ami-0b6d93d33ba97d99` |

---
*Disclaimer: This configuration creates live resources on AWS which may incur financial costs. Ensure to run `terraform destroy` when testing is complete.*
