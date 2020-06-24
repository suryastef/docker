# Accurate 4 Database Engine

Configured Firebird database engine to serve Accurate 4.2 cient

## Usage (server side)

```
docker run -d --name accurate4 -e TZ=Asia/Jakarta --net host -v ~/accurate:/accurate --restart unless-stopped suryastef/accurate4-db-engine
podman run -d --name accurate4 -e TZ=Asia/Jakarta --net host -v ~/accurate:/accurate --restart always --privileged suryastef/accurate4-db-engine
```

Put database file `*.gdb` inside `/home/(username)/accurate` directory

## Usage (client side)

Enter: Hostname/IP address then `/accurate/(database-name).gdb` when opening database in Accurate application


## Note:
 - Tested and working on Accurate client version 4.2.13, Build: 1385 (Standard)

## Issue:
 - Slow respond with bridge network (`-p 3051:3051`), use host network instead (`--net host`)
