# Class 5: GCP IAM - Users, Roles & Service Accounts

## 📘 Overview

In this class, we will learn about **Identity and Access Management (IAM)** in Google Cloud. IAM helps you securely control who can do what in your GCP project. This is **critical for DevOps**, production-grade deployments, and is a key topic in the **GCP Associate Cloud Engineer certification**.

## 🔐 What is IAM?

IAM = **Identity and Access Management**

- It defines **who (identity)** can access **what (resource)** and **what actions (roles)** they can perform.
- IAM helps apply the principle of **least privilege**

### 📦 IAM Resources:

- Users (your Gmail or GCP user)
- Service Accounts (identities for apps & automation)
- Groups (via Google Workspace)

---

## 👥 What are IAM Roles?

IAM Roles define **what actions** an identity can perform on which resources.

### 🔸 3 Types of Roles:

| Type                 | Description                                             |
| -------------------- | ------------------------------------------------------- |
| **Basic Roles**      | Project-level (Owner, Editor, Viewer). Very broad.      |
| **Predefined Roles** | More granular (e.g., `compute.admin`, `storage.viewer`) |
| **Custom Roles**     | You define exactly which permissions are allowed        |

---

## 🧑‍💻 What is a Service Account?

- A **Service Account** is a special type of Google account intended to represent non-human users such as applications, services, or virtual machines.
- These accounts are used to authenticate and authorize automation tools or services to interact with GCP resources securely.

### 🔧 Use Cases:

Service accounts are used in many real-world scenarios:

- **CI/CD tools (like Jenkins or Terraform)**: Automate the creation of infrastructure or deployments in GCP.
- **Apps or Microservices**: Allow services to connect to other GCP services like Cloud Storage or Pub/Sub.

### ✅ Why Use Service Accounts:

- Allow one service or app to securely connect with another in GCP (e.g., a VM sending logs to Logging)
- Let tools like Jenkins or Terraform access GCP without using a personal login
- Avoid using or sharing usernames and passwords in automation
- Only give the needed permissions — follow least privilege
- Help apps in Compute Engine, GKE, or Cloud Functions connect to GCP services like Storage or Pub/Sub

---

## 🛠️ Create & Assign IAM Roles to Service Account (via UI)

### 1. Create Service Account

- Go to **IAM & Admin > Service Accounts**
- Click **Create Service Account**
  - **Name**: `demo-service-account`
  - **ID**: `demo-sa`
- Click **Create & Continue**
- Assign a Role (e.g., `Compute Admin`, `Storage Admin`)
- Done ✅

### 2. Grant Access to Project

- Go to **IAM & Admin > IAM**
- Click **+GRANT ACCESS**
- Add your **Service Account email**
- Assign appropriate roles

---

## ⚙️ Create & Assign Roles to Service Account (via gcloud CLI)

### 1. Create Service Account:

```bash
gcloud iam service-accounts create demo-sa \
    --description="Demo service account for class 5" \
    --display-name="Demo SA"
```

### 2. Assign IAM Role to Project:

```bash
gcloud projects add-iam-policy-binding <PROJECT_ID> \
    --member="serviceAccount:demo-sa@<PROJECT_ID>.iam.gserviceaccount.com" \
    --role="roles/compute.admin"
```

### 3. View Service Account Permissions:

```bash
gcloud iam service-accounts get-iam-policy demo-sa@<PROJECT_ID>.iam.gserviceaccount.com
```

---

## 🧱 How to Create a Custom Role

### Via UI:

- Go to **IAM & Admin > Roles > Create Role**
- Enter Role ID: `custom.vmStartStop`
- Choose project scope
- Add Permissions: `compute.instances.start`, `compute.instances.stop`
- Save

### Via gcloud:

```bash
gcloud iam roles create custom.vmStartStop \
    --project=<PROJECT_ID> \
    --title="Custom VM Control Role" \
    --permissions="compute.instances.start,compute.instances.stop" \
    --stage="GA"
```


