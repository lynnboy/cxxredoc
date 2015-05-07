[section#dcl.fct.spec
    [:en] Function specifiers
    [:zh_CN] 函数说明符
]
[%  [:en] specifier[!function]
    [:zh_CN] 说明符[!函数～] ]
[%  [:en] function [seealso friend function]
        [seealso member function]
        [seealso inline function]
        [seealso virtual function]
    [:zh_CN] 函数 [seealso 友元函数]
        [seealso 成员函数]
        [seealso 内联函数]
        [seealso 虚函数]
]

[para]
[:en]
[~Function-specifiers] can be used only in function declarations.
[:zh_CN]
只能在函数声明式中使用[~函数说明符]。

[syntax]
[rule function-specifier [:zh_CN] 函数说明符 ]
    [| [`inline] ]
    [| [`virtual] ]
    [| [`explicit] ]
[rule:end]
[syntax:end]

[para]
[:en]
[%specifier[![`inline]]]
[%inline function]
A function declaration ([#dcl.fct], [#class.mfct], [#class.friend]) with an
[`inline] specifier declares an [+inline function].
[:zh_CN]
[%说明符[![`inline]]]
[%内联函数]
带有 [`inline] 说明符的函数声明式（[#dcl.fct]，[#class.mfct]，[#class.friend]）
声明了[+内联函数]。

[:en]
The inline specifier indicates to the implementation that inline substitution of
the function body at the point of call is to be preferred to the usual function
call mechanism.
[:zh_CN]
inline 说明符向实现指出，优先考虑在调用点处对函数体内联展开，而不是采用常规函数
调用机制。

[:en]
An implementation is not required to perform this inline substitution at the
point of call; however, even if this inline substitution is omitted, the other
rules for inline functions defined by [#dcl.fct.spec] shall still be respected.
[:zh_CN]
实现不必在调用点进行这种内联展开；然而，即使这种内联展开被忽略时，仍须遵守
[#dcl.fct.spec] 中所定义的对于内联函数的其他规则。

[para]
[:en]
A function defined within a class definition is an inline function.
[:zh_CN]
在类定义式之中所定义的函数是内联函数。

[:en]
The [`inline] specifier shall not appear on a block scope function declaration.
[:zh_CN]
[`inline] 说明符不能出现于块作用域函数声明式中。

[footnote]
[:en]
The [`inline] keyword has no effect on the linkage of a function.
[:zh_CN]
[`inline] 关键字不影响函数的连接。
[footnote:end]

[:en]
If the [`inline] specifier is used in a friend declaration, that declaration
shall be a definition or the function shall have previously been declared
inline.
[:zh_CN]
若在友元声明式中使用了 [`inline] 说明符，则该声明式应当是一个定义式，或者该函数
之前已被声明为内联函数。

[para]
[:en]
An inline function shall be defined in every translation unit in which it is
odr-used and shall have exactly the same definition in every case
([#basic.def.odr]).
[:zh_CN]
内联函数应当在 ODR-式使用了它的每个翻译单元中进行定义，且在任何情况中都应当具有
严格相同的定义式（[#basic.def.odr]）。

[enter:note]
[:en]
A call to the inline function may be encountered before its definition appears
in the translation unit.
[:zh_CN]
对内联函数的调用可能发生于其定义式在该翻译单元中出现之前。
[exit:note]

[:en]
If the definition of a function appears in a translation unit before its first
declaration as inline, the program is ill-formed.
[:zh_CN]
若函数的定义式在它被首次声明为内联之前出现于翻译单元之中，则程序非良构。

[:en]
If a function with external linkage is declared inline in one translation unit,
it shall be declared inline in all translation units in which it appears; no
diagnostic is required.
[:zh_CN]
若某个带有外部连接的函数在一个翻译单元中被声明为内联的，则它在所有包含它的翻译
单元中都应当被声明为内联的；无须诊断。

[:en]
An [`inline] function with external linkage shall have the same address in all
translation units.
[:zh_CN]
带有外部连接的 [`inline] 函数在所有翻译单元中应当具有相同地址。

[:en]
A [`static] local variable in an [`extern inline] function always refers to the
same object.
[:zh_CN]
[`extern inline] 函数中的 [`static] 局部变量应当总是代表相同的对象。

[:en]
A type defined within the body of an [`extern inline] function is the same type
in every translation unit.
[:zh_CN]
[`extern inline] 函数的函数体中所定义的类型，在每个翻译单元中都是同一个类型。

[para]
[:en]
[%specifier[![`virtual]]]
The [`virtual] specifier shall be used only in the initial declaration of a
non-static class member function; see [#class.virtual].
[:zh_CN]
[%说明符[![`virtual]]]
[`virtual] 说明符只能用在非静态的类成员函数的初始声明式之中；参见
[#class.virtual]。

[para]
[:en]
[%specifier[![`explicit]]]
The [`explicit] specifier shall be used only in the declaration of a constructor
or conversion function within its class definition; see [#class.conv.ctor] and
[#class.conv.fct].
[:zh_CN]
[%说明符[![`explicit]]]
[`explicit] 说明符只能用在处于类定义式之内的构造函数或转换函数的声明式之中；参见
[#class.conv.ctor] 和 [#class.conv.fct]。
