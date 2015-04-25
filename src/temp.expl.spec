[section#temp.expl.spec
    [:en] Explicit specialization
]

[para]
[:en]
[%specialization[!template explicit]]
An explicit specialization of any of the following:

[list]
[item]
[:en@~] function template
[item]
[:en@~] class template
[item]
[:en@~] variable template
[item]
[:en@~] member function of a class template
[item]
[:en@~] static data member of a class template
[item]
[:en@~] member class of a class template
[item]
[:en@~] member enumeration of a class template
[item]
[:en@~] member class template of a class or class template
[item]
[:en@~] member function template of a class or class template
[list:end]

[:en@~]
can be declared by a declaration introduced by [`template<>]; that is:


[%[~explicit-specialization]]
[syntax]
[rule explicit-specialization [:zh_CN] ]
    [| [`template] [`<] [`>] declaration ]
[rule:end]
[syntax:end]

[enter:example]
[codeblock]
template<class T> class stream;

template<> class stream<char> { /* ... */ };

template<class T> class Array { /* ... */ };
template<class T> void sort(Array<T>& v) { /* ... */ }

template<> void sort<char*>(Array<char*>&) ;
[codeblock:end]

[:en]
Given these declarations, [`stream<char>] will be used as the definition of
streams of [`char]s; other streams will be handled by class template
specializations instantiated from the class template.

[:en]
Similarly, [`sort<char*>] will be used as the sort function for arguments of
type [`Array<char*>]; other [`Array] types will be sorted by functions generated
from the template.
[exit:example]

[para]
[:en]
An explicit specialization shall be declared in a namespace enclosing the
specialized template.

[:en]
An explicit specialization whose [~declarator-id] is not qualified shall be
declared in the nearest enclosing namespace of the template, or, if the
namespace is inline ([#namespace.def]), any namespace from its enclosing
namespace set.

[:en]
Such a declaration may also be a definition.

[:en]
If the declaration is not a definition, the specialization may be defined later
([#namespace.memdef]).

[para]
[:en]
A declaration of a function template, class template, or variable template being
explicitly specialized shall precede the declaration of the explicit
specialization.

[enter:note]
[:en]
A declaration, but not a definition of the template is required.
[exit:note]

[:en]
The definition of a class or class template shall precede the declaration of an
explicit specialization for a member template of the class or class template.

[enter:example]
[codeblock]
template<> class X<int> { /* ... */ };          // [:en] error: [`X] not a template

template<class T> class X;

template<> class X<char*> { /* ... */ };        // [:en] OK: [`X] is a template
[codeblock:end]
[exit:example]

[para]
[:en]
A member function, a member function template, a member class, a member
enumeration, a member class template, a static data member, or a static data
member template of a class template may be explicitly specialized for a class
specialization that is implicitly instantiated; in this case, the definition of
the class template shall precede the explicit specialization for the member of
the class template.

[:en]
If such an explicit specialization for the member of a class template names an
implicitly-declared special member function (Clause [#special]), the program is
ill-formed.

[para]
[:en]
A member of an explicitly specialized class is not implicitly instantiated from
the member declaration of the class template; instead, the member of the class
template specialization shall itself be explicitly defined if its definition is
required.

[:en]
In this case, the definition of the class template explicit specialization shall
be in scope at the point at which the member is defined.

[:en]
The definition of an explicitly specialized class is unrelated to the definition
of a generated specialization.

[:en]
That is, its members need not have the same names, types, etc. as the members of
a generated specialization.

[:en]
Members of an explicitly specialized class template are defined in the same
manner as members of normal classes, and not using the [`template<>] syntax.

[:en]
The same is true when defining a member of an explicitly specialized member
class.

[:en]
However, [`template<>] is used in defining a member of an explicitly specialized
member class template that is specialized as a class template.

[enter:example]
[codeblock]
template<class T> struct A {
  struct B { };
  template<class U> struct C { };
};

template<> struct A<int> {
  void f(int);
};

void h() {
  A<int> a;
  a.f(16);          // [:en] [`A<int>::f] must be defined somewhere
}

// [:en] [`template<>] not used for a member of an
// [:en@~] explicitly specialized class template
void A<int>::f(int) { /* ... */ }

template<> struct A<char>::B {
  void f();
};
// [:en] [`template<>] also not used when defining a member of
// [:en@~] an explicitly specialized member class
void A<char>::B::f() { /* ... */ }

template<> template<class U> struct A<char>::C {
  void f();
};
// [:en] [`template<>] is used when defining a member of an explicitly
// [:en@~] specialized member class template specialized as a class template
template<>
template<class U> void A<char>::C<U>::f() { /* ... */ }

template<> struct A<short>::B {
  void f();
};
template<> void A<short>::B::f() { /* ... */ }  // [:en] error: [`template<>] not permitted

template<> template<class U> struct A<short>::C {
  void f();
};
template<class U> void A<short>::C<U>::f() { /* ... */ }  // [:en] error: [`template<>] required
[codeblock:end]
[exit:example]

[para]
[:en]
If a template, a member template or a member of a class template is explicitly
specialized then that specialization shall be declared before the first use of
that specialization that would cause an implicit instantiation to take place,
in every translation unit in which such a use occurs; no diagnostic is required.

[:en]
If the program does not provide a definition for an explicit specialization and
either the specialization is used in a way that would cause an implicit
instantiation to take place or the member is a virtual member function,
the program is ill-formed, no diagnostic required.

[:en]
An implicit instantiation is never generated for an explicit specialization
that is declared but not defined.

[enter:example]
[codeblock]
class String { };
template<class T> class Array { /* ... */ };
template<class T> void sort(Array<T>& v) { /* ... */ }

void f(Array<String>& v) {
  sort(v);          // [:en] use primary template
                    // [:en@~] [`sort(Array<T>&)], [`T] is [`String]
}

template<> void sort<String>(Array<String>& v); // [:en] error: specialization
                                                // [:en@~] after use of primary template
template<> void sort<>(Array<char*>& v);        // [:en] OK: [`sort<char*>] not yet used
template<class T> struct A {
  enum E : T;
  enum class S : T;
};
template<> enum A<int>::E : int { eint };         // OK
template<> enum class A<int>::S : int { sint };   // OK
template<class T> enum A<T>::E : T { eT };
template<class T> enum class A<T>::S : T { sT };
template<> enum A<char>::E : char { echar };       // [:en] ill-formed, [`A<char>::E] was instantiated
                                                   // [:en@~] when [`A<char>] was instantiated
template<> enum class A<char>::S : char { schar }; // OK
[codeblock:end]
[exit:example]

[para]
[:en]
The placement of explicit specialization declarations for function templates,
class templates, variable templates, member functions of class templates, static
data members of class templates, member classes of class templates, member
enumerations of class templates, member class templates of class templates,
member function templates of class templates, static data member templates of
class templates, member functions of member templates of class templates, member
functions of member templates of non-template classes, static data member
templates of non-template classes, member function templates of member classes
of class templates, etc., and the placement of partial specialization
declarations of class templates, variable templates, member class templates of
non-template classes, static data member templates of non-template classes,
member class templates of class templates, etc., can affect whether a program is
well-formed according to the relative positioning of the explicit specialization
declarations and their points of instantiation in the translation unit as
specified above and below.

[:en]
[%immolation[!self]]
When writing a specialization, be careful about its location; or to make it
compile will be such a trial as to kindle its self-immolation.

[para]
[:en]
A template explicit specialization is in the scope of the namespace in which
the template was defined.

[enter:example]
[codeblock]
namespace N {
  template<class T> class X { /* ... */ };
  template<class T> class Y { /* ... */ };

  template<> class X<int> { /* ... */ };          // [:en] OK: specialization
                                                // [:en@~] in same namespace
  template<> class Y<double>;                   // [:en] forward declare intent to
                                                // [:en@~] specialize for [`double]
}

template<> class N::Y<double> { /* ... */ };      // [:en] OK: specialization
                                                // [:en@~] in enclosing namespace
template<> class N::Y<short> { /* ... */ };       // [:en] OK: specialization
                                                // [:en@~] in enclosing namespace
[codeblock:end]
[exit:example]

[para]
[:en]
A [~simple-template-id] that names a class template explicit specialization that
has been declared but not defined can be used exactly like the names of other
incompletely-defined classes ([#basic.types]).

[enter:example]
[codeblock]
template<class T> class X;      // [:en] [`X] is a class template
template<> class X<int>;

X<int>* p;                      // [:en] OK: pointer to declared class [`X<int>]
X<int> x;                       // [:en] error: object of incomplete class [`X<int>]
[codeblock:end]
[exit:example]

[para]
[:en]
A trailing [~template-argument] can be left unspecified in the [~template-id]
naming an explicit function template specialization provided it can be deduced
from the function argument type.

[enter:example]
[codeblock]
template<class T> class Array { /* ... */ };
template<class T> void sort(Array<T>& v);

// [:en] explicit specialization for [`sort(Array<int>&)]
// [:en@~] with deduced template-argument of type [`int]
template<> void sort(Array<int>&);
[codeblock:end]
[exit:example]

[para]
[:en]
A function with the same name as a template and a type that exactly matches that
of a template specialization is not an explicit specialization ([#temp.fct]).

[para]
[:en]
An explicit specialization of a function template is inline only if it is
declared with the [`inline] specifier or defined as deleted, and independently
of whether its function template is inline.

[enter:example]
[codeblock]
template<class T> void f(T) { /* ... */ }
template<class T> inline T g(T) { /* ... */ }

template<> inline void f<>(int) { /* ... */ }   // [:en] OK: inline
template<> int g<>(int) { /* ... */ }           // [:en] OK: not inline
[codeblock:end]
[exit:example]

[para]
[:en]
An explicit specialization of a static data member of a template or an explicit
specialization of a static data member template is a definition if the
declaration includes an initializer; otherwise, it is a declaration.

[enter:note]
[:en]
The definition of a static data member of a template that requires default
initialization must use a [~braced-init-list}:

[codeblock]
template<> X Q<int>::x;         // [:en] declaration
template<> X Q<int>::x ();      // [:en] error: declares a function
template<> X Q<int>::x { };     // [:en] definition
[codeblock:end]
[exit:note]

[para]
[:en]
A member or a member template of a class template may be explicitly specialized
for a given implicit instantiation of the class template, even if the member
or member template is defined in the class template definition.

[:en]
An explicit specialization of a member or member template is specified using the
syntax for explicit specialization.

[enter:example]
[codeblock]
template<class T> struct A {
  void f(T);
  template<class X1> void g1(T, X1);
  template<class X2> void g2(T, X2);
  void h(T) { }
};

// [:en] specialization
template<> void A<int>::f(int);

// [:en] out of class member template definition
template<class T> template<class X1> void A<T>::g1(T, X1) { }

// [:en] member template specialization
template<> template<class X1> void A<int>::g1(int, X1);

// [:en]member template specialization
template<> template<>
  void A<int>::g1(int, char);           // [:en] [`X1] deduced as [`char]
template<> template<>
  void A<int>::g2<char>(int, char);     // [:en] [`X2] specified as [`char]

// [:en] member specialization even if defined in class definition
template<> void A<int>::h(int) { }
[codeblock:end]
[exit:example]

[para]
[:en]
A member or a member template may be nested within many enclosing class
templates.

[:en]
In an explicit specialization for such a member, the member declaration shall be
preceded by a [`template<>] for each enclosing class template that is explicitly
specialized.

[enter:example]
[codeblock]
template<class T1> class A {
  template<class T2> class B {
    void mf();
  };
};
template<> template<> class A<int>::B<double>;
template<> template<> void A<char>::B<char>::mf();
[codeblock:end]
[exit:example]

[para]
[:en]
In an explicit specialization declaration for a member of a class template or
a member template that appears in namespace scope, the member template and some
of its enclosing class templates may remain unspecialized, except that the
declaration shall not explicitly specialize a class member template if its
enclosing class templates are not explicitly specialized as well.

[:en]
In such explicit specialization declaration, the keyword [`template] followed by
a [~template-parameter-list] shall be provided instead of the [`template<>]
preceding the explicit specialization declaration of the member.

[:en]
The types of the [~template-parameters] in the [~template-parameter-list] shall
be the same as those specified in the primary template definition.

[enter:example]
[codeblock]
template <class T1> class A {
  template<class T2> class B {
    template<class T3> void mf1(T3);
    void mf2();
  };
};
template <> template <class X>
  class A<int>::B {
      template <class T> void mf1(T);
  };
template <> template <> template<class T>
  void A<int>::B<double>::mf1(T t) { }
template <class Y> template <>
  void A<Y>::B<double>::mf2() { }       // [:en] ill-formed; [`B<double>] is specialized but
                                        // [:en@~] its enclosing class template [`A] is not
[codeblock:end]
[exit:example]

[para]
[:en]
A specialization of a member function template, member class template, or static
data member template of a non-specialized class template is itself a template.

[para]
[:en]
An explicit specialization declaration shall not be a friend declaration.

[para]
[:en]
Default function arguments shall not be specified in a declaration or
a definition for one of the following explicit specializations:

[list]
[item]
[:en] the explicit specialization of a function template;
[item]
[:en] the explicit specialization of a member function template;
[item]
[:en] the explicit specialization of a member function of a class template where
the class template specialization to which the member function specialization
belongs is implicitly instantiated.

[enter:note]
[:en]
Default function arguments may be specified in the declaration or definition of
a member function of a class template specialization that is explicitly
specialized.
[exit:note]
[list:end]
