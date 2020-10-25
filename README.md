```
 _       _        _
| | ___ | | _____| |__
| |/ _ \| |/ / __| '_ \
| | (_) |   <\__ \ | | |
|_|\___/|_|\_\___/_| |_|
```

[![Build Status](https://travis-ci.org/dimkr/loksh.svg?branch=master)](https://travis-ci.org/dimkr/loksh)

## Overview

loksh is a [Linux](https://www.kernel.org/) port of [OpenBSD](http://www.openbsd.org/)'s *ksh*.

Unlike other ports of *ksh*, loksh targets only one platform, follows upstream closely and [keeps changes to a minimum](https://github.com/dimkr/loksh/compare/upstream%2Fmaster...master). loksh does not add any extra features; this reduces the risk of introducing security vulnerabilities and makes loksh a good fit for resource-constrained systems.

## Installation

loksh is included in many distributions:

[![Packaging status](https://repology.org/badge/vertical-allrepos/loksh.svg?minversion=6.7.5&header=)](https://repology.org/project/loksh/versions)

For example, under [Alpine Linux](https://alpinelinux.org/), loksh can be installed using `apk add loksh`.

Alternatively, to build and install loksh from source:

```bash
meson --prefix=/usr build
ninja -C build install
```

## Legal Information

loksh is licensed under the same license as the upstream code it is based on.

The ASCII art logo at the top was made using [FIGlet](http://www.figlet.org/).
