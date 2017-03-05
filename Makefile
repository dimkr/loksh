CC ?= cc
CFLAGS ?= -O2
override CFLAGS += -I. -D_GNU_SOURCE -std=gnu99 -Wall -pedantic -Wno-format-security -Wno-pointer-sign
LDFLAGS ?=
DESTDIR ?= /
PREFIX ?= /usr
BIN_DIR ?= $(PREFIX)/bin
BIN_NAME ?= ksh
MAN_DIR ?= $(PREFIX)/share/man
DOC_DIR ?= $(PREFIX)/share/doc/loksh
HAVE_LIBBSD ?= 0

OBJECTS = alloc.o c_ksh.o c_sh.o c_test.o c_ulimit.o edit.o emacs.o eval.o \
          exec.o expr.o history.o io.o jobs.o lex.o mail.o main.o misc.o \
          path.o shf.o syn.o table.o trap.o tree.o tty.o var.o version.o vi.o
HEADERS = c_test.h charclass.h config.h edit.h expand.h ksh_limval.h lex.h \
          proto.h sh.h shf.h table.h tree.h tty.h

ifeq (1,$(HAVE_LIBBSD))
	CFLAGS += $(shell pkg-config --cflags libbsd-overlay)
	LDFLAGS += $(shell pkg-config --libs libbsd-overlay)
endif

all: ksh

%.o: %.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

ksh: $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(BIN_NAME) *.o

install: all
	install -v -D -m 755 ksh $(DESTDIR)/$(BIN_DIR)/$(BIN_NAME)
	install -v -D -m 644 ksh.1 $(DESTDIR)/$(MAN_DIR)/man1/$(BIN_NAME).1
	install -v -m 644 sh.1 $(DESTDIR)/$(MAN_DIR)/man1/sh.1
	install -v -D -m 644 README $(DESTDIR)/$(DOC_DIR)/README
	install -v -m 644 README.upstream $(DESTDIR)/$(DOC_DIR)/README.upstream
	install -v -m 644 CONTRIBUTORS $(DESTDIR)/$(DOC_DIR)/CONTRIBUTORS
	install -v -m 644 PROJECTS $(DESTDIR)/$(DOC_DIR)/PROJETCS
	install -v -m 644 LEGAL $(DESTDIR)/$(DOC_DIR)/LEGAL
