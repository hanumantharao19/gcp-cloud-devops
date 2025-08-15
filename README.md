# gcp-cloud-devops
gcp-cloud-devops by hanu

Class 8: Google Cloud Pub/Sub (UI + CLI)
Title suggestion:
📩 Class 8 – Google Cloud Pub/Sub Explained with Hands-on | Free GCP & DevOps in Telugu

Topics to cover:

What is Pub/Sub? Use cases in real-world projects (decouple services, event-driven architecture)

Create Pub/Sub topic via UI and CLI

Create a subscription

Publish and receive test messages (via CLI)

Real-life DevOps use cases (CI triggers, log pipelines, file processing)

🔸 Class 9: Google Secret Manager (UI + CLI)
Title suggestion:
🔐 Class 9 – Google Secret Manager in GCP with Hands-on | Secure Automation in Telugu

Topics to cover:

What is Secret Manager?

Why not hardcode credentials in code?

Create secrets via UI

Retrieve secrets via CLI

IAM permissions required for Secret Manager

Real-world example (store API key / DB password)

🔸 Class 10: Cloud Functions with Pub/Sub
Title suggestion:
⚙️ Class 10 – Deploy Cloud Function Triggered by Pub/Sub | Event-Driven Demo in Telugu

Topics to cover:

What are Cloud Functions? When to use them?

Types of triggers (HTTP, Pub/Sub, Storage)

Create a function that listens to Pub/Sub

Logs the message to console

(Simple logic — this builds base for next class)

🔸 Class 11: Project – JSON to CSV with Cloud Function
Title suggestion:
📁 Class 11 – Project: Convert JSON to CSV using Cloud Function | GCP Automation Telugu

Flow:

Upload JSON → GCS triggers Pub/Sub → Cloud Function

Reads file → Converts to CSV → Uploads to second bucket

Bonus: Pull a secret from Secret Manager (optional)



-------------
5️⃣	Disk Types + Instance Templates (basic infra scaling)
6️⃣	Managed Instance Groups (MIG)
7️⃣	Load Balancer with MIGs
8️⃣	VPC Deep Dive – Subnets, routes, firewall, flow logs
9️⃣	Shared VPC – Multi-project networking
🔟	Cloud NAT Gateway – Private VM access internet
1️⃣1️⃣	Google Cloud Storage (GCS) – Create/upload/download via UI & CLI
1️⃣2️⃣	Upload from VM to GCS using Service Account
1️⃣3️⃣	Service Account Deep Dive – Roles, purpose, least privilege
1️⃣4️⃣	Pub/Sub – Topic, subscription, CLI, event-driven use cases
1️⃣5️⃣	Secret Manager – Store secrets, IAM, CLI/UI
1️⃣6️⃣	Cloud Function with Pub/Sub Trigger
1️⃣7️⃣	Mini Project – Upload JSON → Cloud Function → Convert to CSV → Store
1️⃣8️⃣	IAM Deep Dive – Custom roles, project/org-level permissions
1️⃣9️⃣	Cloud Monitoring + Logging – Metrics, log-based alerts
2️⃣0️⃣	Cloud Build CI/CD – Trigger deploy from GitHub repo


- 21	Cloud Scheduler with Pub/Sub or HTTP Trigger
- 22	Cloud Tasks – Queuing with Cloud Functions
- 23	Cloud Logging – Logs Explorer, export to BigQuery
- 24	Alerting Policies & Uptime Checks
- 25	Artifact Registry – Store Docker images securely
- 26	Cloud Run – Serverless app deployment
- 27	Cloud Build Triggers with GitHub
- 28	Deploy Static Website via GCS & Cloud CDN
- 29	Cloud Build + Cloud Run Full CI/CD
- 30	End-to-End CI/CD Pipeline Project in GCP

🔹 31–40: Infrastructure as Code (Terraform for GCP)
- 31	Introduction to Terraform
- 32	Terraform Setup for GCP Projects
- 33	Create VPC, Subnet using Terraform
- 34	Terraform to Provision VM with Web Server
- 35	Use Terraform to Create GCS Buckets
- 36	Use Terraform to Create Pub/Sub Topics
- 37	Deploy Cloud Function with Terraform
- 38	Use Terraform to Configure IAM & Roles
- 39	Terraform + Remote Backend + State Management
- 40	Complete Project using Terraform Only

🔹 41–50: Kubernetes & GKE
- 41	What is GKE? Intro to Kubernetes in GCP
- 42	Create GKE Cluster (UI + CLI)
- 43	Deploy App in GKE with YAML
- 44	Expose GKE App with LoadBalancer & Ingress
- 45	ConfigMap, Secret in Kubernetes
- 46	Auto-scaling in GKE
- 47	Use GCR/Artifact Registry with GKE
- 48	Helm Basics – Manage Kubernetes Applications
- 49	CI/CD to GKE with Cloud Build
- 50	Mini Project: Full App Deployment on GKE

🔹 51–60: Real-World Projects, AI/ML, Certification Prep
- 51	Project 1: Serverless File Processor (Cloud Function + Pub/Sub + GCS)
- 52	Project 2: CI/CD for Node App using Cloud Build & Cloud Run
- 53	Project 3: Event-Driven Infra with Scheduler + Pub/Sub + Secret Manager
- 54	Use BigQuery for GCP Logs Analysis
- 55	GCP GenAI Intro + Vertex AI Basics
- 56	Trigger Cloud Function with Vision AI (OCR or Image Labeling)
- 57	Secure GCP Projects with Org Policy & SCP
- 58	Cost Optimization Techniques in GCP
- 59	Associate Cloud Engineer Exam Prep – Part 1
- 60	Associate Cloud Engineer Exam Prep – Part 2 (Mock Lab)
