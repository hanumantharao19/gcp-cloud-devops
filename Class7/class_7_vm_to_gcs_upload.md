# Class 7: Upload File from VM to Google Cloud Storage Bucket

## 📘 Overview

In this class, we will learn how to create a VM in a custom VPC, install Google Cloud SDK and `gsutil`, and upload a file to a Cloud Storage bucket. We will also attach a service account to the VM so that it can access GCS securely without using any manual keys.

---

## 🎯 Objectives

- Create a VM in a custom VPC network
- Attach a service account with Storage permissions
- Install Google Cloud SDK and `gsutil` on the VM
- Upload a file from the VM to a Cloud Storage bucket

---

## 🛠️ Steps to Follow

### 1. Create a Service Account with Storage Admin Role

Before creating the VM, we need to create a service account that will have permission to access Cloud Storage.

#### Steps:

1. Go to GCP Console → Navigation Menu → **IAM & Admin > Service Accounts**
2. Click **Create Service Account**
3. Enter a name (e.g., `storage-access-sa`) and click **Create and Continue**
4. In the Role section, select **Cloud Storage > Storage Admin**
5. Click **Done**

This service account will be attached to the VM in the next step.

---

### 2. Create a VM in Custom VPC

1. Go to GCP Console → Navigation Menu → **Compute Engine > VM instances**
2. Click **Create Instance**
3. Enter instance name (e.g., `vm-gcs-demo`)
4. Select region and zone (e.g., `asia-south1-a`)
5. Choose **Ubuntu** OS (e.g., Ubuntu 20.04 LTS)
6. Under **Networking**, choose your custom VPC network and subnet (from Class 4)
7. Under **Management > Service Account**:
   - Select the existing service account created in Step 1

---

### 2. Connect to the VM

- Click the **SSH** button next to the instance in GCP console

---

### 3. Install Google Cloud SDK and `gsutil` on the VM

Run the following commands in the VM SSH terminal:

```bash
sudo apt update
sudo apt install -y curl apt-transport-https ca-certificates gnupg

# Add Google Cloud SDK source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | \
  sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
  sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Install Cloud SDK
sudo apt update && sudo apt install -y google-cloud-sdk
```

`gsutil` is included in the Cloud SDK.

---

### 4. Create, Upload, List, Download, and Delete File in Cloud Storage Bucket

1. Create a test file:

```bash
echo "Hello from VM!" > vm-upload.txt
```

2. Upload the file to your bucket:

```bash
gsutil cp vm-upload.txt gs://<your-bucket-name>/
```

3. Download the file from bucket:

```bash
gsutil cp gs://<your-bucket-name>/vm-upload.txt downloaded-from-bucket.txt
```

4. List files in the bucket:

```bash
gsutil ls gs://<your-bucket-name>/
```

5. Delete the uploaded file from the bucket:

```bash
gsutil rm gs://<your-bucket-name>/vm-upload.txt
```

> Replace `<your-bucket-name>` with the actual name of your bucket created in Class 6.

---

## ✅ Summary

- Created a VM in a custom VPC with Ubuntu OS
- Attached a service account with Storage Admin role
- Installed Google Cloud SDK and `gsutil` on the VM
- Uploaded a file to the Cloud Storage bucket from inside the VM

---

## 📘 Useful For:

- Beginners learning VM and storage interaction
- DevOps automation workflows
- GCP Associate Cloud Engineer Certification

---

**Next Class:** Use Terraform to create GCP resources (VMs, Buckets) automatically 🚀

