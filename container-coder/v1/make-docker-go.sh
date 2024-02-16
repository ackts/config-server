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
curl https://go.dev/dl/go1.22.0.linux-amd64.tar.gz -o go.tar.gz -L
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile

echo "Install - npx"
sudo apt install xz-utils -y
curl https://github.com/upx/upx/releases/download/v4.2.2/upx-4.2.2-amd64_linux.tar.xz -o upx-linux.tar.xz -L
tar -xf upx-linux.tar.xz
sudo mv upx-4.2.2-amd64_linux/upx /usr/bin/
rm -rf upx-*

echo "Install - dive"
curl https://github.com/wagoodman/dive/releases/download/v0.11.0/dive_0.11.0_linux_amd64.tar.gz -o dive.tar.gz -L
mkdir dive
tar -C dive -xf dive.tar.gz
sudo mv dive/dive /usr/bin/
rm -rf dive.tar.gz dive

echo "Install - lazydocker"
curl https://github.com/jesseduffield/lazydocker/releases/download/v0.23.1/lazydocker_0.23.1_Linux_x86.tar.gz -o lazy.tar.gz -L
mkdir lazy
tar -C lazy -xf lazy.tar.gz
sudo mv lazy/lazydocker /usr/bin/
rm -rf lazy.tar.gz lazy

echo "Install Extesions"
code-server --install-extension eamodio.gitlens
code-server --install-extension golang.go
code-server --install-extension ritwickdey.LiveServer
code-server --install-extension rangav.vscode-thunder-client