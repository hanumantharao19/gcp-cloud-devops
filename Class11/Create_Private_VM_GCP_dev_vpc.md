# 🛠️ Create a Private VM in Google Cloud using Custom VPC (`dev-vpc`)

This guide walks you through creating a **private virtual machine (VM)** in Google Cloud using a **custom VPC**, and accessing it securely using **IAP**. You’ll also install a basic web server on the VM.

---

## 🎯 Objective

- Create a **Custom VPC** (`dev-vpc`)
- Create a **Private VM** (without public IP)
- Access using **IAP** (Identity-Aware Proxy)
- Install **Apache (httpd)** on the VM
- Test the server from inside the VM

---

## 🧱 Step-by-Step Instructions

### ✅ Step 1: Create Custom VPC

```bash
gcloud compute networks create dev-vpc \
  --subnet-mode=custom
```

---

### ✅ Step 2: Create a Subnet

```bash
gcloud compute networks subnets create dev-subnet \
  --network=dev-vpc \
  --region=us-central1 \
  --range=10.10.0.0/24
```

---

### ✅ Step 3: Create Firewall Rule to Allow IAP (SSH)

```bash
gcloud compute firewall-rules create allow-ssh-iap \
  --network=dev-vpc \
  --allow=tcp:22 \
  --source-ranges=35.235.240.0/20 \
  --target-tags=allow-iap
```

> 🔍 **Why this IP range?**
>
> `35.235.240.0/20` is Google's **IAP (Identity-Aware Proxy)** IP range. This allows IAP to securely connect to your VM without needing an external IP.

---

### 🛑 Skip: Internal Firewall Rule

You **do not need** an internal communication firewall rule like:

```bash
gcloud compute firewall-rules create allow-internal ...
```

> ❗ Only needed if you have **multiple VMs** communicating internally.
> You can safely skip this if you're working with a **single VM**.

---

### ✅ Step 4: Create the Private VM

```bash
gcloud compute instances create private-vm \
  --zone=us-central1-a \
  --machine-type=e2-micro \
  --subnet=dev-subnet \
  --no-address \
  --tags=allow-iap \
  --image-family=ubuntu-2204-lts \
  --image-project=ubuntu-os-cloud
```

---

### ✅ Step 5: Grant IAP SSH Access to Your User

- Go to **IAM & Admin → IAM**
- Find your user/email
- Click ✏️ Edit → **Add Role**
- Add: `IAP-Secured Tunnel User`

---

### ✅ Step 6: Connect to VM via IAP

```bash
gcloud compute ssh private-vm \
  --zone=us-central1-a \
  --tunnel-through-iap
```

---

### ✅ Step 7: Install Apache Web Server

```bash
sudo apt update
sudo apt install apache2 -y
```

#### Test Web Server

```bash
curl http://localhost
```

> You should see the default Apache welcome message.

---

## ✅ Summary

| Task | Status |
|------|--------|
| Create VPC + Subnet | ✅ Done |
| Allow SSH via IAP | ✅ Done |
| Create Private VM | ✅ Done |
| Connect via IAP | ✅ Done |
| Install Apache | ✅ Done |

---

## 🧠 Bonus (Optional): Bastion Host Method

If not using IAP, you can create a **bastion VM with public IP** in the same VPC and connect to private VM via internal IP.

---

## 📩 Contact & Resources

- Haswitha Academy
- GitHub: [https://github.com/hanumantharao19](https://github.com/hanumantharao19)
- Email: haswithaacademy@gmail.com

---

#googlecloud #iap #privatevm #gcp #devops #vpc #telugu
