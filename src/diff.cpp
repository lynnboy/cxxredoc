[section#diff.cpp
    [:en] Clause [#cpp]: preprocessing directives
]

[#cpp.predefined]
[para:change]
[:en] Whether [`__STDC__] is defined and if so, what its value is, are
implementation-defined
[para:rationale]
[:en] [=Cpp] is not identical to ISO C.
[:en] Mandating that [`__STDC__] be defined would require that translators make
an incorrect claim.
[:en] Each implementation must choose the behavior that will be most useful to
its marketplace.
[para:effect]
[:en] Change to semantics of well-defined feature.
[para:difficulty]
[:en] Semantic transformation.
[para:howwide]
[:en] Programs and headers that reference [`__STDC__] are quite common.
