# Automated AWS EC2 Infrastructure with Terraform

A production-ready, modular Terraform configuration to automatically provision a secure, public-facing Ubuntu Linux server on Amazon Web Services (AWS). This architecture dynamically looks up the latest official Ubuntu images and configures an isolated network firewall firewall to allow immediate SSH management.

## 🏗️ Architecture Overview

The configuration deploys the following infrastructure assets into your AWS environment:
* **Dynamic Data Source Lookup:** Automatically queries Canonical's official marketplace vault to fetch the absolute newest stable **Ubuntu 24.04 LTS** image at build-time.
* **EC2 Virtual Server (`t2.micro`):** Launches a compute node deployed with your designated AWS SSH key pair signature injected at system boot.
* **Network Security Group:** Operates as a stateful cloud firewall that opens incoming **Port 22 (SSH)** traffic from the public internet (`0.0.0.0/0`) while allowing full outbound access for package installations.

## 📁 Project Directory Map

Organize your infrastructure files using the standard modular layout layout below:

```text
├── providers.tf      # Declares version limits and targets cloud vendors
├── variables.tf      # Input parameters (e.g., instance sizing, names)
├── main.tf           # Primary resource blueprints (EC2, Security Groups)
├── outputs.tf        # Runtime metrics returned to screen (Public IPs, ARNs)
└── README.md         # Documentation roadmap (This file)
```

## 🚀 Deployment Playbook

Follow these sequential steps to log into your account, preview the infrastructure changes, and apply them.

### Step 1: Initialize Your Environment Variables
To keep your secret keys safe and out of public tracking repositories, inject your cloud authentication parameters locally into your terminal session space:

```bash
export AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
export AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
export AWS_DEFAULT_REGION="us-east-1"
```
*(Alternatively, run `aws configure` to commit them globally to your home directory structure).*

### Step 2: Initialize Workspace Backends
Download the necessary HashiCorp provider plugins required to translate your code into active AWS API operations:
```bash
terraform init
```

### Step 3: Preview the Plan
Run a simulation to verify the architectural blueprints before making any live changes to your AWS account balance:
```bash
terraform plan
```

### Step 4: Execute the Infrastructure Build
Compile the configurations and instantiate the virtual resources in your cloud environment:
```bash
terraform apply
```
*When prompted by the utility framework, type `yes` and hit Enter.*

---

## 🔐 System Access (SSH Connect)

Once the deployment finishes executing successfully, Terraform prints out the live target IP address. 

1. Lock down the internal read permissions of your downloaded key file so your local shell engine accepts the cryptography:
   ```bash
   # On Linux/macOS systems
   chmod 400 awskey.pem
   ```

2. Tunnel through the firewall straight into your server using the official built-in administrative account:
   ```bash
   ssh -i "awskey.pem" ubuntu@<YOUR_INSTANCE_PUBLIC_IP>
   ```

## 🧹 Deconstruction (Tear Down)
To completely delete the server, dismantle the security group rules, and prevent unintended AWS subscription charges once testing is finished, run:
```bash
terraform destroy
```
*Type `yes` to confirm permanent deconstruction.*
