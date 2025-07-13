# 📩 Class 8: Google Cloud Pub/Sub Explained with Hands-on | Free GCP & DevOps in Telugu

## 📘 Overview

In this class, we will learn about **Google Cloud Pub/Sub**, its purpose, real-world use cases, and how to implement it using both **UI and CLI**. This lesson includes a **hands-on lab** and will help you understand how to build **event-driven architectures**.

---

## 🎯 Topics Covered

- What is Pub/Sub?
- Use cases in real-world DevOps and cloud systems
- Creating Pub/Sub Topics and Subscriptions
- Publishing and Pulling messages (UI + CLI)
- Hands-on Practice

---

## 💡 What is Google Cloud Pub/Sub?

**Pub/Sub** stands for **Publish/Subscribe**. It's a messaging service used to send and receive messages between independent systems or components.

- **Publisher**: Sends a message to a topic
- **Subscriber**: Listens to the topic and processes the message

> ℹ️ In Google Cloud, you don’t need to create a separate publisher. Any app, script, or command (like gcloud CLI) that sends a message to a topic acts as the publisher.

> ❗**Important Note:** Even if you create a Topic and Subscription, you won’t receive any messages unless something publishes to the topic. So, a publisher (like CLI, Cloud Function, or app) is always needed to push data into the topic.

### ✅ Benefits:

- Asynchronous communication
- Decouples components (microservices, pipelines)
- Scalable and reliable delivery
- Real-time data flow (logs, events, metrics)

### 📦 Real-World Use Cases

- Trigger a Cloud Function when a file is uploaded to a bucket (like in our JSON to CSV project)
- Send logs or messages between different cloud services without manual steps
- Automatically start a pipeline when an event happens (like a new deployment or file arrival)
- Build alert systems or messaging flows (e.g., notify when a file is missing or a task fails)

---

## 🧪 Hands-On Lab

### 🔹 Step 1: Create Pub/Sub Topic via **UI**

1. Go to **Google Cloud Console**
2. Navigate to `Pub/Sub > Topics`
3. Click **Create Topic**
4. Name: `demo-topic`
5. Leave defaults and click **Create**

### 🔹 Step 2: Create Subscription via **UI**

1. Click on the created topic `demo-topic`
2. Go to **Subscriptions** tab
3. Click **Create Subscription**
4. Name: `demo-sub`
5. Delivery type: Pull
6. Click **Create**

---

### 🔸 Step 3: Create Topic using **gcloud CLI**

```bash
gcloud pubsub topics create cli-topic
```

### 🔸 Step 4: Create Subscription using **gcloud CLI**

```bash
gcloud pubsub subscriptions create cli-sub --topic=cli-topic
```

---

### 🔸 Step 5: Publish Messages via CLI

```bash
gcloud pubsub topics publish demo-topic --message="Hello from UI topic"

gcloud pubsub topics publish cli-topic --message="Hello from CLI topic"
```

### 🔸 Step 6: Pull Messages via CLI

```bash
gcloud pubsub subscriptions pull demo-sub --limit=1 --auto-ack

gcloud pubsub subscriptions pull cli-sub --limit=1 --auto-ack
```

---

## 🧠 Summary

- Pub/Sub helps decouple cloud services and enables async workflows
- Can be managed easily through UI and CLI
- A publisher is always needed to send messages to the topic
- Subscriptions receive the messages that publishers send
- Very useful for Cloud Functions, Data Pipelines, and CI/CD

---

## 📘 DevOps Use Cases

- Trigger Cloud Function when a file is uploaded
- Send logs from one service to another
- Pipeline orchestration using events
- Cross-service communication in microservices

---

## ✅ Next Class:

**Class 9: Google Secret Manager – Secure Your App Configurations and Keys**

---

**GitHub:** [Your GitHub link here]\
**Contact:** [haswithaacademy@gmail.com](mailto\:haswithaacademy@gmail.com)

\#googlecloud #pubsub #cloudcomputing #gcp #devops #telugu

