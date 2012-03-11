DESTDIR = 

PREFIX  = /usr
BINDIR  = $(PREFIX)/bin
CONFDIR = $(PREFIX)/etc
DATADIR = $(PREFIX)/share/safe-crux
MANDIR  = $(PREFIX)/share/man

.PHONY: all install

all:

install:
	install -d $(DESTDIR)/$(DATADIR)
	install -m 0755 safe-crux $(DESTDIR)/$(DATADIR)/safe-crux
	cp -r bin doc $(DESTDIR)/$(DATADIR)
	install -d $(DESTDIR)/$(BINDIR)
	ln -sf $(DATADIR)/safe-crux $(DESTDIR)/$(BINDIR)/safe-crux
	install -d $(DESTDIR)/$(CONFDIR)
	install -m 0644 etc/safe-crux.conf $(DESTDIR)/$(CONFDIR)/safe-crux.conf
	install -d $(DESTDIR)/$(MANDIR)/man{1,5}
	install -D -m 0644 man/safe-crux.1 $(DESTDIR)/$(MANDIR)/man1/safe-crux.1
	install -D -m 0644 man/safe-crux.conf.5 $(DESTDIR)/$(MANDIR)/man5/safe-crux.conf.5
