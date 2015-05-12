[section#over.inc
    [:en] Increment and decrement
    [:zh_CN] 增量和减量
]

[:en]
[%increment operator[!overloaded][see overloading[!increment operator]]]
[%decrement operator[!overloaded][see overloading[!decrement operator]]]
[%prefix [`++] and [`--][!overloading]]
[%postfix [`++] and [`--][!overloading]]
[:zh_CN]
[%增量运算符[!重载～][see 重载[!～增量运算符]]]
[%减量运算符[!重载～][see 重载[!～减量运算符]]]
[%前置 [`++] 和 [`--][!重载～]]
[%后置 [`++] 和 [`--][!重载～]]

[para]
[:en]
The user-defined function called [`operator++] implements the prefix and postfix
[`++] operator.
[:zh_CN]
名为 [`operator++] 的用户定义函数实现了前置和后置 [`++] 运算符。

[:en]
If this function is a non-static member function with no parameters, or a
non-member function with one parameter, it defines the prefix increment operator
[`++] for objects of that type.
[:zh_CN]
若该函数是没有形参的非静态成员函数，或者带有一个形参的非成员函数，则它为该类型的
对象定义了前置增量运算符 [`++]。

[:en]
If the function is a non-static member function with one parameter (which shall
be of type [`int]) or a non-member function with two parameters (the second of
which shall be of type [`int]), it defines the postfix increment operator [`++]
for objects of that type.
[:zh_CN]
若该函数是带有一个形参（其类型应为 [`int]）的非静态成员函数，或者带有两个形参
（其第二个的类型应为 [`int]）的非成员函数，则它为该类型的对象定义了后置增量运算
符 [`++]。

[:en]
When the postfix increment is called as a result of using the [`++] operator,
the [`int] argument will have value zero.
[:zh_CN]
当后置增量通过使用 [`++] 运算符而调用时，其 [`int] 实参的值为零。

[footnote]
[:en]
Calling [`operator++] explicitly, as in expressions like [`a.operator++(2)], has
no special properties:
[:zh_CN]
显式调用 [`operator++]（如在 [`a.operator++(2)] 这样的表达式中）没有特殊的性质：

[:en]
The argument to [`operator++] is [`2].
[:zh_CN]
传给 [`operator++] 的实参为 [`2]。
[footnote:end]

[enter:example]
[codeblock]
struct X {
  X&   operator++();            // [:en] prefix [`++a]
                                // [|:zh_CN] 前置 [`++a]
  X    operator++(int);         // [:en] postfix [`a++]
                                // [|:zh_CN] 后置 [`a++]
};

struct Y { };
Y&   operator++(Y&);            // [:en] prefix [`++b]
                                // [|:zh_CN] 前置 [`++b]
Y    operator++(Y&, int);       // [:en] postfix [`b++]
                                // [|:zh_CN] 后置 [`b++]

void f(X a, Y b) {
  ++a;                          // [`a.operator++();]
  a++;                          // [`a.operator++(0);]
  ++b;                          // [`operator++(b);]
  b++;                          // [`operator++(b, 0);]

  a.operator++();               // [:en] explicit call: like [`++a;]
                                // [|:zh_CN] 显式调用：如同 [`++a;]
  a.operator++(0);              // [:en] explicit call: like [`a++;]
                                // [|:zh_CN] 显式调用：如同 [`a++;]
  operator++(b);                // [:en] explicit call: like [`++b;]
                                // [|:zh_CN] 显式调用：如同 [`++b;]
  operator++(b, 0);             // [:en] explicit call: like [`b++;]
                                // [|:zh_CN] 显式调用：如同 [`b++;]
}
[codeblock:end]
[exit:example]

[para]
[:en]
The prefix and postfix decrement operators [`--] are handled analogously.
[:zh_CN]
前置和后置减量运算符 [`--] 的处理与此类似。
