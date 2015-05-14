[section#temp.spec
    [:en] Template instantiation and specialization
    [:zh_CN] 模板的实例化和特化
]

[para]
[:en]
[%specialization[!template]]
The act of instantiating a function, a class, a member of a class template or
a member template is referred to as [+template instantiation].
[:zh_CN]
[%特例[!模板～]]
函数，类，类模板的成员，或者成员模板的落实动作被称作[+模板实例化]。

[para]
[:en]
A function instantiated from a function template is called an instantiated
function.
[:zh_CN]
从函数模板中实例化出来的函数被称为已实例化函数。

[:en]
A class instantiated from a class template is called an instantiated class.
[:zh_CN]
从类模板中实例化出来的类被称为已实例化类。

[:en]
A member function, a member class, a member enumeration, or a static data member
of a class template instantiated from the member definition of the class
template is called, respectively, an instantiated member function, member class,
member enumeration, or static data member.
[:zh_CN]
从类模板的成员定义中实例化出来的类模板的成员函数，成员类，成员枚举或静态数据成员
分别被称为已实例化成员函数，成员类，成员枚举或静态数据成员。

[:en]
A member function instantiated from a member function template is called an
instantiated member function.
[:zh_CN]
从成员函数模板中实例化出来的成员函数被称为已实例化成员函数。

[:en]
A member class instantiated from a member class template is called an
instantiated member class.
[:zh_CN]
从成员类模板中实例化出来的成员类被称为已实例化成员类。

[para]
[:en]
An explicit specialization may be declared for a function template, a class
template, a member of a class template or a member template.
[:zh_CN]
可以为函数模板，类模板，类模板的成员，或者成员模板声明显式特化式。

[:en]
An explicit specialization declaration is introduced by [`template<>].
[:zh_CN]
显式特化声明式是以 [`template<>] 开始的。

[:en]
In an explicit specialization declaration for a class template, a member of a
class template or a class member template, the name of the class that is
explicitly specialized shall be a [~simple-template-id].
[:zh_CN]
在类模板，类模板的成员或类成员模板的显式特化声明式中，被显式特化的类的名字应当为
[~简单模板标识]。

[:en]
In the explicit specialization declaration for a function template or a member
function template, the name of the function or member function explicitly
specialized may be a [~template-id].
[:zh_CN]
在函数模版或成员函数模板的显式特化声明式中，被显式特化的函数或成员函数的名字可以
为[~模板标识]。

[enter:example]
[codeblock]
template<class T = int> struct A {
  static int x;
};
template<class U> void g(U) { }

template<> struct A<double> { };        // [:en] specialize for [`T == double]
                                        // [|:zh_CN] 为 [`T == double] 特化
template<> struct A<> { };              // [:en] specialize for [`T == int]
                                        // [|:zh_CN] 为 [`T == int] 特化
template<> void g(char) { }             // [:en] specialize for [`U == char]
                                        // [|:zh_CN] 为 [`U == char] 特化
                                        // [:en@~] [`U] is deduced from the parameter type
                                        // [|:zh_CN@~] [`U] 从形参类型推断出来
template<> void g<int>(int) { }         // [:en] specialize for [`U == int]
                                        // [|:zh_CN] 为 [`U == int] 特化
template<> int A<char>::x = 0;          // [:en] specialize for [`T == char]
                                        // [|:zh_CN] 为 [`T == char] 特化

template<class T = int> struct B {
  static int x;
};
template<> int B<>::x = 1;              // [:en] specialize for [`T == int]
                                        // [|:zh_CN] 为 [`T == int] 特化
[codeblock:end]
[exit:example]

[para]
[:en]
An instantiated template specialization can be either implicitly instantiated
([#temp.inst]) for a given argument list or be explicitly instantiated
([#temp.explicit]).
[:zh_CN]
已实例化的模板特例，既可以对给定的实参列表进行隐式实例化（[#temp.inst]），也可以
进行显式实例化（[#temp.explicit]）。

[:en]
A specialization is a class, function, or class member that is either
instantiated or explicitly specialized ([#temp.expl.spec]).
[:zh_CN]
特例是要么被实例化要么被显式特化（[#temp.expl.spec]）的类，函数，或者类成员。

[para]
[:en]
For a given template and a given set of [~template-argument]s,
[:zh_CN]
对于一个给定的模板和一组给定的[~模板实参]，

[list]
[item]
[:en] an explicit instantiation definition shall appear at most once in a
program,
[:zh_CN] 显式实例化定义式在程序中应当最多出现一次，

[item]
[:en] an explicit specialization shall be defined at most once in a program
(according to [#basic.def.odr]), and
[:zh_CN] 其显式特化式在程序中应当最多被定义一次（根据 [#basic.def.odr]），并且

[item]
[:en] both an explicit instantiation and a declaration of an explicit
specialization shall not appear in a program unless the explicit instantiation
follows a declaration of the explicit specialization.
[:zh_CN] 在程序中不能同时出现显式实例化式和显示特化声明式，除非该显式实例化式
处于该显式特化声明式之后。
[list:end]

[:en]
An implementation is not required to diagnose a violation of this rule.
[:zh_CN]
实现不需要对这条规则的违反进行诊断。

[para]
[:en]
Each class template specialization instantiated from a template has its own copy
of any static members.
[:zh_CN]
从同一个模板实例化出来的每个类模板特例都带有任何静态成员的其自己的副本。

[enter:example]
[codeblock]
template<class T> class X {
  static T s;
};
template<class T> T X<T>::s = 0;
X<int> aa;
X<char*> bb;
[codeblock:end]

[:en]
[`X<int>] has a static member [`s] of type [`int] and [`X<char*>] has a static
member [`s] of type [`char*].
[:zh_CN]
[`X<int>] 具有类型为 [`int] 的静态成员 [`s]，而 [`X<char*>] 具有类型为 [`char*]
的静态成员 [`s]。
[exit:example]

[include temp.inst]

[include temp.explicit]

[include temp.expl.spec]
