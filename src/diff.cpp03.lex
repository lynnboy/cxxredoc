[section#diff.cpp03.lex
    [:en] Clause [#lex]: lexical conventions
]

[#lex.pptoken]
[para:change]
[:en] New kinds of string literals
[para:rationale]
[:en] Required for new features.
[para:effect]
[:en] Valid [=Cpp] 2003 code may fail to compile or produce different results in
this International Standard.
[:en] Specifically, macros named [`R], [`u8], [`u8R], [`u], [`uR], [`U], [`UR],
or [`LR] will not be expanded when adjacent to a string literal but will be
interpreted as part of the string literal.
[:en] For example,

[codeblock]
#define u8 "abc"
const char* s = u8"def";        // [:en] Previously [`"abcdef"], now [`"def"]
[codeblock:end]

[para:~]
[#lex.pptoken]
[para:change]
[:en] User-defined literal string support
[para:rationale]
[:en] Required for new features.
[para:effect]
[:en] Valid [=Cpp] 2003 code may fail to compile or produce different results in
this International Standard, as the following example illustrates.

[codeblock]
#define _x "there"
"hello"_x         // #1
[codeblock:end]

[:en] Previously, #1 would have consisted of two separate preprocessing tokens
and the macro [`_x] would have been expanded.
[:en] In this International Standard, #1 consists of a single preprocessing
tokens, so the macro is not expanded.

[para:~]
[#lex.key]
[para:change]
[:en] New keywords
[para:rationale]
[:en] Required for new features.
[para:effect]
[:en] Added to Table [#tab:keywords], the following identifiers are new
keywords: [`alignas], [`alignof], [`char16_t], [`char32_t], [`constexpr],
[`decltype], [`noexcept], [`nullptr], [`static_assert], and [`thread_local].
[:en] Valid [=Cpp] 2003 code using these identifiers is invalid in this
International Standard.

[para:~]
[#lex.icon]
[para:change]
[:en] Type of integer literals
[para:rationale]
[:en] C99 compatibility.
[para:effect]
[:en] Certain integer literals larger than can be represented by [`long] could
change from an unsigned integer type to [`signed long long].
