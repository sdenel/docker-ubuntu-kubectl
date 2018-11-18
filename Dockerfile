FROM ubuntu:latest
RUN apt update && \
apt-get install -y \
apt-transport-https \
curl \
dnsutils \
git \
gnupg2 \
iputils-ping \
net-tools \
ssh \
vim \
zsh && \
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
touch /etc/apt/sources.list.d/kubernetes.list && \
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
apt-get update && \
apt-get install -y kubectl && \
apt clean && \
echo "alias k='kubectl'" >> /root/.bashrc && \
echo "source <(kubectl completion bash)" >> ~/.bashrc && \
mkdir -p /root/.kube && \
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
echo 'if [ $commands[kubectl] ]; then\n  source <(kubectl completion zsh)\nfi' >> /root/.zshrc && \
echo "alias k='kubectl'" >> /root/.zshrc
