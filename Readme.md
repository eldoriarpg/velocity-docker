# Velcocity docker

This repository provides an up-to-date velocity image. The image is build every night at midnight regardless of actual 
updates on the velocity side.

Use it with
```
docker pull ghcr.io/eldoriarpg/velocity-docker:latest
```

Data is located in a volume stored in `/velo/data`. The image does no configuration to the proxy. All you get is a 
velocity instance running and an exposed directory for configuration.
