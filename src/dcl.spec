[section#dcl.spec
    [:en] Specifiers
    [:zh_CN] 说明符
]

[%:begin#specifier
    [:en] specifier
    [:zh_CN] 说明符
]

[para]
[:en]
[%specifier[!declaration]]
The specifiers that can be used in a declaration are
[:zh_CN]
[%说明符[!声明式]]
可在声明式中使用的说明符是

[syntax]
[rule decl-specifier [:zh_CN] 声明说明符 ]
    [| storage-class-specifier ]
    [| type-specifier ]
    [| function-specifier ]
    [| [`friend] ]
    [| [`typedef] ]
    [| [`constexpr] ]
[rule:end]

[rule decl-specifier-seq [:zh_CN] 声明说明符序列 ]
    [| decl-specifier [~:opt attribute-specifier-seq] ]
    [| decl-specifier decl-specifier-seq ]
[rule:end]
[syntax:end]

[:en]
The optional [~attribute-specifier-seq] in a [~decl-specifier-seq] appertains to
the type determined by the preceding [~decl-specifier]s ([#dcl.meaning]).
[:zh_CN]
[~声明说明符序列]中的可选的[~特性说明符序列]，属于由其前面的[~声明说明符]所确定
的类型（[#dcl.meaning]）。

[:en]
The [~attribute-specifier-seq] affects the type only for the declaration it
appears in, not other declarations involving the same type.
[:zh_CN]
此[~特性说明符序列]仅对包含它的声明式中的类型有影响，而并不影响涉及相同类型的
其他声明式。

[para]
[:en]
Each [~decl-specifier] shall appear at most once in the complete
[~decl-specifier-seq] of a declaration, except that [`long] may appear twice.
[:zh_CN]
在一个声明式的完整的[~声明说明符序列]中，每个[~声明说明符]最多可以出现一次，但
[`long] 可以出现两次。

[para]
[:en]
[%ambiguity[!declaration type]]
If a [~type-name] is encountered while parsing a [~decl-specifier-seq], it is
interpreted as part of the [~decl-specifier-seq] if and only if there is no
previous [~type-specifier] other than a [~cv-qualifier] in the
[~decl-specifier-seq].
[:zh_CN]
[%歧义[!声明类型]]
如果在解析[~声明说明符序列]的过程中遇到一个[~类型名]，则当且仅当该[~声明说明符
序列]中此前并未出现除 [~cv-限定符]之外的[~类型说明符]时，它被当作是这个[~声明
说明符序列]的一部分。

[:en]
The sequence shall be self-consistent as described below.
[:zh_CN]
根据下文的说明，该序列应当保持自相一致。

[enter:example]
[codeblock]
typedef char* Pc;
static Pc;                      // [:en] error: name missing
                                // [|:zh_CN] 错误：缺少名字
[codeblock:end]

[:en]
Here, the declaration [`static Pc] is ill-formed because no name was specified
for the static variable of type [`Pc].
[:zh_CN]
此处，由于没有为类型 [`Pc] 的静态变量指定名字，声明式 [`static Pc] 非良构。

[:en]
To get a variable called [`Pc], a [~type-specifier] (other than [`const] or
[`volatile]) has to be present to indicate that the [~typedef-name] [`Pc] is the
name being (re)declared, rather than being part of the [~decl-specifier]
sequence.
[:zh_CN]
为得到名为 [`Pc] 的变量，必须存在某个（不是 [`const] 或 [`volatile] 的）[~类型
说明符]以指出 [~typedef-名] [`Pc] 是被（重新）声明的名字，而不是作为[~声明说明
符]的序列的一部分。

[:en]
For another example,
[:zh_CN]
又例如，

[codeblock]
void f(const Pc);               // [:en] [`void f(char* const)] (not [`const char*])
                                // [|:zh_CN] [`void f(char* const)]，而不是 [`const char*]
void g(const int Pc);           // [`void g(const int)]
[codeblock:end]
[exit:example]

[para]
[enter:note]
[:en]
[%[`signed][![`typedef] and]]
[%[`unsigned][![`typedef] and]]
[%[`long][![`typedef] and]]
[%[`short][![`typedef] and]]
Since [`signed], [`unsigned], [`long], and [`short] by default imply [`int], a
[~type-name] appearing after one of those specifiers is treated as the name
being (re)declared.
[:zh_CN]
[%[`signed][![`typedef] 与～]]
[%[`unsigned][![`typedef] 与～]]
[%[`long][![`typedef] 与～]]
[%[`short][![`typedef] 与～]]
因为 [`signed]、[`unsigned]、[`long] 和 [`short] 默认地暗含了 [`int]，故在这些
说明符之一后面出现的[~类型名]被当作其所（重新）声明的名字。
[enter:example]
[codeblock]
void h(unsigned Pc);            // [`void h(unsigned int)]
void k(unsigned int Pc);        // [`void k(unsigned int)]
[codeblock:end]
[exit:example]
[exit:note]

[include dcl.stc]

[include dcl.fct.spec]

[include dcl.typedef]

[include dcl.friend]

[include dcl.constexpr]

[include dcl.type]

[%:end#specifier]
