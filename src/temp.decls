[section#temp.decls
    [:en] Template declarations
]

[para]
[:en]
A [~template-id], that is, the [~template-name] followed by a
[~template-argument-list] shall not be specified in the declaration of a primary
template declaration.

[enter:example]
[codeblock]
template<class T1, class T2, int I> class A<T1, T2, I> { };     // [:en] error
template<class T1, int I> void sort<T1, I>(T1 data[I]);         // [:en] error
[codeblock:end]
[exit:example]

[enter:note]
[:en]
However, this syntax is allowed in class template partial specializations
([#temp.class.spec]).
[exit:note]

[para]
[:en]
For purposes of name lookup and instantiation, default arguments and
[~exception-specification]s of function templates and default arguments and
[~exception-specification]s of member functions of class templates are
considered definitions; each default argument or [~exception-specification] is a
separate definition which is unrelated to the function template definition or to
any other default arguments or [~exception-specification]s.

[para]
[:en]
Because an [~alias-declaration] cannot declare a [~template-id], it is not
possible to partially or explicitly specialize an alias template.

[include temp.class]

[include temp.mem]

[include temp.variadic]

[include temp.friend]

[include temp.class.spec]

[include temp.fct]

[include temp.alias]
