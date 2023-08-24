# targets that aren't filenames
.PHONY: all clean deploy build serve

all: build

BIBBLE = bibble

_includes/mm.html: bib/mm.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/pixel.html: bib/pixel.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/mrag.html: bib/mrag.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/pubs.html: bib/bib.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/recent.html: bib/bib.bib bib/recent.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

build: _includes/recent.html _includes/pubs.html _includes/mrag.html _includes/mm.html _includes/pixel.html
	jekyll build

# you can configure these at the shell, e.g.:
# SERVE_PORT=5001 make serve
SERVE_HOST ?= 127.0.0.1
SERVE_PORT ?= 5000

serve: build
#_includes/pubs.html _includes/recent.html _includes/mrag.html  _includes/mm.html _includes/pixel.html
	jekyll serve --port $(SERVE_PORT) --host $(SERVE_HOST)

clean:
	$(RM) -r _site _includes/pubs.html _includes/recent.html _includes/mrag.html  _includes/mm.html _includes/pixel.html

DEPLOY_HOST ?= yourwebpage.com
DEPLOY_PATH ?= www/
RSYNC := rsync --compress --recursive --checksum --itemize-changes --delete -e ssh

deploy: clean build
	$(RSYNC) _site/ $(DEPLOY_HOST):$(DEPLOY_PATH)

