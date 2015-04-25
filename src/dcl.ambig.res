[section#dcl.ambig.res
    [:en] Ambiguity resolution
]

[:en]
[%ambiguity[!declaration versus cast]]
[%declaration[!parentheses in]]

[para]
[:en]
The ambiguity arising from the similarity between a function-style cast and a
declaration mentioned in [#stmt.ambig] can also occur in the context of a
declaration.

[:en]
In that context, the choice is between a function declaration with a redundant
set of parentheses around a parameter name and an object declaration with a
function-style cast as the initializer.

[:en]
Just as for the ambiguities mentioned in [#stmt.ambig], the resolution is to
consider any construct that could possibly be a declaration a declaration.

[enter:note]
[:en]
A declaration can be explicitly disambiguated by a nonfunction-style cast, by an
[`=] to indicate initialization or by removing the redundant parentheses around
the parameter name.
[exit:note]

[enter:example]
[codeblock]
struct S {
  S(int);
};

void foo(double a) {
  S w(int(a));      // [:en] function declaration
  S x(int());       // [:en] function declaration
  S y((int)a);      // [:en] object declaration
  S z = int(a);     // [:en] object declaration
}
[codeblock:end]
[exit:example]

[para]
[:en]
The ambiguity arising from the similarity between a function-style cast and a
[~type-id] can occur in different contexts.

[:en]
The ambiguity appears as a choice between a function-style cast expression and a
declaration of a type.

[:en]
The resolution is that any construct that could possibly be a [~type-id] in its
syntactic context shall be considered a [~type-id].

[para]
[enter:example]

[codeblock]
#include <cstddef>
char* p;
void* operator new(std::size_t, int);
void foo()  {
  const int x = 63;
  new (int(*p)) int;            // [:en] new-placement
  new (int(*[x]));              // [:en] parenthesized type-id
}
[codeblock:end]

[para]
[:en]
For another example,

[codeblock]
template <class T>
struct S {
  T* p;
};
S<int()> x;                     // [:en] type-id
S<int(1)> y;                    // [:en] expression (ill-formed)
[codeblock:end]

[para]
[:en]
For another example,

[codeblock]
void foo() {
  sizeof(int(1));               // [:en] expression
  sizeof(int());                // [:en] type-id (ill-formed)
}
[codeblock:end]

[para]
[:en]
For another example,

[codeblock]
void foo() {
  (int(1));                     // [:en] expression
  (int())1;                     // [:en] type-id (ill-formed)
}
[codeblock:end]
[exit:example]

[para]
[:en]
Another ambiguity arises in a [~parameter-declaration-clause] of a function
declaration, or in a [~type-id] that is the operand of a [`sizeof] or [`typeid]
operator, when a [~type-name] is nested in parentheses.

[:en]
In this case, the choice is between the declaration of a parameter of type
pointer to function and the declaration of a parameter with redundant
parentheses around the [~declarator-id].

[:en]
The resolution is to consider the [~type-name] as a [~simple-type-specifier]
rather than a [~declarator-id].

[enter:example]
[codeblock]
class C { };
void f(int(C)) { }              // [:en] [`void f(int(*fp)(C c)) { }]
                                // [:en@~] not: [`void f(int C)];

int g(C);

void foo() {
  f(1);                         // [:en] error: cannot convert [`1] to function pointer
  f(g);                         // OK
}
[codeblock:end]

[:en]
For another example,

[codeblock]
class C { };
void h(int *(C[10]));           // [`void h(int *(*_fp)(C _parm[10`]));]
                                // [:en] not: [`void h(int *C[10`]);]
[codeblock:end]
[exit:example]
