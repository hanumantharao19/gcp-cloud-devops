# GCP: Custom VPC, Subnet, VM Setup, and Web Server Installation
  - VPC diagram reference: https://cloud.google.com/vpc/docs/overview
## ✨ 1. Introduction

- **What is a VPC?**
  - A VPC (Virtual Private Cloud) in GCP is a logically isolated network where you can run your virtual machines, containers, and other services securely.
  - It provides full control over IP address ranges, subnets, routes, and firewall rules.

- **Types of VPCs in GCP:**
  - **Auto mode VPC:**
    - Automatically creates subnets in each region.
    - Subnets have pre-defined IP ranges.
    - Good for quick setups or learning environments.
  - **Custom mode VPC:**
    - You manually define subnets, regions, and IP ranges.
    - Preferred in production for greater control, security, and custom architecture.

- **Why Custom VPC?**
  - Better isolation and security
  - Fine-grained control over IP addressing
  - Required for most real-world DevOps or cloud infrastructure use cases

---

## 💡 2. Create Custom VPC & Subnet

1. Go to **VPC network > VPC networks > Create VPC network**
2. Fill the form:
   - **Name**: `custom-vpc`
   - **Subnet creation mode**: Custom
3. Add Subnet:
   - **Region**: Select your preferred region (e.g., `us-central1`)
   - **Subnet name**: `custom-subnet`
   - **IP range**: `10.0.0.0/24`
4. Click **Create**

---

## 🔒 3. Create Firewall Rules

- **What is a Firewall in GCP?**
  - GCP firewall rules control incoming and outgoing traffic to VM instances.
  - Firewalls are defined at the VPC level, not the VM level.
  - Rules allow or deny traffic based on IPs, ports, and protocols.

Navigate to **VPC network > Firewall rules > Create firewall rule**

### Rule 1: Allow SSH

- **Name**: `allow-ssh`
- **Network**: `custom-vpc`
- **Targets**: All instances in the network
- **Source IP ranges**: `0.0.0.0/0`
- **Protocols & ports**: TCP `22`

### Rule 2: Allow HTTP

- **Name**: `allow-http`
- **Network**: `custom-vpc`
- **Targets**: All instances in the network
- **Source IP ranges**: `0.0.0.0/0`
- **Protocols & ports**: TCP `80`

---

## 🚀 4. Create a VM in Custom VPC

1. Go to **Compute Engine > VM instances > Create Instance**
2. Fill details:
   - **Name**: `web-vm`
   - **Region/Zone**: Match subnet region
   - **Machine type**: e2-micro (Free tier eligible)
   - **Boot disk**: Ubuntu 22.04 LTS
3. Under **Networking**:
   - Select **Network**: `custom-vpc`
   - **Subnet**: `custom-subnet`
   - **External IP**: Ephemeral
4. Click **Create**

---

## 🚼 5. Connect to VM & Install Web Server

1. Click **SSH** to connect to your VM
2. Run the following commands to install Apache:

```bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
```
3. Get external IP of the VM (visible in VM list)
4. Access the website in your browser
   - You should see the Apache2 Ubuntu Default Page.
