# Gcloud SDK Custom and Minimal Docker Image Based on Debian Buster

This is a small custom docker image (based on official image `debian:buster-slim`) for managing Google Cloud Platform via `gcloud-sdk`.

This image include some packages:

1. Main:

    ```
    gcloud
    kubectl (from asdf)
    helm (from asdf)
    terraform (from asdf)
    ```

2. Additional

    ```
    sudo
    git
    vim
    vim-airline
    tmux
    zsh
    lsd
    asdf
    oh-my-zsh
    powerline10k zsh theme
    zsh autocomplete for gcloud, kubectl, helm, and terraform
    ```

## Usages

Start the container, it will prompt gcloud authentication:

```
podman run -ti -e TERM=xterm-256color -e TZ=Asia/Jakarta -h gcloud-sdk --name gcloud-sdk -v ~/.config/gcloud:/root/.config/gcloud suryastef/gcloud-sdk:buster-slim
```

Command detail:

- The `-e TERM` command will pass current host environment into the container
- The `-e TZ=Asia/Jakarta` command will set timezone
- The `-h gcloud-sdk` command will set container hostname to gcloud-sdk
- The `--name gcloud-sdk` command will set container name to gcloud-sdk
- The `-v ~/.config/gcloud:/root/.config/gcloud` command will bind mount host path `~/.config/gcloud` for persistence storage containing gcloud credential

Rerun command:

```
docker start gcloud-sdk && docker exec -ti gcloud-sdk tmux
```

## Note

I use the same installation tutorial from [cloud.google.com](https://cloud.google.com/sdk/docs/downloads-apt-get)