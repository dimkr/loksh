CC ?= cc
CFLAGS ?= -Wall -pedantic
CFLAGS += -I.
LDFLAGS ?=
DESTDIR ?= /
PREFIX ?= /usr
BIN_DIR ?= $(PREFIX)/bin
MAN_DIR ?= $(PREFIX)/share/man
DOC_DIR ?= $(PREFIX)/share/doc/loksh
OBJECTS = alloc.o c_ksh.o c_sh.o c_test.o c_ulimit.o edit.o emacs.o eval.o \
          exec.o expr.o history.o io.o jobs.o lex.o mail.o main.o misc.o \
          path.o shf.o syn.o table.o trap.o tree.o tty.o var.o version.o vi.o
HEADERS = c_test.h charclass.h config.h edit.h expand.h ksh_limval.h lex.h \
          proto.h sh.h shf.h table.h tree.h tty.h

all: ksh

%.o: %.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

ksh: $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	rm -f ksh *.o

install: all
	install -v -D -m 755 ksh $(DESTDIR)/$(BIN_DIR)/ksh
	install -v -D -m 644 ksh.1 $(DESTDIR)/$(MAN_DIR)/man1/ksh.1
	install -v -D -m 644 README $(DESTDIR)/$(DOC_DIR)/README
	install -v -m 644 README.upstream $(DESTDIR)/$(DOC_DIR)/README.upstream
	install -v -m 644 ChangeLog $(DESTDIR)/$(DOC_DIR)/ChangeLog
	install -v -m 644 ChangeLog.0 $(DESTDIR)/$(DOC_DIR)/ChangeLog.0
	install -v -m 644 CONTRIBUTORS $(DESTDIR)/$(DOC_DIR)/CONTRIBUTORS
	install -v -m 644 LEGAL $(DESTDIR)/$(DOC_DIR)/LEGAL
