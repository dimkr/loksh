PREFIX ?= usr
BIN_DIR ?= $(PREFIX)/bin
MAN_DIR ?= $(PREFIX)/share/man
DOC_DIR ?= $(PREFIX)/share/doc

all: build/ksh

build: meson.build
	rm -rf $@
	meson --prefix=/ --bindir=$(BIN_DIR) --mandir=$(MAN_DIR) --datadir=$(shell echo $(DOC_DIR) | sed s~/doc$$~~) $@

always:
build/ksh: build always
	ninja -C build

clean:
	rm -rf build

install: build
	ninja -C build install
