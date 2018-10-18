FROM ubuntu:bionic

RUN apt-get -qq update
RUN apt-get -y --no-install-recommends install gcc make libncurses5-dev pkg-config clang
