Synopsys
========

This a base image that has the goal to store and centralize configurations/settings.
It uses the `ghcr.io/fvilarinho/base-image` and [etcd](https://etcd.io/) as the main engine.
The configurations/settings are defined using the JSON format and stored in the `etc` directory.


Build status
============

![CI/CD](https://github.com/fvilarinho/etcd/workflows/CI/CD/badge.svg)


How to use
==========

Just put the line below in your Dockerfile.

`FROM ghcr.io/fvilarinho/etcd:1.2.0` - To use the last stable version.

`FROM ghcr.io/fvilarinho/etcd:latest` - To use the development version.


License
=======

This image is licensed under the Apache 2.0. Please read the licence file or check the URL [https://www.apache.org/licenses/LICENSE-2.0.txt](https://www.apache.org/licenses/LICENSE-2.0.txt)


Author
======

My name is Felipe Vilarinho (A.K.A Vila) and you can know more about me at the social medias below:

1. [LinkedIn](https://br.linkedin.com/in/fvilarinho)

Or send an email to fvilarinho@gmail.com or fvilarinho@concepting.com.br

Have Fun!

Best