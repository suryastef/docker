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
    zsh autocomplete for kubectl and gcloud
    ```

## Usages

Start the container as usual, it will prompt gcloud authentication

```
docker run -ti gcloud-sdk:buster-slim
```



## Note

I use the same installation tutorial from [cloud.google.com](https://cloud.google.com/sdk/docs/downloads-apt-get)

## Next update

- Run ```apt-get clean && apt-get autoclean``` to freed up space
- Add  ```watchs``` package (same functional as watch but with color enhancement, from my repo)