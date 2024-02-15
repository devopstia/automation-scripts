#!/bin/bash

# https://www.sonarsource.com/products/sonarqube/downloads
# wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-<version>.zip

# SonarQube version
SONARQUBE_VERSION="10.2.1.78527"
INSTANCE_PUBLIC_IP=$(curl -s ifconfig.me)
SONARQUBE_URL="http://$INSTANCE_PUBLIC_IP:9000"

# Update system packages
sudo apt update

# Install prerequisites
sudo apt install unzip -y
sudo apt install wget -y

sudo apt install -y openjdk-11-jdk unzip

# Download and extract SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONARQUBE_VERSION}.zip
unzip sonarqube-${SONARQUBE_VERSION}.zip -d /opt
sudo mv /opt/sonarqube-${SONARQUBE_VERSION} /opt/sonarqube

# Create a dedicated system user for SonarQube
sudo useradd -r -s /bin/false sonarqube
sudo chown -R sonarqube:sonarqube /opt/sonarqube

# Configure SonarQube as a systemd service
sudo tee /etc/systemd/system/sonarqube.service <<EOF
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonarqube
Group=sonarqube
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable and start SonarQube service
sudo systemctl enable sonarqube
sudo systemctl start sonarqube

# Wait for SonarQube to start (adjust the sleep duration as needed)
sleep 30

# Display SonarQube login information
echo "SonarQube is now installed and running."
echo "You can access the SonarQube web interface at $SONARQUBE_URL"
echo "Default credentials:"
echo "   Username: admin"
echo "   Password: admin"

# Clean up downloaded files
rm sonarqube-${SONARQUBE_VERSION}.zip
