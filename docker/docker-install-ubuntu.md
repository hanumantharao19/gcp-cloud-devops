## Install Docker in ubuntu server
# Update and Upgrade System Packages
```
sudo apt update
sudo apt upgrade -y
```
# Install Required Prerequisite Packages
```
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
# Add Docker’s Official GPG Key
```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

# Add Docker’s Stable Repository
```
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
# Update Package Index Again
```
sudo apt update
```
# Install Docker Engine and CLI
```
sudo apt install -y docker-ce docker-ce-cli containerd.io
```
# Start and Enable Docker Service
```
sudo systemctl start docker
sudo systemctl enable docker
```
# Run Docker Without Sudo
```
sudo usermod -aG docker $USER
newgrp docker
```

