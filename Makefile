DESTDIR = 

PREFIX  = /opt
BINDIR  = $(PREFIX)/bin
DATADIR = $(PREFIX)/scx

.PHONY: all install

all: clean safe-crux.wrapper

clean:
	rm -f safe-crux.wrapper

safe-crux.wrapper: safe-crux.wrapper.in
	sed "s|BASEDIR=.*|BASEDIR=$(DATADIR)|" safe-crux.wrapper.in > safe-crux.wrapper

install: safe-crux.wrapper
	install -d $(DESTDIR)/$(BINDIR)
	install -m 0755 safe-crux.wrapper $(DESTDIR)/$(BINDIR)/safe-crux
	ln -sf safe-crux $(DESTDIR)/$(BINDIR)/scx
	install -d $(DESTDIR)/$(DATADIR)
	install -m 0755 safe-crux $(DESTDIR)/$(DATADIR)/safe-crux
	install -m 0644 safe-crux.conf $(DESTDIR)/$(DATADIR)/safe-crux.conf
	cp -r bin lib scx.d var $(DESTDIR)/$(DATADIR)
	ln -s x86_64-32 $(DESTDIR)/$(DATADIR)/scx.d/x86_64
