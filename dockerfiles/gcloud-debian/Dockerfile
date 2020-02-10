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

# Revert Debian CLI to teletype important berfore running any command in debian based distro
ENV DEBIAN_FRONTEND teletype

# Set the default entrypoint (non overridable) to run when starting the container
CMD ["zsh"]

