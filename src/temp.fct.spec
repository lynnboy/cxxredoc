[section#temp.fct.spec
    [:en] Function template specializations
    [:zh_CN] 函数模板特例
]

[para]
[:en]
[%template[!function]]
A function instantiated from a function template is called a function template
specialization; so is an explicit specialization of a function template.
[:zh_CN]
[%模板[!函数～]]
从函数模板（以及函数模板的显式特化式）中实例化出来的函数被称为函数模板特例。

[:en]
Template arguments can be explicitly specified when naming the function template
specialization, deduced from the context (e.g., deduced from the function
arguments in a call to the function template specialization, see
[#temp.deduct]), or obtained from default template arguments.
[:zh_CN]
模板实参可以在指名函数模板特例时被显式指定，从其语境中推断出来（比如在对函数模板
特例的调用中从其函数实参中推断出来，参见 [#temp.deduct]），或者从默认模板实参中
获得。

[para]
[:en]
Each function template specialization instantiated from a template has its own
copy of any static variable.
[:zh_CN]
从某模板中实例化出来的每个函数模板特例，均具有任何静态变量的自己的副本。

[enter:example]
[codeblock]
template<class T> void f(T* p) {
  static T s;
};

void g(int a, char* b) {
  f(&a);            // [:en] calls [`f<int>(int*)]
                    // [|:zh_CN] 调用 [`f<int>(int*)]
  f(&b);            // [:en] calls [`f<char*>(char**)]
                    // [|:zh_CN] 调用 [`f<char*>(char**)]
}
[codeblock:end]

[:en]
Here [`f<int>(int*)] has a static variable [`s] of type [`int] and
[`f<char*>(char**)] has a static variable [`s] of type [`char*].
[:zh_CN]
此处 [`f<int>(int*)] 带有 [`int] 类型的静态变量 [`s]，而 [`f<char*>(char**)]
带有 [`char*] 类型的静态变量 [`s]。
[exit:example]

[include temp.arg.explicit]

[include temp.deduct]

[include temp.over]
