# Connecting Two VMs in Different VPCs in Google Cloud

This guide walks through step-by-step instructions to connect **VM-A** (in `dev-vpc`) with **VM-B** (in `qa-vpc`) in **Google Cloud Platform (GCP)**.

---

## 📌 Prerequisites

- GCP project setup (e.g. `hanu-dev-project-123`)
- `gcloud` CLI installed and authenticated
- Billing enabled

---

## 🛠️ Step-by-Step Setup

### 1️⃣ Create Two VPCs

```bash
gcloud compute networks create dev-vpc \
    --subnet-mode=custom

gcloud compute networks create qa-vpc \
    --subnet-mode=custom
```

### 2️⃣ Create Subnets for Each VPC

```bash
gcloud compute networks subnets create dev-subnet \
    --network=dev-vpc \
    --range=10.10.0.0/24 \
    --region=us-central1

gcloud compute networks subnets create qa-subnet \
    --network=qa-vpc \
    --range=10.20.0.0/24 \
    --region=us-central1
```

### 3️⃣ Create VPC Peering Between VPCs

```bash
# Peering from dev-vpc to qa-vpc
gcloud compute networks peerings create dev-to-qa \
    --network=dev-vpc \
    --peer-network=qa-vpc \
    --auto-create-routes

# Peering from qa-vpc to dev-vpc
gcloud compute networks peerings create qa-to-dev \
    --network=qa-vpc \
    --peer-network=dev-vpc \
    --auto-create-routes
```

### 4️⃣ Create Firewall Rules to Allow ICMP and SSH

```bash
gcloud compute firewall-rules create allow-icmp-ssh-vpc-a \
  --network=dev-vpc \
  --allow=tcp:22,icmp \
  --source-ranges=0.0.0.0/0 \
  --target-tags=allow-ssh

gcloud compute firewall-rules create allow-icmp-ssh-vpc-b \
  --network=qa-vpc \
  --allow=tcp:22,icmp \
  --source-ranges=0.0.0.0/0 \
  --target-tags=allow-ssh
```

### 5️⃣ Create VM-A and VM-B

```bash
gcloud compute instances create vm-a \
  --zone=us-central1-a \
  --machine-type=e2-micro \
  --subnet=dev-subnet \
  --tags=allow-ssh \
  --image-family=debian-11 \
  --image-project=debian-cloud

gcloud compute instances create vm-b \
  --zone=us-central1-a \
  --machine-type=e2-micro \
  --subnet=qa-subnet \
  --tags=allow-ssh \
  --image-family=debian-11 \
  --image-project=debian-cloud
```

### 6️⃣ Connect from VM-A to VM-B

#### Step A: SSH into VM-A

```bash
gcloud compute ssh vm-a --zone=us-central1-a
```

#### Step B: Ping VM-B Internal IP from VM-A

```bash
ping 10.20.0.2   # Replace with VM-B's internal IP
```

You should receive responses if everything is setup correctly.

---

## ✅ Verification Checklist

-

---

## 🔒 Notes

- You **must use internal IPs** when connecting between VPCs.
- Public IP is **not needed** for intra-VPC communication.
- Ensure **no overlapping CIDR ranges** between VPCs.

---

## 📘 References

- [GCP VPC Peering](https://cloud.google.com/vpc/docs/vpc-peering)
- [GCP Firewall Rules](https://cloud.google.com/vpc/docs/firewalls)

