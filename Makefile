# targets that aren't filenames
.PHONY: all clean deploy build serve

SERVE_HOST ?= 127.0.0.1
SERVE_PORT ?= 5000

all: build

BIBBLE = bibble

_includes/multimodal.html: bib/multimodal.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/pixel.html: bib/pixel.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/rag.html: bib/rag.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/pubs.html: bib/bib.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_includes/recent.html: bib/bib.bib bib/recent.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

build: _includes/recent.html _includes/pubs.html _includes/rag.html _includes/multimodal.html _includes/pixel.html
	jekyll build

serve: build
	jekyll serve --port $(SERVE_PORT) --host $(SERVE_HOST)

debug: build
	jekyll serve --verbose --port $(SERVE_PORT) --host $(SERVE_HOST)

clean:
	$(RM) -r _site _includes/pubs.html _includes/recent.html _includes/rag.html  _includes/mm.html _includes/pixel.html
