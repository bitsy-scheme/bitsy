# SPDX-License-Identifier: ISC
# Copyright (c) 2024 Masanori Ogino
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

.POSIX:

BIBTEX  = bibtex
CTANGLE = ctangle
CWEAVE  = cweave
PDFTEX  = luatex

LDLIBS = -lm

.PHONY: all
all: bin/bitsy

.PHONY: doc
doc: bitsy.pdf

.PHONY: regen
regen:
	$(CTANGLE) bitsy
	$(CWEAVE) bitsy

.PHONY: regen-check
regen-check:
	mv bitsy.c bitsy.c.orig
	$(CTANGLE) bitsy
	diff bitsy.c.orig bitsy.c
	rm -f bitsy.c.orig

.PHONY: clean
clean:
	rm -rf bin
	rm -f *.aux *.bbl *.blg *.idx *.log *.o *.orig *.out *.pdf *.scn *.tex *.toc

bin/bitsy: bitsy.o
	mkdir -p bin
	$(CC) $(LDFLAGS) bitsy.o -o $@ $(LDLIBS)

.SUFFIXES:
.SUFFIXES: .c .o .pdf .tex .w
.w.c:
	$(CTANGLE) $*
.w.tex:
	$(CWEAVE) $*
.c.o:
	$(CC) -c $(CPPFLAGS) $(CFLAGS) -o $@ $<
.tex.pdf:
	$(PDFTEX) -jobname=$* "\input eplain \input $*"
#	$(BIBTEX) $*
#	$(PDFTEX) -jobname=$* "\input eplain \input $*"
#	$(PDFTEX) -jobname=$* "\input eplain \input $*"
