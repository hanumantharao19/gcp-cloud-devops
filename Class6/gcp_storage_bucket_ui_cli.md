# Class 6: Google Cloud Storage Buckets – UI & CLI

## 📘 Overview

In this class, we will learn about **Google Cloud Storage (GCS)** and how to work with storage buckets using both **GCP Console (UI)** and **gcloud CLI**. This is an important topic for DevOps, cloud engineers, and beginners preparing for GCP certifications.

---

## 🎯 Objectives

- Understand what is Google Cloud Storage
- Learn why and when to use GCS
- Create and manage buckets using GCP UI
- Create and manage buckets using CLI
- Upload files from UI and CLI

---

## ☁️ What is Google Cloud Storage?

- Google Cloud Storage (GCS) is a fully managed **object storage service** by Google.
- It is used to store **any type of file** like images, backups, logs, scripts, etc.
- It is **highly available, durable, and scalable**.

### ✅ Key Features:

- Stores data in **buckets** (like folders)
- Can be accessed from anywhere using UI, CLI, or APIs
- Supports **lifecycle rules**, **access control**, and **storage classes**

---

## 💡 Why Use Google Cloud Storage?

- To store application files, images, documents, and backups
- To save log files and export monitoring data
- For hosting static websites or serving large datasets
- Easy integration with other GCP services like Compute Engine, BigQuery, etc.

---

## 🖥️ Create Storage Bucket Using GCP Console (UI)

### Steps:

1. Go to GCP Console → Navigation Menu → **Cloud Storage > Buckets**
2. Click **Create Bucket**
3. Enter a **unique bucket name** (e.g., `my-bucket-demo-class6`)
4. Choose **default storage class** (Standard is fine for now)
5. Choose **location** (multi-region or region, e.g., asia-south1)
6. Leave other settings default and click **Create**

### Upload File from UI:

1. Click the bucket you created
2. Click **Upload Files**
3. Select a file from your computer (e.g., `hello.txt`)
4. File gets uploaded and is listed in the bucket

---

## 🧑‍💻 Create Storage Bucket Using gcloud CLI

### 🔧 Install Google Cloud SDK on Local System

#### Windows (Using Command Prompt):

1. Download the installer from: [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)
2. Run the downloaded `.exe` file
3. Follow the installation wizard to complete setup
4. Once installed, open **Command Prompt** and verify installation:

```cmd
gcloud version
```

#### Set Up GCP Project via Command Line:

Before you start using gcloud, it's recommended to initialize the configuration using the following command:

```cmd
:: Initialize gcloud and open login page in browser
gcloud init
```

- This will open a browser window.
- Log in using your Google account.
- Choose the project you want to use or create a new one.

Once initialized, you can verify or change the project using:

```cmd
:: Set your default project
gcloud config set project <PROJECT_ID>

:: Verify the current project
gcloud config list project
```

> Replace `<PROJECT_ID>` with your actual project ID

---

#### For Windows:

1. Download the installer from [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)
2. Run the installer and follow the steps

### 🔑 Authenticate to Google Cloud:

After installation, run the following command:

```bash
gcloud init
```

- This will open a browser window to log in with your Google account
- Select or create a GCP project

You are now ready to run gcloud commands.

### Prerequisites:

- Install Google Cloud SDK
- Run `gcloud init` to authenticate and select project

### Create Bucket:

```bash
gcloud storage buckets create gs://my-bucket-demo-cli/ \
    --location=asia-south1
```

> Note: Bucket name must be globally unique.

### Upload File from CLI:

```bash
# Create a sample file
echo "Welcome to Class 6!" > welcome.txt

# Upload the file
gcloud storage cp welcome.txt gs://my-bucket-demo-cli/
```

---

## ✅ Summary

- GCS is object storage to store files and data in the cloud
- You can create buckets using **UI** or **CLI**
- Files can be uploaded easily using both methods
- GCS is a must-know service for every cloud engineer

---

## 📘 Useful for:

- Beginners learning cloud storage basics
- GCP Associate Cloud Engineer Certification
- DevOps engineers managing storage in automation

---

**Next Class:** Upload from GCP VM to Cloud Storage using Service Account (Class 7)

🚀 Keep practicing and don’t forget to subscribe to the channel!

