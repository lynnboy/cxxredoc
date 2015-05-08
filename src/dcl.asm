[section#dcl.asm
    [:en] The [`asm] declarations
    [:zh_CN] [`asm] 声明式
]

[:en]
[%declaration[![`asm]]]
[%assembler]
[%[`asm][!implementation-defined]]
[:zh_CN]
[%声明式[![`asm]]]
[%汇编器]
[%[`asm][!由实现定义的]]

[para]
[:en]
An [`asm] declaration has the form
[:zh_CN]
[`asm] 声明式的形式为

[syntax]
[rule asm-definition [:zh_CN] asm-定义式 ]
    [| [`asm] [`(] string-literal [`)] [`;] ]
[rule:end]
[syntax:end]

[:en]
The [`asm] declaration is conditionally-supported; its meaning is
[%@impldef meaning of [`asm] declaration] implementation-defined.
[:zh_CN]
[`asm] 声明式是有条件支持的；其含义是[%@impldef [`asm] 声明式的含义]由实现定义的
。

[enter:note]
[:en]
Typically it is used to pass information through the implementation to an
assembler.
[:zh_CN]
典型情况下它被用来越过实现向汇编器传递信息。
[exit:note]
