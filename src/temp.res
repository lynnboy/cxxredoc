[section#temp.res
    [:en] Name resolution
]

[para]
[:en]
[%overloading[!resolution[!template name]]]
[%lookup[!template name]]
Three kinds of names can be used within a template definition:

[list]
[item]
[:en]
The name of the template itself, and names declared within the template itself.

[item]
[:en]
Names dependent on a [~template-parameter] ([#temp.dep]).

[item]
[:en]
Names from scopes which are visible within the template definition.
[list:end]

[para]
[:en]
A name used in a template declaration or definition and that is dependent on a
[~template-parameter] is assumed not to name a type unless the applicable name
lookup finds a type name or the name is qualified by the keyword [`typename].

[enter:example]
[codeblock]
// [:en] no [`B] declared here

class X;

template<class T> class Y {
  class Z;                      // [:en] forward declaration of member class

  void f() {
    X* a1;                      // [:en] declare pointer to [`X]
    T* a2;                      // [:en] declare pointer to [`T]
    Y* a3;                      // [:en] declare pointer to [`Y<T>]
    Z* a4;                      // [:en] declare pointer to [`Z]
    typedef typename T::A TA;
    TA* a5;                     // [:en] declare pointer to [`T][=']s [`A]
    typename T::A* a6;          // [:en] declare pointer to [`T][=']s [`A]
    T::A* a7;                   // [:en] [`T::A] is not a type name:
                                // [:en@~] multiply [`T::A] by [`a7]; ill-formed,
                                // [:en@~] no visible declaration of [`a7]
    B* a8;                      // [:en] [`B] is not a type name:
                                // [:en@~] multiply [`B] by [`a8]; ill-formed,
                                // [:en@~] no visible declarations of [`B] and [`a8]
  }
};
[codeblock:end]
[exit:example]

[para]
[:en]
When a [~qualified-id] is intended to refer to a type that is not a member of
the current instantiation ([#temp.dep.type]) and its [~nested-name-specifier]
refers to a dependent type, it shall be prefixed by the keyword [`typename],
forming a [~typename-specifier].

[:en]
If the [~qualified-id] in a [~typename-specifier] does not denote a type, the
program is ill-formed.

[syntax]
[rule typename-specifier [:zh_CN] ]
    [| [`typename] nested-name-specifier identifier ]
    [| [`typename] nested-name-specifier [`:opt template] simple-template-id ]
[rule:end]
[syntax:end]

[para]
[:en]
If a specialization of a template is instantiated for a set of
[~template-argument]s such that the [~qualified-id] prefixed by [`typename]
does not denote a type, the specialization is ill-formed.

[:en]
The usual qualified name lookup ([#basic.lookup.qual]) is used to find the
[~qualified-id] even in the presence of [`typename].

[enter:example]
[codeblock]
struct A {
  struct X { };
  int X;
};
struct B {
  struct X { };
};
template<class T> void f(T t) {
  typename T::X x;
}
void foo() {
  A a;
  B b;
  f(b);             // [:en] OK: [`T::X] refers to [`B::X]
  f(a);             // [:en] error: [`T::X] refers to the data member [`A::X] not the struct [`A::X]
}
[codeblock:end]
[exit:example]

[para]
[:en]
A qualified name used as the name in a [~mem-initializer-id], a
[~base-specifier], or an [~elaborated-type-specifier] is implicitly assumed to
name a type, without the use of the [`typename] keyword.

[:en]
In a [~nested-name-specifier] that immediately contains a
[~nested-name-specifier] that depends on a template parameter, the [~identifier]
or [~simple-template-id] is implicitly assumed to name a type, without the use
of the [`typename] keyword.

[enter:note]
The [`typename] keyword is not permitted by the syntax of these constructs.
[exit:note]

[para]
[:en]
If, for a given set of template arguments, a specialization of a template is
instantiated that refers to a [~qualified-id] that denotes a type, and the
[~qualified-id] refers to a member of an unknown specialization, the
[~qualified-id] shall either be prefixed by [`typename] or shall be used in a
context in which it implicitly names a type as described above.

[enter:example]
[codeblock]
template <class T> void f(int i) {
  T::x * i;         // [:en] [`T::x] must not be a type
}

struct Foo {
  typedef int x;
};

struct Bar {
  static int const x = 5;
};

int main() {
  f<Bar>(1);        // OK
  f<Foo>(1);        // [:en] error: [`Foo::x] is a type
}
[codeblock:end]
[exit:example]

[para]
[:en]
Within the definition of a class template or within the definition of a member
of a class template following the [~declarator-id], the keyword [`typename]
is not required when referring to the name of a previously declared member of
the class template that declares a type.

[enter:note]
[:en]
such names can be found using unqualified name lookup ([#basic.lookup.unqual]),
class member lookup ([#class.qual]) into the current instantiation
([#temp.dep.type]), or class member access expression lookup
([#basic.lookup.classref]) when the type of the object expression is the current
instantiation ([#temp.dep.expr]).
[exit:note]

[enter:example]
[codeblock]
template<class T> struct A {
  typedef int B;
  B b;              // [:en] OK, no typename required
};
[codeblock:end]
[exit:example]

[para]
[:en]
[%checking[!syntax]]
[%checking[!point of error]]
Knowing which names are type names allows the syntax of every template to be
checked.

[:en]
No diagnostic shall be issued for a template for which a valid specialization
can be generated.

[:en]
If no valid specialization can be generated for a template, and that template is
not instantiated, the template is ill-formed, no diagnostic required.

[:en]
If every valid specialization of a variadic template requires an empty template
parameter pack, the template is ill-formed, no diagnostic required.

[:en]
If a hypothetical instantiation of a template immediately following its
definition would be ill-formed due to a construct that does not depend on a
template parameter, the program is ill-formed; no diagnostic is required.

[:en]
If the interpretation of such a construct in the hypothetical instantiation is
different from the interpretation of the corresponding construct in any actual
instantiation of the template, the program is ill-formed; no diagnostic is
required.

[enter:note]
[:en]
This can happen in situations including the following:

[list]
[item]
[:en] a type used in a non-dependent name is incomplete at the point at which a
template is defined but is complete at the point at which an instantiation is
performed, or

[item]
[:en] an instantiation uses a default argument or default template argument
that had not been defined at the point at which the template was defined, or

[item]
[:en] constant expression evaluation ([#expr.const]) within the template
instantiation uses

[list]
[item]
[:en@~] the value of a [`const] object of integral or unscoped enumeration type
or
[item]
[:en@~] the value of a [`constexpr] object or
[item]
[:en@~] the value of a reference or
[item]
[:en@~] the definition of a [`constexpr] function,
[list:end]

[:en@~]
and that entity was not defined when the template was defined, or

[item]
[:en] a class template specialization or variable template specialization that
is specified by a non-dependent [~simple-template-id] is used by the template,
and either it is instantiated from a partial specialization that was not defined
when the template was defined or it names an explicit specialization that was
not declared when the template was defined.
[list:end]
[exit:note]

[enter:note]
[:en]
If a template is instantiated, errors will be diagnosed according
to the other rules in this Standard.
Exactly when these errors are diagnosed is a quality of implementation issue.
[exit:note]

[enter:example]
[codeblock]
int j;
template<class T> class X {
  void f(T t, int i, char* p) {
    t = i;          // [:en] diagnosed if [`X::f] is instantiated
                    // [:en@~] and the assignment to [`t] is an error
    p = i;          // [:en] may be diagnosed even if [`X::f] is
                    // [:en@~] not instantiated
    p = j;          // [:en] may be diagnosed even if [`X::f] is
                    // [:en@~] not instantiated
  }
  void g(T t) {
    +;              // [:en] may be diagnosed even if [`X::g] is
                    // [:en@~] not instantiated
  }
};

template<class... T> struct A {
  void operator++(int, T... t);                 // [:en] error: too many parameters
};
template<class... T> union X : T... { };        // [:en] error: union with base class
template<class... T> struct A : T...,  T... { };// [:en] error: duplicate base class
[codeblock:end]
[exit:example]

[para]
[:en]
When looking for the declaration of a name used in a template definition, the
usual lookup rules ([#basic.lookup.unqual], [#basic.lookup.argdep]) are used for
non-dependent names.

[:en]
The lookup of names dependent on the template parameters is postponed until the
actual template argument is known ([#temp.dep]).

[enter:example]
[codeblock]
#include <iostream>
using namespace std;

template<class T> class Set {
  T* p;
  int cnt;
public:
  Set();
  Set<T>(const Set<T>&);
  void printall() {
    for (int i = 0; i<cnt; i++)
      cout << p[i] << '\n';
  }
};
[codeblock:end]

[:en]
in the example, [`i] is the local variable [`i] declared in [`printall], [`cnt]
is the member [`cnt] declared in [`Set], and [`cout] is the standard output
stream declared in [`iostream].

[:en]
However, not every declaration can be found this way; the resolution of some
names must be postponed until the actual [~template-argument]s are known.

[:en]
For example, even though the name [`operator<<] is known within the definition
of [`printall()] and a declaration of it can be found in [`<iostream>], the
actual declaration of [`operator<<] needed to print [`p[i`]] cannot be known
until it is known what type [`T] is ([#temp.dep]).
[exit:example]

[para]
[:en]
If a name does not depend on a [~template-parameter] (as defined in
[#temp.dep]), a declaration (or set of declarations) for that name shall be in
scope at the point where the name appears in the template definition; the name
is bound to the declaration (or declarations) found at that point and this
binding is not affected by declarations that are visible at the point of
instantiation.

[enter:example]
[codeblock]
void f(char);

template<class T> void g(T t) {
  f(1);             // [`f(char)]
  f(T(1));          // [:en] dependent
  f(t);             // [:en] dependent
  dd++;             // [:en] not dependent
                    // [:en@~] error: declaration for [`dd] not found
}

enum E { e };
void f(E);

double dd;
void h() {
  g(e);             // [:en] will cause one call of [`f(char)] followed
                    // [:en@~] by two calls of [`f(E)]
  g('a');           // [:en] will cause three calls of [`f(char)]
}
[codeblock:end]
[exit:example]

[para]
[enter:note]
[:en]
For purposes of name lookup, default arguments and [~exception-specification]s
of function templates and default arguments and [~exception-specification]s of
member functions of class templates are considered definitions ([#temp.decls]).
[exit:note]

[include temp.local]

[include temp.dep]

[include temp.nondep]

[include temp.dep.res]

[include temp.inject]
