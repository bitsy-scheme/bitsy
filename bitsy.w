% SPDX-License-Identifier: ISC
% Copyright (c) 2024 Masanori Ogino
%
% Permission to use, copy, modify, and distribute this software for any
% purpose with or without fee is hereby granted, provided that the above
% copyright notice and this permission notice appear in all copies.
%
% THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
% WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
% MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
% ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

% eplain is preloaded; see Makefile

\beginpackages
\usepackage{url}
\endpackages

\parskip=2pt plus 1pt

\def\title{Bitsy Scheme, Version VERSION}
\def\topofcontents{\vfill
  \centerline{\titlefont Bitsy Scheme}
  \vskip 5pt
  \centerline{Version VERSION}
  \vskip 15pt
  \centerline{Masanori Ogino}
  \vfill}
\def\botofcontents{\vfill
\noindent
Copyright \copyright{} 2024 Masanori Ogino

\bigskip\noindent
Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

\smallskip\noindent
THE SOFTWARE IS PROVIDED ``AS IS'' AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
}
\pageno=\contentspagenumber \advance\pageno by 1

@** Introduction.
Bitsy Scheme is an implementation of the Scheme programming language.

@ Here is a program printing the banner.

@c
#include <stdio.h>

int main(int argc, char *argv[])
{
    puts("Bitsy Scheme, Version VERSION");
    return 0;
}

@** References.

%\bibliography{public}
%\bibliographystyle{plain}

@** Index.
