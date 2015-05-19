[section#library.c
    [:en] The C standard library
    [:zh_CN] C 标准程序库
]

[para]
[:en]
The [=Cpp] standard library also makes available the facilities of the C
standard library, [% library[!C standard]] suitably adjusted to ensure static
type safety.
[:zh_CN]
[=Cpp] 标准程序库中还可使用 [%程序库 [!C 标准～]] C 标准程序库中的功能，它们已经
经过调整以保证静态类型安全性。

[para]
[:en]
The descriptions of many library functions rely on the C standard library for
the signatures and semantics of those functions.
[:zh_CN]
许多库函数的描述依赖于 C 标准程序库中这些函数的签名和语义。

[:en]
In all such cases, any use of the [`restrict] qualifier shall be omitted.
[:zh_CN]
在所有这些情况中，任何对 [`restrict] 限定符的使用均被忽略。
