# 🧩 Class: Create Instance Template in Google Cloud

This guide explains how to create an Instance Template in GCP by first creating a VM instance, installing a web server, and saving the setup as a reusable template.

---

## 🧱 What is an Instance Template?

An **Instance Template** is a configuration file that defines a virtual machine’s properties like:
- Machine type
- Disk image
- Boot disk
- Network settings
- Metadata (startup script, tags, etc.)

You can use this template to create multiple identical VMs or use it in a managed instance group and load balancer.

---

## ✅ Step 1: Create a VM and Install Web Server

```bash
gcloud compute instances create web-instance-1   --zone=us-central1-a   --machine-type=e2-medium   --image-family=debian-11   --image-project=debian-cloud   --tags=http-server   --metadata=startup-script='#! /bin/bash
    sudo apt update
    sudo apt install apache2 -y
    sudo systemctl enable apache2
    sudo systemctl start apache2'
```

> This command creates a VM and automatically installs and starts Apache2 web server using a startup script.

---

## ✅ Step 2: Verify the Web Server

After the instance is created, allow HTTP traffic by creating a firewall rule (if not already created):

```bash
gcloud compute firewall-rules create allow-http   --allow tcp:80   --target-tags=http-server   --description="Allow TCP traffic on port 80"   --network=default
```

Now, get the external IP of the VM:

```bash
gcloud compute instances list
```

Open the IP in your browser. You should see the Apache2 welcome page.

---

## ✅ Step 3: Create an Instance Template

Now that your VM setup is working, create a template based on its configuration:

```bash
gcloud compute instance-templates create web-template   --machine-type=e2-medium   --image-family=debian-11   --image-project=debian-cloud   --tags=http-server   --metadata=startup-script='#! /bin/bash
    sudo apt update
    sudo apt install apache2 -y
    sudo systemctl enable apache2
    sudo systemctl start apache2'
```

> This template includes the startup script that will install and start Apache automatically in any new VM created from this template.

---

## 🎯 Summary

- You created a VM and installed a web server
- Verified HTTP access by applying firewall rules
- Created an instance template with same configuration

Next step: Use this template in a Managed Instance Group and attach it to a Load Balancer.

---

📩 **Contact**: haswithaacademy@gmail.com  
🔗 **GitHub**: [https://github.com/hanumantharao19](https://github.com/hanumantharao19)

#googlecloud #gcp #instancetemplate #vm #loadbalancer #clouddevops #telugu
