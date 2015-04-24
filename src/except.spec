[section#except.spec
    [:en] Exception specifications
]

[%:begin#exception.specification
    [:en] exception specification
]

[para]
[:en]
[%exception specification[!non-throwing]]
The [def exception specification] of a function is a (possibly empty) set of
types, indicating that the function might exit via an exception that matches a
handler of one of the types in the set; the (conceptual) set of all types is
used to denote that the function might exit via an exception of arbitrary type.

[:en]
If the set is empty, the function is said to have a [def non-throwing exception
specification].

[:en]
The exception specification is either defined explicitly by using an
[~exception-specification] as a suffix of a function declaration[=']s declarator
([#dcl.fct]) or implicitly.

[syntax]
[rule exception-specification [:zh_CN] ]
    [| dynamic-exception-specification ]
    [| noexcept-specification ]
[rule:end]

[rule dynamic-exception-specification [:zh_CN] ]
    [| [`throw] [`(] [~:opt type-id-list] [`)] ]
[rule:end]

[rule type-id-list [:zh_CN] ]
    [| type-id [`:opt ...] ]
    [| type-id-list [`,] type-id [`:opt ...] ]
[rule:end]

[rule noexcept-specification [:zh_CN] ]
    [| [`noexcept] [`(] constant-expression [`)] ]
    [| [`noexcept] ]
[rule:end]
[syntax:end]

[:en]
[%exception specification[!noexcept[!constant expression and]]]
In a [~noexcept-specification], the [~constant-expression], if supplied, shall
be a constant expression ([#expr.const]) that is contextually converted to
[`bool] (Clause [#conv]).

[:en]
A [`(] token that follows [`noexcept] is part of the [~noexcept-specification]
and does not commence an initializer ([#dcl.init]).

[para]
An [~exception-specification] shall appear only on a function declarator for a
function type, pointer to function type, reference to function type, or pointer
to member function type that is the top-level type of a declaration or
definition, or on such a type appearing as a parameter or return type in a
function declarator.

[:en]
An [~exception-specification] shall not appear in a typedef declaration or
[~alias-declaration].

[enter:example]
[codeblock]
void f() throw(int);                    // OK
void (*fp)() throw (int);               // OK
void g(void pfa() throw(int));          // OK
typedef int (*pf)() throw(int);         // [:en] ill-formed
[codeblock:end]
[exit:example]

[:en]
[%exception specification[!incomplete type and]]
A type denoted in a [~dynamic-exception-specification] shall not denote an
incomplete type or an rvalue reference type.

[:en]
A type denoted in a [~dynamic-exception-specification] shall not denote a
pointer or reference to an incomplete type, other than ["pointer to [$cv]
[`void]].

[:en]
A type [$cv] [`T], ["array of [`T]], or ["function returning [`T]] denoted in a
[~dynamic-exception-specification] is adjusted to type [`T], ["pointer to [`T]],
or ["pointer to function returning [`T]], respectively.

[:en]
A [~dynamic-exception-specification] denotes an exception specification that is
the set of adjusted types specified thereby.

[para]
[:en]
The [~exception-specification] [`noexcept] or
[`noexcept(][~constant-expression][`)], where the [~constant-expression] yields
[`true], denotes an exception specification that is the empty set.

[:en]
The [~exception-specification] [`noexcept(][~constant-expression][`)], where the
[~constant-expression] yields [`false], or the absence of an
[~exception-specification] in a function declarator other than that for a
destructor ([#class.dtor]) or a deallocation function
([#basic.stc.dynamic.deallocation]) denotes an exception specification that is
the set of all types.

[para]
[:en]
[%exception specification[!compatible]]
Two [~exception-specification]s are [def compatible [%compatible[see exception
specification [!compatible]]]] if the sets of types they denote are the same.

[para]
[:en]
If any declaration of a function has an [~exception-specification] that is not a
[~noexcept-specification] allowing all exceptions, all declarations, including
the definition and any explicit specialization, of that function shall have a
compatible [~exception-specification].

[:en]
If any declaration of a pointer to function, reference to function, or pointer
to member function has an [~exception-specification], all occurrences of that
declaration shall have a compatible [~exception-specification].

[:en]
If a declaration of a function has an implicit exception specification, other
declarations of the function shall not specify an [~exception-specification].

[:en]
In an explicit instantiation an [~exception-specification] may be specified, but
is not required.

[:en]
If an [~exception-specification] is specified in an explicit instantiation
directive, it shall be compatible with the [~exception-specification]s of other
declarations of that function.

[:en]
A diagnostic is required only if the [~exception-specification]s are not
compatible within a single translation unit.

[para]
[:en]
[%exception specification[!virtual function and]]
If a virtual function has an exception specification, all declarations,
including the definition, of any function that overrides that virtual function
in any derived class shall only allow exceptions that are allowed by the
exception specification of the base class virtual function, unless the
overriding function is defined as deleted.

[enter:example]
[codeblock]
struct B {
  virtual void f() throw (int, double);
  virtual void g();
};

struct D: B {
  void f();                     // [:en] ill-formed
  void g() throw (int);         // OK
};
[codeblock:end]

[:en]
The declaration of [`D::f] is ill-formed because it allows all exceptions,
whereas [`B::f] allows only [`int] and [`double].
[exit:example]

[:en]
A similar restriction applies to assignment to and initialization of pointers to
functions, pointers to member functions, and references to functions: the target
entity shall allow at least the exceptions allowed by the source value in the
assignment or initialization.

[enter:example]
[codeblock]
class A { /* ... */ };
void (*pf1)();      // [:en] no exception specification
void (*pf2)() throw(A);

void f() {
  pf1 = pf2;        // [:en] OK: [`pf1] is less restrictive
  pf2 = pf1;        // [:en] error: [`pf2] is more restrictive
}
[codeblock:end]
[exit:example]

[para]
[:en]
In such an assignment or initialization, [~exception-specification]s on return
types and parameter types shall be compatible.

[:en]
In other assignments or initializations, [~exception-specification]s shall be
compatible.

[para]
[:en]
An [~exception-specification] can include the same type more than once and can
include classes that are related by inheritance, even though doing so is
redundant.

[enter:note]
[:en]
An [~exception-specification] can also include the class [`std::bad_exception]
([#bad.exception]).
[exit:note]

[para]
[:en]
[%allowing an exception[see exception specification[!allowing an exception]]]
A function is said to [def allow an exception [%exception specification
[!allowing an exception]]] of type [`E] if its exception specification contains
a type [`T] for which a handler of type [`T] would be a match ([#except.handle])
for an exception of type [`E].

[:en]
[%allowing all exceptions[see exception specification[!allowing all exceptions]]]
A function is said to [def allow all exceptions [%exception specification
[!allowing all exceptions]]] if its exception specification is the set of all
types.

[para]
[:en]
[%exception handling[![`unexpected()] called]]
[%[`unexpected()][!called]]
Whenever an exception of type [`E] is thrown and the search for a handler
([#except.handle]) encounters the outermost block of a function with an
exception specification that does not allow [`E], then,

[list]
[item]
[:en@~] if the function definition has a [~dynamic-exception-specification], the
function [`std::unexpected()] is called ([#except.unexpected]),

[item]
[%exception handling[![`terminate()] called]]
[%[`terminate()][!called]]
[:en@~] otherwise, the function [`std::terminate()] is called
([#except.terminate]).
[list:end]

[enter:example]
[codeblock]
class X { };
class Y { };
class Z: public X { };
class W { };

void f() throw (X, Y) {
  int n = 0;
  if (n) throw X();             // OK
  if (n) throw Z();             // [:en] also OK
  throw W();                    // [:en] will call [`std::unexpected()]
}
[codeblock:end]
[exit:example]

[para:~]
[enter:note]
[:en]
A function can have multiple declarations with different non-throwing
[~exception-specification]s; for this purpose, the one on the function
definition is used.
[exit:note]

[para]
[:en]
An implementation shall not reject an expression merely because when executed it
throws or might throw an exception that the containing function does not allow.

[enter:example]
[codeblock]
extern void f() throw(X, Y);

void g() throw(X) {
  f();                          // OK
}

[codeblock:end]

[:en@~]
the call to [`f] is well-formed even though when called, [`f] might throw
exception [`Y] that [`g] does not allow.
[exit:example]

[para]
[enter:note]
[:en]
An exception specification is not considered part of a function[=']s type; see
[#dcl.fct].
[exit:note]

[para]
[:en]
A [def potential exception] of a given context is either a type that might be
thrown as an exception or a pseudo-type, denoted by ["any], that represents the
situation where an exception of an arbitrary type might be thrown.

[:en]
A subexpression [`e1] of an expression [`e] is an [def immediate subexpression]
if there is no subexpression [`e2] of [`e] such that [`e1] is a subexpression of
[`e2].

[para]
[:en]
The [def set of potential exceptions of a function, function pointer, or member
function pointer] [`f] is defined as follows:

[list]
[item]
[:en]
If the exception specification of [`f] is the set of all types, the set consists
of the pseudo-type ["any].

[item]
[:en]
Otherwise, the set consists of every type in the exception specification of
[`f].
[list:end]

[para]
[:en]
The [def set of potential exceptions of an expression] [`e] is empty
if [`e] is a core constant expression ([#expr.const]).

[:en]
Otherwise, it is the union of the sets of potential exceptions of the immediate
subexpressions of [`e], including default argument expressions used in a
function call, combined with a set [$S] defined by the form of [`e], as follows:

[list]
[item]
[:en]
If [`e] is a function call ([#expr.call]):

[list]
[item]
[:en]
If its [~postfix-expression] is a (possibly parenthesized) [~id-expression]
([#expr.prim.general]), class member access ([#expr.ref]), or pointer-to-member
operation ([#expr.mptr.oper]) whose [~cast-expression] is an [~id-expression],
[$S] is the set of potential exceptions of the entity selected by the contained
[~id-expression] (after overload resolution, if applicable).

[item]
[:en]
Otherwise, [$S] contains the pseudo-type ["any].
[list:end]

[item]
[:en]
If [`e] implicitly invokes a function (such as an overloaded operator, an
allocation function in a [~new-expression], or a destructor if [`e] is a
full-expression ([#intro.execution])), [$S] is the set of potential exceptions
of the function.

[item]
[:en]
if [`e] is a [~throw-expression] ([#expr.throw]), [$S] consists of the type of
the exception object that would be initialized by the operand, if present, or
the pseudo-type ["any] otherwise.

[item]
[:en]
if [`e] is a [`dynamic_cast] expression that casts to a reference type and
requires a run-time check ([#expr.dynamic.cast]), [$S] consists of the type
[`std::bad_cast].

[item]
[:en]
if [`e] is a [`typeid] expression applied to a glvalue expression whose type is
a polymorphic class type ([#expr.typeid]), [$S] consists of the type
[`std::bad_typeid].

[item]
[:en]
if [`e] is a [~new-expression] with a non-constant [~expression] in the
[~noptr-new-declarator] ([#expr.new]), [$S] consists of the type
[`std::bad_array_new_length].
[list:end]

[enter:example]
[:en]
Given the following declarations

[codeblock]
  void f() throw(int); 
  void g();  
  struct A { A(); };
  struct B { B() noexcept; };
  struct D() { D() throw (double); };
[codeblock:end]

[:en@~]
the set of potential exceptions for some sample expressions is:

[list]
[item]
[:en@~] for [`f()], the set consists of [`int];
[item]
[:en@~] for [`g()], the set consists of ["any];
[item]
[:en@~] for [`new A], the set consists of ["any];
[item]
[:en@~] for [`B()], the set is empty;
[item]
[:en@~] for [`new D], the set consists of ["any] and [`double].
[list:end]
[exit:example]

[para]
[:en]
Given a member function [`f] of some class [`X], where [`f] is an inheriting
constructor ([#class.inhctor]) or an implicitly-declared special member
function, the [def set of potential exceptions of the implicitly-declared member
function] [`f] consists of all the members from the following sets:

[list]
[item]
[:en]
if [`f] is a constructor,

[list]
[item]
[:en]
the sets of potential exceptions of the constructor invocations

[list]
[item]
[:en@~] for [`X][=']s non-variant non-static data members,
[item]
[:en@~] for [`X][=']s direct base classes, and
[item]
[:en@~] if [`X] is non-abstract ([#class.abstract]), for [`X][=']s virtual base
classes,
[list:end]

[:en@~]
(including default argument expressions used in such invocations) as selected
by overload resolution for the implicit definition of [`f] ([#class.ctor]).

[enter:note]
[:en]
Even though destructors for fully-constructed subobjects are invoked when an
exception is thrown during the execution of a constructor ([#except.ctor}),
their exception specifications do not contribute to the exception specification
of the constructor, because an exception thrown from such a destructor could
never escape the constructor ([#except.throw], [#except.terminate]).
[exit:note]

[item]
[:en]
the sets of potential exceptions of the initialization of non-static data
members from [~brace-or-equal-initializer]s that are not ignored
([#class.base.init]);
[list:end]

[item]
[:en]
if [`f] is an assignment operator, the sets of potential exceptions of the
assignment operator invocations for [`X][=']s non-variant non-static data
members and for [`X][=']s direct base classes (including default argument
expressions used in such invocations), as selected by overload resolution for
the implicit definition of [`f] ([#class.copy]);

[item]
[:en]
if [`f] is a destructor, the sets of potential exceptions of the destructor
invocations for [`X][=']s non-variant non-static data members and for [`X][=']s
virtual and direct base classes.
[list:end]

[para]
[:en]
An inheriting constructor ([#class.inhctor]) and an implicitly-declared special
member function (Clause [#special]) are considered to have an implicit exception
specification, as follows, where [$S] is the set of potential exceptions of the
implicitly-declared member function:

[list]
[item]
[:en@~] if [$S] contains the pseudo-type ["any], the implicit exception
specification is the set of all types;
[item]
[:en@~] otherwise, the implicit exception specification contains all the types
in [$S].
[list:end]

[enter:note]
[:en]
An instantiation of an inheriting constructor template has an implied exception
specification as if it were a non-template inheriting constructor.
[exit:note]

[enter:example]
[codeblock]
struct A {
  A(int = (A(5), 0)) noexcept;
  A(const A&) throw();
  A(A&&) throw();
  ~A() throw(X);
};
struct B {
  B() throw();
  B(const B&) = default; // [:en] exception specification contains no types
  B(B&&, int = (throw Y(), 0)) noexcept;
  ~B() throw(Y);
};
int n = 7;
struct D : public A, public B {
    int * p = new (std::nothrow) int[n];
    // [:en] exception specification of [`D::D()] contains [`X] and [`std::bad_array_new_length]
    // [:en] exception specification of [`D::D(const D&)] contains no types
    // [:en] exception specification of [`D::D(D&&)] contains [`Y]
    // [:en] exception specification of [`D::~D()] contains [`X] and [`Y]
};
[codeblock:end]

[:en]
Furthermore, if [`A::~A()] or [`B::~B()] were virtual, [`D::~D()] would not be
as restrictive as that of [`A::~A], and the program would be ill-formed since a
function that overrides a virtual function from a base class shall have an
[~exception-specification]  at least as restrictive as that in the base class.
[exit:example]

[para]
[:en]
A deallocation function ([#basic.stc.dynamic.deallocation]) with no explicit
[~exception-specification] has an exception specification that is the empty set.

[para]
[:en]
An [~exception-specification] is considered to be [+needed] when:

[list]
[item]
[:en] in an expression, the function is the unique lookup result or the selected
member of a set of overloaded functions ([#basic.lookup], [#over.match],
[#over.over]);

[item]
[:en] the function is odr-used ([#basic.def.odr]) or, if it appears in an
unevaluated operand, would be odr-used if the expression were
potentially-evaluated;

[item]
[:en] the [~exception-specification] is compared to that of another declaration
(e.g., an explicit specialization or an overriding virtual function);

[item]
[:en] the function is defined; or

[item]
[:en] the [~exception-specification] is needed for a defaulted special member
function that calls the function.

[enter:note]
[:en]
A defaulted declaration does not require the [~exception-specification] of a
base member function to be evaluated until the implicit
[~exception-specification] of the derived function is needed, but an explicit
[~exception-specification] needs the implicit [~exception-specification] to
compare against.
[exit:note]
[list:end]

[:en]
The [~exception-specification} of a defaulted special member function is
evaluated as described above only when needed; similarly, the
[~exception-specification} of a specialization of a function template or member
function of a class template is instantiated only when needed.

[para]
[:en]
In a [~dynamic-exception-specification], a [~type-id] followed by an ellipsis is
a pack expansion ([#temp.variadic]).

[para]
[enter:note]
[:en]
The use of [~dynamic-exception-specification]s is deprecated (see Annex
[#depr]).
[exit:note]

[%:end#exception.specification]
