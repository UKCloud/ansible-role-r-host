## R-Host Ansible Role

This is Ansible role to install and configure a server with the [R programming language][rlang].

Currently this supports the following systems:

- CentOS
- Ubuntu

## Testing

1. Download this repository with `git clone`
2. Build the images with:  
```bash

docker build -t tests/r-role -f Dockerfile.*distro*

```
3. Log into the image with  
```bash

docker run -it tests/r-role bash

```
