# Gcloud SDK Custom and Minimal Docker Image Based on Debian Buster

This is a small custom docker image (based on official image `debian:buster-slim`) for managing Google Cloud Platform via `gcloud-sdk`.

This image include some packages:

1. Main:

    ```
    gcloud
    kubectl (from asdf)
    helm (from asdf)
    terraform
    ```

2. Additional

    ```
    sudo
    git
    vim
    zsh
    asdf
    oh-my-zsh
    powerline10k zsh theme
    zsh autocomplete for kubectl and gcloud
    ```

## Usages

Start the container, it will prompt gcloud authentication

```
docker run -ti -e TERM -e TZ=Asia/Jakarta -h gcloud-sdk --name gcloud-sdk -v gcloud:/home/docker/.config/gcloud suryastef/gcloud-sdk:buster-slim
```

Note:

- The `-e TERM` command will pass current host environment into the container
- The `-e TZ=Asia/Jakarta` command will set timezone
- The `-h gcloud-sdk` command will set container hostname to gcloud-sdk
- The `--name gcloud-sdk` command will set container name to gcloud-sdk
- The `-v gcloud:/home/docker/.config/gcloud ` command will create new volume for persistence storage containing gcloud credential

## Note

I use the same installation tutorial from [cloud.google.com](https://cloud.google.com/sdk/docs/downloads-apt-get)