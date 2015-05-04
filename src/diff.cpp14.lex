[section#diff.cpp14.lex
    [:en] Clause [#lex]: lexical conventions
]

[#lex.phases]
[:en] [%trigraph sequence]
[para:change]
[:en] Removal of trigraph support as a required feature.
[para:rationale]
[:en] Prevents accidental uses of trigraphs in non-raw string literals and
comments.
[para:effect]
[:en] Valid [=Cpp] 2014 code that uses trigraphs may not be valid or may have
different semantics in this International Standard.
[:en] Implementations may choose to translate trigraphs as specified in [=Cpp]
2014 if they appear outside of a raw string literal, as part of the
implementation-defined mapping from physical source file characters to the basic
source character set.
