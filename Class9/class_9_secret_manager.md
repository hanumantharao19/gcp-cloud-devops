# 🔐 Class 9: Google Secret Manager in GCP with Hands-on | Secure Automation in Telugu

## 📘 Overview

In this class, we will learn about **Google Secret Manager**, how to securely store and access sensitive information like passwords and API keys. We will use both **UI and CLI**. This is very useful in **DevOps automation**, especially in CI/CD pipelines.

---

## 🎯 Topics Covered

- What is Secret Manager?
- Why not hardcode credentials in code?
- How to create secrets using UI
- How to retrieve secrets using CLI
- IAM roles and permissions
- Real-world examples

---

## 💡 What is Google Secret Manager?

Google Secret Manager is a secure and centralized place to store **API keys, passwords, database credentials**, and other secrets.

It provides:

- **Encryption by default**
- **Access control** using IAM
- **Audit logs** to track usage

### 🚫 Why Not Hardcode Credentials?

- If you write passwords or keys directly in your source code, they can be exposed accidentally
- Hardcoded secrets are unsafe in GitHub or version control
- Secret Manager keeps sensitive data **secure, encrypted, and accessible only to authorized users or services**

---

## 🧪 Hands-On Lab

### 🖥️ Accessing Secret Manager from Local System

If you want to use **gcloud CLI** on your laptop to access secrets using a **service account**, follow these steps:

#### 🔹 Option 1: Use Service Account Key (JSON file)

1. Go to GCP Console > IAM & Admin > Service Accounts
2. Select your service account (e.g., `gcp-cloud-devops`)
3. Before creating the key, click **Permissions** tab
4. Click **Grant Access** and add the following role to your service account:
   - Role: **Secret Manager Secret Accessor**
5. Click **Save** to apply the permission
6. Then go back and click **Create Key** → Select **JSON** → Download the key file to your system
7. On your local system, run the following:

```bash
# Step 1: Authenticate using the service account key
gcloud auth activate-service-account --key-file="path/to/key-file.json"

# Step 2: Set your active project
gcloud config set project <PROJECT_ID>
```

✅ Your CLI is now configured to use the service account for all GCP commands.

📌 You must also give the service account **Secret Manager Secret Accessor** role to allow it to read secrets:

```bash
gcloud projects add-iam-policy-binding <PROJECT_ID> \
  --member="serviceAccount:gcp-cloud-devops@<PROJECT_ID>.iam.gserviceaccount.com" \
  --role="roles/secretmanager.secretAccessor"
```

#### 🔹 Option 2: Use Logged-in User Account (without service account key)

If you don’t want to use a service account key, you can log in using your Google user account:

```bash
# Authenticate using your user account
gcloud auth login

# Set your default project
gcloud config set project <PROJECT_ID>
```

✅ This is easier for quick testing on your personal machine. For automation, use a service account.

---

### 🔹 Step 1: Create a Secret via **UI** and **Command Line**

#### 📌 Using GCP Console (UI)

1. Open the GCP Console and go to **Secret Manager**
2. Click **Create Secret**
3. Enter a name for the secret, for example: `my-api-key`
4. Enter the secret value (e.g., `12345-abcde`)
5. Keep the replication policy as **Automatic**
6. Click **Create**

#### 📌 Using gcloud CLI

You can also create and manage secrets using the command line:

```bash
# Create a secret
gcloud secrets create my-api-key --replication-policy="automatic"

# Add a secret version (the actual value)
echo -n "12345-abcde" | gcloud secrets versions add my-api-key --data-file=-
```

### 🔸 Step 2: Access Secret via **gcloud CLI**

```bash
# View the secret value
 gcloud secrets versions access latest --secret=my-api-key
```

> ✅ You must have Secret Manager Accessor role to view secrets via CLI

---

### 🔐 IAM Permissions Required

To work with Secret Manager, assign the following roles:

- **Secret Manager Admin**: Can create, update, and delete secrets
- **Secret Manager Secret Accessor**: Can only read secrets

```bash
# Example to give a user access to view secrets:
gcloud projects add-iam-policy-binding <PROJECT_ID> \
  --member="user:someone@gmail.com" \
  --role="roles/secretmanager.secretAccessor"
```

---

## 🌍 Real-World Example

Let’s say you want to store a **database password** or **API key**:

1. You create a secret like `db-password`
2. Your application or script retrieves it securely during runtime
3. You never expose the key in your code or logs

This is very useful in:

- CI/CD pipelines (like Jenkins)
- Automation scripts
- Cloud Functions, Cloud Run, etc.

---

## ✅ Summary

- Use Secret Manager to **store secrets safely**
- Never write passwords or keys in code
- Use UI or CLI to create and access secrets
- Control access using IAM roles
- Ideal for secure DevOps automation

---

## 📘 Next Class:

**Class 10: Cloud Functions – Run Code in Response to Events**

---

**GitHub:** [Your GitHub link here]\
**Contact:** [haswithaacademy@gmail.com](mailto\:haswithaacademy@gmail.com)

\#googlecloud #secretmanager #gcp #devops #security #automation #telugu

