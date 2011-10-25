DESTDIR = 

PREFIX  = /usr
BINDIR  = $(PREFIX)/bin
CONFDIR = $(PREFIX)/etc
DATADIR = $(PREFIX)/share/safe-env
MANDIR  = $(PREFIX)/share/man

.PHONY: all install

all:

install:
	install -D -m 0755 safe-env $(DESTDIR)/$(DATADIR)/safe-env
	install -d -m 0755 $(DESTDIR)/$(BINDIR)
	ln -sf $(DATADIR)/safe-env $(DESTDIR)/$(BINDIR)/safe-env
	ln -sf $(DATADIR)/safe-env $(DESTDIR)/$(BINDIR)/cse
	install -D -m 0644 etc/safe-env.conf $(DESTDIR)/$(CONFDIR)/safe-env.conf
	install -D -m 0644 man/safe-env.1 $(DESTDIR)/$(MANDIR)/man1/safe-env.1
	install -D -m 0644 man/safe-env.conf.5 $(DESTDIR)/$(MANDIR)/man1/safe-env.conf.5
	cp -r addons bin doc $(DESTDIR)/$(DATADIR)
