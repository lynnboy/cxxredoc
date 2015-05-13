[section#temp.decls
    [:en] Template declarations
    [:zh_CN] 模板声明式
]

[para]
[:en]
A [~template-id], that is, the [~template-name] followed by a
[~template-argument-list] shall not be specified in the declaration of a primary
template declaration.
[:zh_CN]
[~模板标识]，也就是[~模板名]后面跟着[~模板实参列表]，不能在主模板声明式的声明式
中指定。

[enter:example]
[codeblock]
template<class T1, class T2, int I> class A<T1, T2, I> { };     // [:en] error
                                                                // [|:zh_CN] 错误
template<class T1, int I> void sort<T1, I>(T1 data[I]);         // [:en] error
                                                                // [|:zh_CN] 错误
[codeblock:end]
[exit:example]

[enter:note]
[:en]
However, this syntax is allowed in class template partial specializations
([#temp.class.spec]).
[:zh_CN]
然而，在类模板部分特化式中允许这种语法（[#temp.class.spec]）。
[exit:note]

[para]
[:en]
For purposes of name lookup and instantiation, default arguments and
[~exception-specification]s of function templates and default arguments and
[~exception-specification]s of member functions of class templates are
considered definitions; each default argument or [~exception-specification] is a
separate definition which is unrelated to the function template definition or to
any other default arguments or [~exception-specification]s.
[:zh_CN]
进行名字查找和实例化时，函数模板的默认实参和[~异常说明]，以及类模板的成员函数的
默认实参和[~异常说明]被当作是定义式；每个默认实参或[~异常说明]都被当作是与其函数
模板定义式或其他任何默认实参或[~异常说明]都不相关的独立的定义式。

[para]
[:en]
Because an [~alias-declaration] cannot declare a [~template-id], it is not
possible to partially or explicitly specialize an alias template.
[:zh_CN]
由于[~别名声明式]无法声明[~模板标识]，所以不可能对别名模板进行部分特化或者显式
特化。

[include temp.class]

[include temp.mem]

[include temp.variadic]

[include temp.friend]

[include temp.class.spec]

[include temp.fct]

[include temp.alias]
