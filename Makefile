DESTDIR = 

PREFIX  = /usr/local
BINDIR  = $(PREFIX)/bin
DATADIR = $(PREFIX)/share/safe-crux
MANDIR  = $(PREFIX)/share/man

.PHONY: all install

all: clean safe-crux.wrapper

clean:
	@rm safe-crux.wrapper

safe-crux.wrapper: safe-crux.wrapper.in
	@sed "s|BASEDIR=.*|BASEDIR=$(DESTDIR)$(DATADIR)|" safe-crux.wrapper.in > safe-crux.wrapper

install: safe-crux.wrapper
	@echo "Installing safe-crux $(DESTDIR)"
	@install -d $(DESTDIR)/$(DATADIR)
	@install -m 0755 safe-crux $(DESTDIR)/$(DATADIR)/safe-crux
	@cp -r bin doc etc $(DESTDIR)/$(DATADIR)
	@install -d $(DESTDIR)/$(BINDIR)
	@install -m 0755 safe-crux.wrapper $(DESTDIR)/$(BINDIR)/safe-crux
	@ln -sf safe-crux $(DESTDIR)/$(BINDIR)/scx
	@install -d $(DESTDIR)/$(MANDIR)/man{1,5}
	@install -D -m 0644 man/safe-crux.1 $(DESTDIR)/$(MANDIR)/man1/safe-crux.1
	@cd $(DESTDIR)/$(MANDIR)/man1 && gzip -f9 safe-crux.1
	@ln -sf safe-crux.1.gz $(DESTDIR)/$(MANDIR)/man1/scx.1.gz
	@install -D -m 0644 man/safe-crux.conf.5 $(DESTDIR)/$(MANDIR)/man5/safe-crux.conf.5
	@cd $(DESTDIR)/$(MANDIR)/man5 && gzip -f9 safe-crux.conf.5
	@echo "Done"
