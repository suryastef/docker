# Gcloud SDK Custom and Minimal Docker Image Based on Debian Buster

This is a small custom docker image (based on official image `debian:buster-slim`) for managing Google Cloud Platform via `gcloud-sdk`.

This image include some packages:

1. Main:

    ```
    gcloud
    kubectl
    terraform
    ```

2. Additional

    ```
    sudo
    git
    vim
    zsh
    oh-my-zsh
    powerline10k zsh theme
    zsh autocomplete for kubectl and gcloud
    ```

## Usages

Start the container, it will prompt gcloud authentication

```
docker run -ti -e TERM -h gcloud-sdk --name gcloud-sdk suryastef/gcloud-sdk:buster-slim
```

Note:

- The `-e TERM` command will pass current host environment into the container
- The `-h gcloud-sdk` command will set container hostname to gcloud-sdk
- The `--name gcloud-sdk` command will set container name to gcloud-sdk

## Note

I use the same installation tutorial from [cloud.google.com](https://cloud.google.com/sdk/docs/downloads-apt-get)

## Next update

- ~~Run ```apt-get clean && apt-get autoclean``` to freed up space~~
- Add  ```watchs``` package (same functional as watch but with color enhancement, from my repo)