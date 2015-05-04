[section#diff.cpp11.lex
    [:en] Clause [#lex]: lexical conventions
]

[#lex.ppnumber]
[para:change]
[:en] [~pp-number] can contain one or more single quotes.
[para:rationale]
[:en] Necessary to enable single quotes as digit separators.
[para:effect]
[:en] Valid [=Cpp] 2011 code may fail to compile or may change meaning in this
International Standard.
[:en] For example, the following code is valid both in [=Cpp] 2011 and in this
International Standard, but the macro invocation produces different outcomes
because the single quotes delimit a character literal in [=Cpp] 2011, whereas
they are digit separators in this International Standard:

[codeblock]
#define M(x, ...) __VA_ARGS__
int x[2] = { M(1'2,3'4) };
// [`int x[2`] = {};     ] [=--] [=Cpp] 2011
// [:en] [`int x[2`] = { 3'4 };] [=--] this International Standard
[codeblock:end]
