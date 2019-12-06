# Unifi Controller

Ubiquity Device Controller from: https://hub.docker.com/r/linuxserver/unifi-controller

Adopting the device need to be manually executed from device

Press the **adopt** button on controller and then run this command inside the device via ssh:

```
set-inform http://<controller-ip>:8080/inform
```
