# 💽 Google Cloud Persistent Disks – Types and How to Attach

This document explains the different types of disks available in Google Cloud and how to attach a new disk to a VM, format it, and mount it for use.

---

## 📦 Types of Disks in Google Cloud

| Disk Type         | Description                                                       | Best For                           |
|------------------|-------------------------------------------------------------------|------------------------------------|
| **Standard (pd-standard)** | HDD-based. Cost-effective, lower performance.                     | Backup, less frequent access       |
| **Balanced (pd-balanced)** | SSD-based. Balance of price and performance.                   | General workloads, boot disks      |
| **SSD (pd-ssd)**         | High performance SSD. More expensive.                         | Databases, high IOPS apps          |
| **Extreme (pd-extreme)**   | Ultra-high performance. Requires tuning.                     | High-end databases, analytics      |
| **Local SSD**         | Attached to specific VM, not persistent. Fast but temporary.  | Temporary storage, caching         |

---

## 🛠️ Step-by-Step: Attach a Disk to a VM and Format It

### ✅ Step 1: Create a New Disk

```bash
gcloud compute disks create my-data-disk   --size=10GB   --type=pd-balanced   --zone=us-central1-a
```

---

### ✅ Step 2: Attach Disk to Existing VM

```bash
gcloud compute instances attach-disk my-instance   --disk=my-data-disk   --zone=us-central1-a
```

---

### ✅ Step 3: Connect to VM via SSH

```bash
gcloud compute ssh my-instance --zone=us-central1-a
```

---

### ✅ Step 4: Format the Disk

Check the device name (usually `/dev/sdb` or similar):

```bash
lsblk
```

Format the new disk with ext4:

```bash
sudo mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb
```

---

### ✅ Step 5: Mount the Disk

Create a directory to mount:

```bash
sudo mkdir -p /mnt/mydisk
```

Mount the disk:

```bash
sudo mount -o discard,defaults /dev/sdb /mnt/mydisk
```

---

### ✅ Step 6: Make Mount Permanent (Optional)

To mount the disk automatically after reboot:

1. Get the UUID:

```bash
sudo blkid /dev/sdb
```

2. Edit the `/etc/fstab` file:

```bash
sudo nano /etc/fstab
```

Add this line at the end (replace `UUID=xxxx` with actual UUID):

```
UUID=xxxx /mnt/mydisk ext4 discard,defaults,nofail 0 2
```

---

## ✅ Summary

- You created a new persistent disk
- Attached it to a VM
- Formatted and mounted it
- (Optional) Made the mount persistent

This is useful for separating storage from compute, storing application data, logs, backups, etc.

---

📩 **Contact**: haswithaacademy@gmail.com  
🔗 **GitHub**: [https://github.com/hanumantharao19](https://github.com/hanumantharao19)

#googlecloud #gcp #persistentdisk #vm #storage #devops #telugu
