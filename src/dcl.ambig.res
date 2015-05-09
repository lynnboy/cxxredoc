[section#dcl.ambig.res
    [:en] Ambiguity resolution
    [:zh_CN] 歧义消解
]

[:en]
[%ambiguity[!declaration versus cast]]
[%declaration[!parentheses in]]
[:zh_CN]
[%歧义[!声明式与强制转换]]
[%声明式[!～中的括号]]

[para]
[:en]
The ambiguity arising from the similarity between a function-style cast and a
declaration mentioned in [#stmt.ambig] can also occur in the context of a
declaration.
[:zh_CN]
在 [#stmt.ambig] 中所提到的由函数风格的强制转换和声明式之间的相似性所引起的歧义
，也会在声明式的语境中出现。

[:en]
In that context, the choice is between a function declaration with a redundant
set of parentheses around a parameter name and an object declaration with a
function-style cast as the initializer.
[:zh_CN]
在这个语境中，其选择介于一个带有一组围绕形参名的多余括号的函数声明式，和一个以
函数风格的强制转换作为其初始化式的对象声明式之间。

[:en]
Just as for the ambiguities mentioned in [#stmt.ambig], the resolution is to
consider any construct that could possibly be a declaration a declaration.
[:zh_CN]
正如 [#stmt.ambig] 中所提到的歧义那样，其解决办法是把可能是声明式的任何构造都
当作声明式看待。

[enter:note]
[:en]
A declaration can be explicitly disambiguated by a nonfunction-style cast, by an
[`=] to indicate initialization or by removing the redundant parentheses around
the parameter name.
[:zh_CN]
要明确消解声明式的歧义，可以采用非函数风格的强制转换，用 [`=] 来指定初始化，或者
将包围形参名的多余括号移除。
[exit:note]

[enter:example]
[codeblock]
struct S {
  S(int);
};

void foo(double a) {
  S w(int(a));      // [:en] function declaration
                    // [|:zh_CN] 函数声明式
  S x(int());       // [:en] function declaration
                    // [|:zh_CN] 函数声明式
  S y((int)a);      // [:en] object declaration
                    // [|:zh_CN] 对象声明式
  S z = int(a);     // [:en] object declaration
                    // [|:zh_CN] 对象声明式
}
[codeblock:end]
[exit:example]

[para]
[:en]
The ambiguity arising from the similarity between a function-style cast and a
[~type-id] can occur in different contexts.
[:zh_CN]
由函数风格的强制转换和[~类型标识]之间的相似性所引起的歧义，可能在多种语境中发生
。

[:en]
The ambiguity appears as a choice between a function-style cast expression and a
declaration of a type.
[:zh_CN]
这个歧义表现为介于一个函数风格的强制转换表达式和某个类型的声明式之间的选择。

[:en]
The resolution is that any construct that could possibly be a [~type-id] in its
syntactic context shall be considered a [~type-id].
[:zh_CN]
其解决办法是，在其语法语境中能够被当作[~类型标识]的任何构造都被当作[~类型标识]。

[para]
[enter:example]

[codeblock]
#include <cstddef>
char* p;
void* operator new(std::size_t, int);
void foo()  {
  const int x = 63;
  new (int(*p)) int;            // [:en] new-placement
                                // [|:zh_CN] new-放置
  new (int(*[x]));              // [:en] parenthesized type-id
                                // [|:zh_CN] 带有括号的类型标识
}
[codeblock:end]

[para]
[:en]
For another example,
[:zh_CN]
又例如，

[codeblock]
template <class T>
struct S {
  T* p;
};
S<int()> x;                     // [:en] type-id
                                // [|:zh_CN] 类型标识
S<int(1)> y;                    // [:en] expression (ill-formed)
                                // [|:zh_CN] 表达式（非良构）
[codeblock:end]

[para]
[:en]
For another example,
[:zh_CN]
又例如，

[codeblock]
void foo() {
  sizeof(int(1));               // [:en] expression
                                // [|:zh_CN] 表达式
  sizeof(int());                // [:en] type-id (ill-formed)
                                // [|:zh_CN] 类型标识（非良构）
}
[codeblock:end]

[para]
[:en]
For another example,
[:zh_CN]
又例如，

[codeblock]
void foo() {
  (int(1));                     // [:en] expression
                                // [|:zh_CN] 表达式
  (int())1;                     // [:en] type-id (ill-formed)
                                // [|:zh_CN] 类型标识（非良构）
}
[codeblock:end]
[exit:example]

[para]
[:en]
Another ambiguity arises in a [~parameter-declaration-clause] of a function
declaration, or in a [~type-id] that is the operand of a [`sizeof] or [`typeid]
operator, when a [~type-name] is nested in parentheses.
[:zh_CN]
在函数声明式的[~形参声明子句]中，或者在作为 [`sizeof] 或 [`typeid] 运算符的
操作数的[~类型标识]中，当出现嵌套在括号中的[~类型名]时会产生另一种歧义。

[:en]
In this case, the choice is between the declaration of a parameter of type
pointer to function and the declaration of a parameter with redundant
parentheses around the [~declarator-id].
[:zh_CN]
在这些情况下，其选择介于一个类型为指向函数的指针的形参的声明式，和一个以多余的
括号包围其[~声明符标识]的形参声明式之间。

[:en]
The resolution is to consider the [~type-name] as a [~simple-type-specifier]
rather than a [~declarator-id].
[:zh_CN]
其解决办法是，把这个[~类型名]当作[~简单类型说明符]而不是[~声明符标识]。

[enter:example]
[codeblock]
class C { };
void f(int(C)) { }              // [`void f(int(*fp)(C c)) { }]
                                // [:en] not: [`void f(int C)];
                                // [|:zh_CN] 而不是：[`void f(int C)]

int g(C);

void foo() {
  f(1);                         // [:en] error: cannot convert [`1] to function pointer
                                // [|:zh_CN] 错误：不能把 [`1] 转换为函数指针
  f(g);                         // OK
}
[codeblock:end]

[:en]
For another example,
[:zh_CN]
又例如，

[codeblock]
class C { };
void h(int *(C[10]));           // [`void h(int *(*_fp)(C _parm[10`]));]
                                // [:en] not: [`void h(int *C[10`]);]
                                // [|:zh_CN] 而不是：[`void h(int *C[10`]);]
[codeblock:end]
[exit:example]
