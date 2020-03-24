FROM debian:buster-slim
MAINTAINER suryastef@gmail.com

# Change Debian CLI to noninteractive important berfore running any command in debian based distro
ENV DEBIAN_FRONTEND noninteractive

# Hide apt-key warn
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# install apt-utils to avoid warning
RUN apt-get update && apt-get install -yq apt-utils

# Make sure apt-transport-https installed
RUN apt-get -yq install apt-transport-https ca-certificates gnupg --no-install-recommends

# Install additional dependencies
RUN apt-get install -yq curl vim git zsh sudo jq wget bsdtar

# Add gcloud repository
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud public key
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update and install the Cloud SDK
RUN apt-get update && apt-get install -yq google-cloud-sdk kubectl

# Install terraform
RUN wget -qO- $(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | egrep 'terraform_[0-9]\.[0-9]{1,2}\.[0-9]{1,2}_linux.*amd64' | sort -V | tail -1) | bsdtar -xvf- -C /usr/local/bin/
RUN chmod +x /usr/local/bin/terraform

# Clean apt cache
RUN apt-get purge -y bsdtar jq wget && apt-get clean && apt-get autoclean

# Add docker user and enable sudo without password
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN chsh -s /bin/zsh docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker
WORKDIR /home/docker

# Install Oh My ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Disable Oh My ZSH auto update prompt
RUN sed -i '/DISABLE_UPDATE_PROMPT="true"/ s/.//' ~/.zshrc

# Install zsh-autosuggestion
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install syntax highlighting
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
RUN echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Add install powerlevel10k theme and enable additional plugins
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
RUN sed -i -e 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc
RUN echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> ~/.zshrc
RUN sed -i -e 's/(git)/(git kubectl gcloud zsh-autosuggestions)/g' ~/.zshrc

# Revert Debian CLI to teletype important berfore running any command in debian based distro
ENV DEBIAN_FRONTEND teletype

# Default command to run when the container is running for the first time
CMD clear && gcloud auth login && zsh
