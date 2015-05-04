[section#diff.cpp11.dcl.dcl
    [:en] Clause [#dcl.dcl]: declarations
]

[#dcl.constexpr]
[para:change]
[:en] [`constexpr] non-static member functions are not implicitly [`const]
member functions.
[para:rationale]
[:en] Necessary to allow [`constexpr] member functions to mutate the object.
[para:effect]
[:en] Valid [=Cpp] 2011 code may fail to compile in this International Standard.
[:en] For example, the following code is valid in [=Cpp] 2011 but invalid in
this International Standard because it declares the same member function twice
with different return types:

[codeblock]
struct S {
  constexpr const int &f();
  int &f();
};
[codeblock:end]
