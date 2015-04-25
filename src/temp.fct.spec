[section#temp.fct.spec
    [:en] Function template specializations
]

[para]
[:en]
[%template[!function]]
A function instantiated from a function template is called a function template
specialization; so is an explicit specialization of a function template.

[:en]
Template arguments can be explicitly specified when naming the function template
specialization, deduced from the context (e.g., deduced from the function
arguments in a call to the function template specialization, see
[#temp.deduct]), or obtained from default template arguments.

[para]
[:en]
Each function template specialization instantiated from a template has its own
copy of any static variable.

[enter:example]
[codeblock]
template<class T> void f(T* p) {
  static T s;
};

void g(int a, char* b) {
  f(&a);            // [:en] calls [`f<int>(int*)]
  f(&b);            // [:en] calls [`f<char*>(char**)]
}
[codeblock:end]

[:en]
Here [`f<int>(int*)] has a static variable [`s] of type [`int] and
[`f<char*>(char**)] has a static variable [`s] of type [`char*].
[exit:example]

[include temp.arg.explicit]

[include temp.deduct]

[include temp.over]
