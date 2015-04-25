[section#temp.spec
    [:en] Template instantiation and specialization
]

[para]
[:en]
[%specialization[!template]]
The act of instantiating a function, a class, a member of a class template or
a member template is referred to as [+template instantiation].

[para]
[:en]
A function instantiated from a function template is called an instantiated
function.

[:en]
A class instantiated from a class template is called an instantiated class.

[:en]
A member function, a member class, a member enumeration, or a static data member
of a class template instantiated from the member definition of the class
template is called, respectively, an instantiated member function, member class,
member enumeration, or static data member.

[:en]
A member function instantiated from a member function template is called an
instantiated member function.

[:en]
A member class instantiated from a member class template is called an
instantiated member class.

[para]
[:en]
An explicit specialization may be declared for a function template, a class
template, a member of a class template or a member template.

[:en]
An explicit specialization declaration is introduced by [`template<>].

[:en]
In an explicit specialization declaration for a class template, a member of a
class template or a class member template, the name of the class that is
explicitly specialized shall be a [~simple-template-id].

[:en]
In the explicit specialization declaration for a function template or a member
function template, the name of the function or member function explicitly
specialized may be a [~template-id].

[enter:example]
[codeblock]
template<class T = int> struct A {
  static int x;
};
template<class U> void g(U) { }

template<> struct A<double> { };        // [:en] specialize for [`T == double]
template<> struct A<> { };              // [:en] specialize for [`T == int]
template<> void g(char) { }             // [:en] specialize for [`U == char]
                                        // [:en] [`U] is deduced from the parameter type
template<> void g<int>(int) { }         // [:en] specialize for [`U == int]
template<> int A<char>::x = 0;          // [:en] specialize for [`T == char]

template<class T = int> struct B {
  static int x;
};
template<> int B<>::x = 1;              // [:en] specialize for [`T == int]
[codeblock:end]
[exit:example]

[para]
[:en]
An instantiated template specialization can be either implicitly instantiated
([#temp.inst]) for a given argument list or be explicitly instantiated
([#temp.explicit]).

[:en]
A specialization is a class, function, or class member that is either
instantiated or explicitly specialized ([#temp.expl.spec]).

[para]
[:en]
For a given template and a given set of [~template-argument]s,

[list]
[item]
[:en] an explicit instantiation definition shall appear at most once in a
program,

[item]
[:en] an explicit specialization shall be defined at most once in a program
(according to [#basic.def.odr]), and

[item]
[:en] both an explicit instantiation and a declaration of an explicit
specialization shall not appear in a program unless the explicit instantiation
follows a declaration of the explicit specialization.
[list:end]

[:en]
An implementation is not required to diagnose a violation of this rule.

[para]
[:en]
Each class template specialization instantiated from a template has its own copy
of any static members.

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
[exit:example]

[include temp.inst]

[include temp.explicit]

[include temp.expl.spec]
