# ⚙️ Class 10: Cloud Functions Triggered by Pub/Sub | Event-Driven Demo in Telugu

## 📘 Overview

In this class, we will build a simple event-driven automation using Google Cloud.

📌 **What is the function doing?**

- We will create a Cloud Function that listens to messages from a Pub/Sub topic.
- When a message is published to the topic, the function will automatically trigger.
- It reads the message and logs it to the console.

📁 We will use two files:

- `index.js`: Contains the function code
- `package.json`: Contains function metadata

⚠️ **Important Note**: While deploying the function using `gcloud`, make sure both `index.js` and `package.json` are in the same folder where you run the `gcloud functions deploy` command. GCP will automatically detect and package these files.

In this class, we will build a simple event-driven automation using Google Cloud.

📌 **What is the function doing?**

- We will create a Cloud Function that listens to messages from a Pub/Sub topic.
- Whenever a message is published to the topic, the function is triggered automatically.
- The function reads the message and prints it to the logs.

This helps us understand how serverless functions respond to real-time events in GCP. In this class, we will learn how to use **Google Cloud Functions** with **Pub/Sub** to create event-driven automation. We will write a simple function that logs messages sent to a Pub/Sub topic.

---

## 🎯 Topics Covered

- What are Cloud Functions?
- When to use them?
- Types of triggers (HTTP, Pub/Sub, Storage)
- Create a Cloud Function triggered by Pub/Sub
- Log the message to console

---

## 💡 What are Cloud Functions?

Cloud Functions is a **serverless compute service** in GCP that runs your code in response to events.

You don’t need to manage servers — just write your function and GCP takes care of the rest.

---

## 🔄 Common Triggers for Cloud Functions

- **HTTP Trigger** – Respond to web requests (APIs, webhooks)
- **Pub/Sub Trigger** – Respond to messages from a Pub/Sub topic
- **Cloud Storage Trigger** – React to file uploads, deletions, etc.

In this class, we’ll focus on **Pub/Sub trigger**.

---

## 🧪 Hands-On Lab: Deploy Cloud Function with Pub/Sub

### ✅ Step 1: Create Pub/Sub Topic

```bash
gcloud pubsub topics create my-topic
```

### ✅ Step 2: Write Cloud Function Code

Create a file named `index.js` with the following content:

```javascript
/**
 * Triggered from a message on a Cloud Pub/Sub topic.
 * Logs the message to the console.
 */
exports.helloPubSub = (event, context) => {
  const message = event.data
    ? Buffer.from(event.data, 'base64').toString()
    : 'Hello, World';

  console.log(`Received message: ${message}`);
};
```

And a `package.json`:

```json
{
  "name": "pubsub-function",
  "version": "1.0.0",
  "main": "index.js",
  "dependencies": {}
}
```

### ✅ Step 3: Deploy the Function

#### 📁 Option 1: Deploy from Local Folder

Make sure `index.js` and `package.json` are in the same folder. Then run:

```bash
gcloud functions deploy helloPubSub \
  --runtime=nodejs18 \
  --trigger-topic=my-topic \
  --entry-point=helloPubSub \
  --region=us-central1
```

#### 📁 Option 2: Deploy from GitHub Repository

If your function code is stored in Cloud Source Repositories (CSR) linked to GitHub, and located under `cloud-function-repo/sample`, use the following:

```bash
gcloud functions deploy helloPubSub \
  --runtime=nodejs18 \
  --trigger-topic=my-topic \
  --entry-point=helloPubSub \
  --region=us-central1 \
  --source=https://source.developers.google.com/projects/<PROJECT_ID>/repos/cloud-function-repo/moveable-aliases/main/paths/sample
```

> 📌 Note:
>
> - Make sure GitHub is connected to GCP via Cloud Source Repositories.

🔗 **How to Connect GitHub to Cloud Source Repositories:**

1. Go to GCP Console → **Source Repositories** → Click **Add Repository**.
2. Choose **Connect External Repository**.
3. Select **GitHub** and authorize your GitHub account.
4. Choose the GitHub repo you want to connect.
5. Click **Connect Repository**.

Once connected, your GitHub repo will be available under Cloud Source Repositories and you can deploy from it.

> - This method allows GCP to fetch your code directly from the specified GitHub repo path.

```bash
gcloud pubsub topics publish my-topic --message="Hello from Pub/Sub!"
```

### ✅ Step 5: View Logs

```bash
gcloud functions logs read helloPubSub
```

You should see the message printed in the logs.

---

## 🧠 Real-World Use Case (Preview)

In real-world projects, Cloud Functions are used to:

- Process uploaded files (like CSV or JSON)
- Transform data and forward to other systems
- Trigger workflows from events (e.g., GCS, Pub/Sub, Firestore)

In the next class, we’ll build a project that:

- Uploads a JSON file to GCS
- Cloud Function reads it and converts to CSV
- Uploads the CSV to another bucket

---

## ✅ Summary

- Cloud Functions are serverless, event-driven compute
- Pub/Sub can be used to trigger functions
- Logs and debugging can be done using CLI
- This setup is helpful for event-based automation in GCP

---

**GitHub:** [Your GitHub link here]\
**Contact:** [haswithaacademy@gmail.com](mailto\:haswithaacademy@gmail.com)

\#googlecloud #cloudfunctions #pubsub #devops #eventdriven #automation #telugu

