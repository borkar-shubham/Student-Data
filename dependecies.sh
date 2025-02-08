#/bin/bash
#removing previous docker installation
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
#installing docker 
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#installing java
sudo apt update -y
sudo apt install default-jre -y

#installing maven
wget https://downloads.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz -P /
sudo tar xf /apache-maven-*.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.8.8 /opt/maven

sudo cat <<EOF > /etc/profile.d/maven.sh
export JAVA_HOME=/usr/lib/jvm/default-java
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}
EOF

sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -version


