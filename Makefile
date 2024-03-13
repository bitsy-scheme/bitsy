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

CTANGLE = ctangle
CWEAVE  = cweave

LDLIBS = -lm

.PHONY: all
all: regen doc prog

.PHONY: doc
doc: bitsy.pdf

.PHONY: prog
prog: bin/bitsy

.PHONY: regen
regen: bitsy.c bitsy.tex

.PHONY: clean
clean:
	rm -rf bin
	rm -f *.aux *.bbl *.blg *.idx *.log *.o *.out *.pdf *.scn *.tex *.toc

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
	luatex -jobname=$* "\input eplain \input $*"
#	bibtex $*
#	luatex -jobname=$* "\input eplain \input $*"
#	luatex -jobname=$* "\input eplain \input $*"
