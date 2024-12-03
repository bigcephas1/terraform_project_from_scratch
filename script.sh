#!/bin/bash

# Update package list
sudo apt update

# Install OpenJDK 11
sudo apt install -y openjdk-21-jre

# Verify Java installation
java -version

# Install Git
sudo apt install -y git

# Install Terraform
# Add the HashiCorp repository to the list of sources
sudo apt-get install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add the official HashiCorp Linux repository
sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Update package list to include HashiCorp's repository
sudo apt update

# Install Terraform
sudo apt install -y terraform

# Verify Terraform installation
terraform -version

# Add Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list again to include Jenkins repository
sudo apt-get update

# Install Jenkins
sudo apt-get install -y jenkins

# Enable Jenkins to start at boot
sudo systemctl enable jenkins

# Start Jenkins service
sudo systemctl start jenkins

apt-get install -y docker.io
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu
docker pull nginx
docker run -d --name nginx-container -p 80:80 nginx
