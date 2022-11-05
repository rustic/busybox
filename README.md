# Busybox

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/rustic/busybox/tree/master.svg?style=shield)](https://dl.circleci.com/status-badge/redirect/gh/rustic/busybox/tree/master)
[![Image Size](https://img.shields.io/docker/image-size/rustic/busybox/latest)](https://hub.docker.com/repository/docker/rustic/busybox)
[![License](https://img.shields.io/github/license/rustic/busybox)](https://hub.docker.com/repository/docker/rustic/busybox)

This Docker image allows you to run Busybox commands on a Docker host (or anywhere) that may be missing some utilities. An example use case would be on Fedora CoreOS where you may not want additional packages layered in.

## Usage

### Basic usage

`docker run --rm -v $PWD:/busybox rustic/busybox --help`

Or for a system with SELinux (note the :z on the volume)

`docker run --rm -v $PWD:/busybox:z rustic/busybox --help`

You can specify read only on the volume mount a with `:ro` or `:ro,z` on SELinux.

`docker run --rm -v $PWD:/busybox:ro,z rustic/busybox sha1sum file.txt`

Of course you can skip the volume mount if you don't need to manipulate anything on the host.

`docker run --rm rustic/busybox ping -c 4 google.com`

## Setting a user or group

Keep in mind that the container runs as root by default. Make sure you tell the container to run as a different user if different permissions are needed.

### Example

`docker run --rm --user $(id -u):$(id -g) -v $PWD:/busybox:z rustic/busybox touch file.txt`

or

`docker run --rm --user 1001:1001 -v $PWD:/busybox:z rustic/busybox touch file.txt`

## Building

You may of course build the container yourself

`docker build -t busybox .`
