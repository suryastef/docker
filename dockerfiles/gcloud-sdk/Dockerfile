FROM debian:buster-slim
MAINTAINER surya@gmail.com

# Change Debian CLI to noninteractive important berfore running any command in debian based distro
ENV DEBIAN_FRONTEND noninteractive

# Hide apt-key warn
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# install apt-utils to avoid warning
RUN apt-get update && apt-get install -yq apt-utils

# Make sure apt-transport-https installed
RUN apt-get -yq install apt-transport-https ca-certificates gnupg --no-install-recommends

# Install additional dependencies
RUN apt-get install -yq curl vim git zsh

# Add gcloud repository
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud public key
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update and install the Cloud SDK
RUN apt-get update && apt-get install -yq google-cloud-sdk kubectl

# Install Oh My ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Add install powerlevel10k theme and enable additional plugins
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
RUN sed -i -e 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc
RUN echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> ~/.zshrc
RUN sed -i -e 's/(git)/(git kubectl gcloud)/g' ~/.zshrc

# Revert Debian CLI to teletype important berfore running any command in debian based distro
ENV DEBIAN_FRONTEND teletype

# Default command to run when the container is running for the first time
CMD clear && gcloud auth login && zsh