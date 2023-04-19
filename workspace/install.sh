#!/bin/bash -i

# install system deps
echo "Installing system dependencies ..."
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

# new python venv
echo "Creating new venv with all requirements ..."
python3 -m venv .venv
source .venv/bin/activate

pip3 install -r docker/datascience/requirements.txt

echo "------------------------"
echo "DONE"
echo "------------------------"