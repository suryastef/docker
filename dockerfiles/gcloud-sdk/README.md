# Gcloud SDK Custom and Minimal Docker Image Based on Debian Buster

This is a small custom docker image (based on official image `debian:buster-slim`) for managing Google Cloud Platform via `gcloud-sdk`.

This image include some packages:

1. Main:

    ```
    gcloud
    kubectl
    ```

2. Additional

    ```
    git
    vim
    zsh
    oh-my-zsh
    powerline10k zsh theme

    ```

## Usages

Start the container as usual, it will prompt gcloud authentication

```
docker run -ti gcloud-sdk:buster-slim
```

