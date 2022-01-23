function _nix_fmt(o, s) {
    /* return `
@command{fmt} prefers breaking lines at the end of a sentence,
and tries to avoid line breaks after the first word of a sentence
or before the last word of a sentence.  A @dfn{sentence break}
is defined as either the end of a paragraph or a word ending
in any of @samp{.?!}, followed by two spaces or end of line,
ignoring any intervening parentheses or quotes.  Like @TeX{},
@command{fmt} reads entire ''paragraphs'' before choosing line
breaks; the algorithm is a variant of that given by Donald
E. Knuth and Michael F. Plass in ''Breaking Paragraphs Into
Lines'', @cite{Software---Practice & Experience} @b{11}, 11
(November 1981), 1119--1184.`; */
    return "not implemented";
}
