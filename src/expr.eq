﻿[section#expr.eq
    [:en] Equality operators
    [:zh_CN]
]

[:en]
[%expression[!equality operators]]
[%operator[!equality]]
[%operator[!inequality]]

[syntax]
[rule equality-expression [:zh_CN] ]
    [| relational-expression ]
    [| equality-expression [`==] relational-expression ]
    [| equality-expression [`!=] relational-expression ]
[rule:end]
[syntax:end]

[para]
[:en]
The [`==] (equal to) and the [`!=] (not equal to) operators group left-to-right.

[:en]
The operands shall have arithmetic, enumeration, pointer, or pointer to member
type, or type [`std::nullptr_t].

[:en]
The operators [`==] and [`!=] both yield [`true] or [`false], i.e., a result of
type [`bool].

[:en]
In each case below, the operands shall have the same type after the specified
conversions have been applied.

[para]
[:en]
[%comparison[!pointer]]
[%comparison[!pointer to function]]
If at least one of the operands is a pointer, pointer conversions ([#conv.ptr])
and qualification conversions ([#conv.qual]) are performed on both operands to
bring them to their composite pointer type (Clause [#expr]).

[:en]
Comparing pointers is defined as follows:

[:en]
Two pointers compare equal if they are both null, both point to the same
[%address] function, or both represent the same address ([#basic.compound]),
otherwise they compare unequal.

[para]
[:en]
If at least one of the operands is a pointer to member, pointer to member
conversions ([#conv.mem]) and qualification conversions ([#conv.qual]) are
performed on both operands to bring them to their composite pointer type (Clause
[#expr]).

[:en]
Comparing pointers to members is defined as follows:

[list]
[item]
[:en]
If two pointers to members are both the null member pointer value, they compare
equal.

[item]
[:en]
If only one of two pointers to members is the null member pointer value, they
compare unequal.

[item]
[:en]
If either is a pointer to a virtual member function, the result is unspecified.

[item]
[:en]
If one refers to a member of class [`C1] and the other refers to a member of a
different class [`C2], where neither is a base class of the other, the result is
unspecified.

[enter:example]
[codeblock]
struct A {};
struct B : A { int x; };
struct C : A { int x; };

int A::*bx = (int(A::*))&B::x;
int A::*cx = (int(A::*))&C::x;

bool b1 = (bx == cx);   // [:en] unspecified
[codeblock:end]
[exit:example]

[item]
[:en]
If both refer to (possibly different) members of the same union
([#class.union]), they compare equal.

[item]
[:en]
Otherwise, two pointers to members compare equal if they would refer to the same
member of the same most derived object ([#intro.object]) or the same subobject
if indirection with a hypothetical object of the associated class type were
performed, otherwise they compare unequal.

[enter:example]
[codeblock]
struct B {
  int f();
};
struct L : B { };
struct R : B { };
struct D : L, R { };

int (B::*pb)() = &B::f;
int (L::*pl)() = pb;
int (R::*pr)() = pb;
int (D::*pdl)() = pl;
int (D::*pdr)() = pr;
bool x = (pdl == pdr);          // [`false]
bool y = (pb == pl);            // [`true]
[codeblock:end]
[exit:example]
[list:end]

[para]
[:en]
Two operands of type [`std::nullptr_t] or one operand of type [`std::nullptr_t]
and the other a null pointer constant compare equal.

[para]
[:en]
If two operands compare equal, the result is [`true] for the [`==] operator and
[`false] for the [`!=] operator.

[:en]
If two operands compare unequal, the result is [`false] for the [`==] operator
and [`true] for the [`!=] operator.

[:en]
Otherwise, the result of each of the operators is unspecified.

[para]
[:en]
If both operands are of arithmetic or enumeration type, the usual arithmetic
conversions are performed on both operands; each of the operators shall yield
[`true] if the specified relationship is true and [`false] if it is false.
