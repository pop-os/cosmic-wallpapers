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
	done

uninstall:
	for file in $(ORIGINAL); do \
		rm -f "$(DESTDIR)$(datadir)/backgrounds/cosmic/$$(basename "$$file")"; \
	done
	rmdir --ignore-fail-on-non-empty "$(DESTDIR)$(datadir)/backgrounds/cosmic/"
