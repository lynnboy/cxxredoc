[section#temp.class.spec
    [:en] Class template partial specializations
]

[para]
[:en]
[%specialization[!class template partial]]
[%template[!primary]]
A [+primary] class template declaration is one in which the class template name
is an identifier.

[:en]
A template declaration in which the class template name is a
[~simple-template-id] is a [+partial specialization] of the class template named
in the [~simple-template-id].

[:en]
A partial specialization of a class template provides an alternative definition
of the template that is used instead of the primary definition when the
arguments in a specialization match those given in the partial specialization
([#temp.class.spec.match]).

[:en]
The primary template shall be declared before any specializations of that
template.

[:en]
A partial specialization shall be declared before the first use of a class
template specialization that would make use of the partial specialization as the
result of an implicit or explicit instantiation in every translation unit in
which such a use occurs; no diagnostic is required.

[para]
[:en]
Each class template partial specialization is a distinct template and
definitions shall be provided for the members of a template partial
specialization ([#temp.class.spec.mfunc]).

[para]
[enter:example]
[codeblock]
template<class T1, class T2, int I> class A             { };    // #1
template<class T, int I>            class A<T, T*, I>   { };    // #2
template<class T1, class T2, int I> class A<T1*, T2, I> { };    // #3
template<class T>                   class A<int, T*, 5> { };    // #4
template<class T1, class T2, int I> class A<T1, T2*, I> { };    // #5
[codeblock:end]

[:en]
The first declaration declares the primary (unspecialized) class template.

[:en]
The second and subsequent declarations declare partial specializations of
the primary template.
[exit:example]

[para]
[:en]
The template parameters are specified in the angle bracket enclosed list that
immediately follows the keyword [`template].

[:en]
For partial specializations, the template argument list is explicitly written
immediately following the class template name.

[:en]
For primary templates, this list is implicitly described by the template
parameter list.

[:en]
Specifically, the order of the template arguments is the sequence in which they
appear in the template parameter list.

[enter:example]
[:en]
the template argument list for the primary template in the example above is
[`<T1, T2, I>].
[exit:example]

[enter:note]
[:en]
The template argument list shall not be specified in the primary template
declaration.

[:en]
For example,

[codeblock]
template<class T1, class T2, int I> class A<T1, T2, I>  { };    // [:en] error
[codeblock:end]
[exit:note]

[para]
[:en]
A class template partial specialization may be declared or redeclared in any
namespace scope in which the corresponding primary template may be defined
([#namespace.memdef] and [#temp.mem]).

[enter:example]
[codeblock]
template<class T> struct A {
  struct C {
    template<class T2> struct B { };
  };
};

// [:en] partial specialization of [`A<T>::C::B<T2>]
template<class T> template<class T2>
  struct A<T>::C::B<T2*> { };

A<short>::C::B<int*> absip;     // [:en] uses partial specialization
[codeblock:end]
[exit:example]

[para]
[:en]
Partial specialization declarations themselves are not found by name lookup.

[:en]
Rather, when the primary template name is used, any previously-declared partial
specializations of the primary template are also considered.

[:en]
One consequence is that a [~using-declaration] which refers to a class template
does not restrict the set of partial specializations which may be found through
the [~using-declaration].

[enter:example]
[codeblock]
namespace N {
  template<class T1, class T2> class A { };         // [:en] primary template
}

using N::A;                             // [:en] refers to the primary template

namespace N {
  template<class T> class A<T, T*> { }; // [:en] partial specialization
}

A<int,int*> a;                  // [:en] uses the partial specialization, which is found through
                                // [:en@~] the using declaration which refers to the primary template
[codeblock:end]
[exit:example]

[para]
[:en]
A non-type argument is non-specialized if it is the name of a non-type
parameter.

[:en]
All other non-type arguments are specialized.

[para]
[:en]
Within the argument list of a class template partial specialization, the
following restrictions apply:

[list]
[item]
[:en]
A partially specialized non-type argument expression shall not involve
a template parameter of the partial specialization except when the argument
expression is a simple [~identifier].

[enter:example]
[codeblock]
template <int I, int J> struct A {};
template <int I> struct A<I+5, I*2> {}; // [:en] error

template <int I, int J> struct B {};
template <int I> struct B<I, I> {};     // OK
[codeblock:end]
[exit:example]

[item]
[:en]
The type of a template parameter corresponding to a specialized non-type
argument shall not be dependent on a parameter of the specialization.

[enter:example]
[codeblock]
template <class T, T t> struct C {};
template <class T> struct C<T, 1>;                  // [:en] error

template< int X, int (*array_ptr)[X] > class A {};
int array[5];
template< int X > class A<X,&array> { };            // [:en] error
[codeblock:end]
[exit:example]

[item]
[:en]
The argument list of the specialization shall not be identical to the implicit
argument list of the primary template.

[item]
[:en]
The specialization shall be more specialized than the primary template
([#temp.class.order]).

[item]
[:en]
The template parameter list of a specialization shall not contain default
template argument values.

[footnote]
[:en]
There is no way in which they could be used.
[footnote:end]

[item]
[:en]
An argument shall not contain an unexpanded parameter pack. If an argument is a
pack expansion ([#temp.variadic]), it shall be the last argument in the template
argument list.
[list:end]

[include temp.class.spec.match]

[include temp.class.order]

[include temp.class.spec.mfunc]
