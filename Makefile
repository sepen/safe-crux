DESTDIR = 

PREFIX  = /usr
BINDIR  = $(PREFIX)/bin
CONFDIR = $(PREFIX)/etc
DATADIR = $(PREFIX)/share/safe-crux
MANDIR  = $(PREFIX)/share/man

.PHONY: all install

all:

install:
	install -D -m 0755 safe-crux $(DESTDIR)/$(DATADIR)/safe-crux
	install -d -m 0755 $(DESTDIR)/$(BINDIR)
	ln -sf $(DATADIR)/safe-crux $(DESTDIR)/$(BINDIR)/safe-crux
	ln -sf $(DATADIR)/safe-crux $(DESTDIR)/$(BINDIR)/cse
	install -D -m 0644 etc/safe-crux.conf $(DESTDIR)/$(CONFDIR)/safe-crux.conf
	install -D -m 0644 man/safe-crux.1 $(DESTDIR)/$(MANDIR)/man1/safe-crux.1
	install -D -m 0644 man/safe-crux.conf.5 $(DESTDIR)/$(MANDIR)/man1/safe-crux.conf.5
	cp -r addons bin doc $(DESTDIR)/$(DATADIR)
