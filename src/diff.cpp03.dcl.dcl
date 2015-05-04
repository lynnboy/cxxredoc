[section#diff.cpp03.dcl.dcl
    [:en] Clause [#dcl.dcl]: declarations
]

[#dcl.spec]
[para:change]
[:en] Remove [`auto] as a storage class specifier
[para:rationale]
[:en] New feature.
[para:effect]
[:en] Valid [=Cpp] 2003 code that uses the keyword [`auto] as a storage class
specifier may be invalid in this International Standard.
[:en] In this International Standard, [`auto] indicates that the type of a
variable is to be deduced from its initializer expression.
