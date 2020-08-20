PREFIX ?= usr
BIN_DIR ?= $(PREFIX)/bin
MAN_DIR ?= $(PREFIX)/share/man
DOC_DIR ?= $(PREFIX)/share/doc
NINJA ?= ninja

all: build/ksh

build: meson.build
	rm -rf $@
	$(NINJA) --prefix=/ --bindir=$(BIN_DIR) --mandir=$(MAN_DIR) --datadir=$(shell echo $(DOC_DIR) | sed s~/doc$$~~) $@

always:
build/ksh: build always
	$(NINJA) -C build

clean:
	rm -rf build

install: build
	$(NINJA) -C build install