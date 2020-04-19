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
RUN apt-get install -yq curl vim git zsh sudo watch unzip

# Add gcloud repository
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud public key
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update and install the Cloud SDK
RUN apt-get update && apt-get install -yq google-cloud-sdk

# Add watchs
RUN echo "while true; do clear; date;echo;\$*;sleep 1; done" > /usr/local/bin/watchs
RUN chmod +x /usr/local/bin/watchs

# Clean apt cache
RUN apt-get clean && apt-get autoclean

# Add docker user and enable sudo without password
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN usermod --shell /bin/zsh docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker
WORKDIR /home/docker

# Install Oh My ZSH
RUN zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Disable Oh My ZSH auto update prompt
RUN sed -i '/DISABLE_UPDATE_PROMPT="true"/ s/.//' ~/.zshrc

# Install zsh-autosuggestion
RUN git clone -q --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install syntax highlighting
RUN git clone -q --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
RUN echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Add install powerlevel10k theme and enable additional plugins
RUN git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
RUN sed -i -e 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc
RUN echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> ~/.zshrc
RUN sed -i -e 's/(git)/(git kubectl gcloud terraform zsh-autosuggestions asdf helm)/g' ~/.zshrc

# Install asdf and use specific kubectl & helm version for GKE
RUN git clone -q https://github.com/asdf-vm/asdf.git ~/.asdf && cd ~/.asdf && git checkout -q "$(git describe --abbrev=0 --tags)"
ENV PATH /home/docker/.asdf/bin:$PATH
RUN asdf plugin-add kubectl
RUN asdf install kubectl $(curl -sSL https://cloud.google.com/feeds/kubernetes-engine-stable-channel-release-notes.xml | grep -oE '[0-9]\.[0-9]+\.[0-9]+' | head -1)
RUN asdf global kubectl $(asdf list kubectl)
RUN asdf plugin-add helm
RUN asdf install helm $(curl -sSL https://github.com/kubernetes/helm/releases | sed -n '/Latest release<\/a>/,$p' | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' | head -1 | cut -c2-)
RUN asdf global helm $(asdf list helm)
RUN asdf plugin-add terraform
RUN asdf install terraform latest
RUN asdf global terraform $(asdf list terraform)

# Revert Debian CLI to teletype important berfore running any command in debian based distro
ENV DEBIAN_FRONTEND teletype

# Custom volume for gcloud credential
VOLUME /home/docker/.config/gcloud

# Claim the directory
RUN sudo chown -R docker:docker /home/docker/.config/gcloud

# Default command to run when the container is running for the first time
CMD clear && gcloud auth login && zsh