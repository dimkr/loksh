FROM dimkr/c-dev:clang

RUN apt-get -y --no-install-recommends install pkg-config libncurses5-dev
