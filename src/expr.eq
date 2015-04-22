[section#expr.eq
    [:en] Equality operators
    [:zh_CN] 相等性运算符
]

[:en]
[%expression[!equality operators]]
[%operator[!equality]] [%operator[!inequality]]
[:zh_CN]
[%表达式[!相等性比较～]]
[%运算符[!相等～]] [%运算符[!不相等～]]

[syntax]
[rule equality-expression [:zh_CN] 相等性表达式 ]
    [| relational-expression ]
    [| equality-expression [`==] relational-expression ]
    [| equality-expression [`!=] relational-expression ]
[rule:end]
[syntax:end]

[para]
[:en]
The [`==] (equal to) and the [`!=] (not equal to) operators group left-to-right.
[:zh_CN]
[`==]（等于）和 [`!=]（不等于）运算符从左向右分组。

[:en]
The operands shall have arithmetic, enumeration, pointer, or pointer to member
type, or type [`std::nullptr_t].
[:zh_CN]
其操作数应当为算术、枚举、指针或成员指针类型，或者类型 [`std::nullptr_t]。

[:en]
The operators [`==] and [`!=] both yield [`true] or [`false], i.e., a result of
type [`bool].
[:zh_CN]
运算符 [`==] 和 [`!=] 都产生 [`true] 或 [`false]，亦即 [`bool] 类型的结果。

[:en]
In each case below, the operands shall have the same type after the specified
conversions have been applied.
[:zh_CN]
以下每种情况中，操作数应当在实施所指定的转换之后具有相同类型。

[para]
[:en]
[%comparison[!pointer]] [%comparison[!pointer to function]]
If at least one of the operands is a pointer, pointer conversions ([#conv.ptr])
and qualification conversions ([#conv.qual]) are performed on both operands to
bring them to their composite pointer type (Clause [#expr]).
[:zh_CN]
[%比较[!指针～]] [%比较[!函数指针～]]
如果至少一个操作数是指针，则对两个操作数实施指针转换（[#conv.ptr]）和限定性转换
（[#conv.qual]）以将它们转换为它们的合成指针类型（第 [#expr] 条）。

[:en]
Comparing pointers is defined as follows:
[:zh_CN]
比较两个指针按如下定义：

[:en]
Two pointers compare equal if they are both null, both point to the same
[%address] function, or both represent the same address ([#basic.compound]),
otherwise they compare unequal.
[:zh_CN]
若两个指针均为空，均指向同一个[%地址]函数，或均表示同一个地址
（[#basic.compound]）时，它们比较为相等，否则比较为不相等。

[para]
[:en]
If at least one of the operands is a pointer to member, pointer to member
conversions ([#conv.mem]) and qualification conversions ([#conv.qual]) are
performed on both operands to bring them to their composite pointer type (Clause
[#expr]).
[:zh_CN]
如果至少一个操作数是成员指针，则对两个操作数实施成员指针转换（[#conv.mem]）和
限定性转换（[#conv.qual]）以将它们转换为它们的合成指针类型（第 [#expr] 条）。

[:en]
Comparing pointers to members is defined as follows:
[:zh_CN]
比较两个成员指针按如下定义：

[list]
[item]
[:en]
If two pointers to members are both the null member pointer value, they compare
equal.
[:zh_CN]
若两个成员指针均为空成员指针值，它们比较为相等。

[item]
[:en]
If only one of two pointers to members is the null member pointer value, they
compare unequal.
[:zh_CN]
若两个成员指针中仅有一个是空成员指针值，它们比较为不相等。

[item]
[:en]
If either is a pointer to a virtual member function, the result is unspecified.
[:zh_CN]
若二者之一是指向虚成员函数的指针，则其结果是未指明的。

[item]
[:en]
If one refers to a member of class [`C1] and the other refers to a member of a
different class [`C2], where neither is a base class of the other, the result is
unspecified.
[:zh_CN]
若其中之一代表类 [`C1] 的成员而另一个代表不同的类 [`C2] 的成员，其中二者互不为
基类，则其结果是未指明的。

[enter:example]
[codeblock]
struct A {};
struct B : A { int x; };
struct C : A { int x; };

int A::*bx = (int(A::*))&B::x;
int A::*cx = (int(A::*))&C::x;

bool b1 = (bx == cx);   // [:en] unspecified
                        // [|:zh_CN] 未指明的
[codeblock:end]
[exit:example]

[item]
[:en]
If both refer to (possibly different) members of the same union
([#class.union]), they compare equal.
[:zh_CN]
若二者均指代相同联合（[#class.union]）的（可能不同的）成员，则它们比较为相等。

[item]
[:en]
Otherwise, two pointers to members compare equal if they would refer to the same
member of the same most derived object ([#intro.object]) or the same subobject
if indirection with a hypothetical object of the associated class type were
performed, otherwise they compare unequal.
[:zh_CN]
否则，当用它们对某个假想的其所关联的类型的对象进行间接时，它们指向同一个全派生
对象（[#intro.object]）或同一个子对象的相同成员，它们比较为相等，否则它们比较为
不相等。

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
[:zh_CN]
两个 [`std::nullptr_t] 类型的操作数，或一个 [`std::nullptr_t] 类型的操作数而另一
个为空指针常量，比较为相等

[para]
[:en]
If two operands compare equal, the result is [`true] for the [`==] operator and
[`false] for the [`!=] operator.
[:zh_CN]
如果两个操作数比较为相等，则 [`==] 运算符的结果为 [`true] 而 [`!=] 运算符的结果
为 [`false]。

[:en]
If two operands compare unequal, the result is [`false] for the [`==] operator
and [`true] for the [`!=] operator.
[:zh_CN]
如果两个操作数比较为不相等，则 [`==] 运算符的结果为 [`false] 而 [`!=] 运算符的
结果为 [`true]。

[:en]
Otherwise, the result of each of the operators is unspecified.
[:zh_CN]
否则，两个运算符的结果是未指明的。

[para]
[:en]
If both operands are of arithmetic or enumeration type, the usual arithmetic
conversions are performed on both operands; each of the operators shall yield
[`true] if the specified relationship is true and [`false] if it is false.
[:zh_CN]
如果两个操作数都是算术或枚举类型，则对两个操作数都进行一般算术转换；当每个运算符
所指定的关系为真时应当产生 [`true]，如果为假则产生 [`false]。
