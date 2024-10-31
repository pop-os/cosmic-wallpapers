ORIGINAL=$(wildcard original/*)

prefix ?= /usr
datarootdir = $(prefix)/share
datadir = $(datarootdir)

.PHONY: all clean install uninstall

all:

clean:
	rm -rf build scaled

install: all
	for file in $(ORIGINAL); do \
		install -D -m 0644 "$$file" "$(DESTDIR)$(datadir)/backgrounds/cosmic/$$(basename "$$file")"; \
		install -D -m 0644 "$$file" "$(DESTDIR)$(datadir)/wallpapers/cosmic/contents/images/$$(basename "$$file")"; \
	done
	install -D -m 0644 "data/metadata.desktop" "$(DESTDIR)$(datadir)/wallpapers/cosmic/metadata.desktop"

uninstall:
	for file in $(ORIGINAL); do \
		rm -f "$(DESTDIR)$(datadir)/backgrounds/cosmic/$$(basename "$$file")"; \
		rm -f "$(DESTDIR)$(datadir)/wallpapers/cosmic/contents/images/$$(basename "$$file")"; \
	done
	rm -f "$(DESTDIR)$(datadir)/wallpapers/cosmic/metadata.desktop"
	rmdir --ignore-fail-on-non-empty "$(DESTDIR)$(datadir)/wallpapers/cosmic/contents/images/"
	rmdir --ignore-fail-on-non-empty "$(DESTDIR)$(datadir)/wallpapers/cosmic/contents/"
	rmdir --ignore-fail-on-non-empty "$(DESTDIR)$(datadir)/wallpapers/cosmic/"
	rmdir --ignore-fail-on-non-empty "$(DESTDIR)$(datadir)/backgrounds/cosmic/"
