echo "Update"
sudo apt-get update

echo "Install - make"
sudo apt-get install make -y

echo "Install - Docker"
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker
sudo apt-get install docker-ce-cli docker-buildx-plugin docker-compose-plugin -y

echo "Install - Go"
curl https://go.dev/dl/go1.21.6.linux-amd64.tar.gz -o go.tar.gz -L
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile

echo "Install - npx"
sudo apt install xz-utils -y
curl https://github.com/upx/upx/releases/download/v4.2.2/upx-4.2.2-amd64_linux.tar.xz -o upx-linux.tar.xz -L
tar -xf upx-linux.tar.xz
sudo mv upx-4.2.2-amd64_linux/upx /usr/bin/
rm -rf upx-*