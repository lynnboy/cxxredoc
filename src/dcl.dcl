[section:chapter#dcl.dcl
    [:en] Declarations
    [:zh_CN] 声明式
]

[%:begin#declaration
    [:en] declaration
    [:zh_CN] 声明式
]

[/
%gram: \rSec1[gram.dcl]{Declarations}
%gram:
/]

[%  [:en] linkage specification[see specification[!linkage]]
    [:zh_CN] 连接说明[see 说明[!连接]] ]

[para]
[:en]
Declarations generally specify how names are to be interpreted.
[:zh_CN]
通常声明式指定如何对名字进行判读。

[:en]
Declarations have the form
[:zh_CN]
声明式的形式为

[syntax]
[rule declaration-seq [:zh_CN] 声明式序列 ]
    [| declaration ]
    [| declaration-seq declaration ]
[rule:end]

[rule declaration [:zh_CN] 声明式 ]
    [| block-declaration ]
    [| function-definition ]
    [| template-declaration ]
    [| explicit-instantiation ]
    [| explicit-specialization ]
    [| linkage-specification ]
    [| namespace-definition ]
    [| empty-declaration ]
    [| attribute-declaration ]
[rule:end]

[rule block-declaration [:zh_CN] 块声明式 ]
    [| simple-declaration ]
    [| asm-definition ]
    [| namespace-alias-definition ]
    [| using-declaration ]
    [| using-directive ]
    [| static_assert-declaration ]
    [| alias-declaration ]
    [| opaque-enum-declaration ]
[rule:end]

[rule alias-declaration [:zh_CN] 别名声明式 ]
    [| [`using] identifier [~:opt attribute-specifier-seq] [`=] type-id [`;] ]
[rule:end]

[rule simple-declaration [:zh_CN] 简单声明式 ]
    [| [~:opt decl-specifier-seq] [~:opt init-declarator-list] [`;] ]
    [| attribute-specifier-seq [~:opt decl-specifier-seq] init-declarator-list [`;] ]
[rule:end]

[rule static_assert-declaration [:zh_CN] static_assert-声明式 ]
    [| [`static_assert] [`(] constant-expression [`)] [`;] ]
    [| [`static_assert] [`(] constant-expression [`,] string-literal [`)] [`;] ]
[rule:end]

[rule empty-declaration [:zh_CN] 空声明式 ]
    [| [`;] ]
[rule:end]

[rule attribute-declaration [:zh_CN] 特性声明式 ]
    [| attribute-specifier-seq [`;] ]
[rule:end]
[syntax:end]

[enter:note]
[:en]
[~asm-definition]s are described in [#dcl.asm], and
[~linkage-specification]s are described in [#dcl.link].
[:zh_CN]
[~asm-定义式]在 [#dcl.asm] 中说明，[~连接说明]在 [#dcl.link] 中说明。

[:en]
[~Function-definition]s are described in [#dcl.fct.def] and
[~template-declaration]s are described in Clause [#temp].
[:zh_CN]
[~函数定义式]在 [#dcl.fct.def] 中说明，[~模板声明式]在第 [#temp] 条中说明。

[:en]
[~Namespace-definition]s are described in [#namespace.def],
[~using-declaration]s are described in [#namespace.udecl] and
[~using-directive]s are described in [#namespace.udir].
[:zh_CN]
[~命名空间定义式]在 [#namespace.def] 中说明，[~using-声明式]在
[#namespace.udecl] 中说明，而 [~using-指令]在 [#namespace.udir] 中说明。
[exit:note]

[para]
[:en]
The [~simple-declaration]
[:zh_CN]
简单声明式

[syntax:explanation]
[~:opt attribute-specifier-seq] [~:opt decl-specifier-seq]
    [~:opt init-declarator-list] [`;]
[syntax:end]

[:en@~]
is divided into three parts.
[:zh_CN@~]
分为三个部分。

[:en]
Attributes are described in [#dcl.attr].
[:zh_CN]
特性标注在 [#dcl.attr] 中说明。

[:en]
[~decl-specifier]s, the principal components of a [~decl-specifier-seq], are
described in [#dcl.spec].
[:zh_CN]
[~声明说明符]（[~声明说明符序列]的主要成分）在 [#dcl.spec] 中说明。

[:en]
[~declarator]s, the components of an [~init-declarator-list], are described in
Clause [#dcl.decl].
[:zh_CN]
[~声明符]（[~初始化声明符列表]的成分）在第 [#dcl.decl] 条中说明。

[:en]
The [~attribute-specifier-seq] in a [~simple-declaration] appertains to each of
the entities declared by the [~declarator]s of the [~init-declarator-list].
[:zh_CN]
[~简单声明式]中的[~特性说明符序列]，属于其[~初始化声明符列表]中每个[~声明符]所
声明的实体。

[enter:note]
[:en]
In the declaration for an entity, attributes appertaining to that entity may
appear at the start of the declaration and after the [~declarator-id] for that
declaration.
[:zh_CN]
在一个实体的声明式中，属于这个实体的特性标注，既可以出现在声明式的开头，也可以
出现在这个声明式的[~声明符标识]之后。
[exit:note]

[enter:example]
[codeblock]
[[noreturn]] void f [[noreturn]] (); // OK
[codeblock:end]
[exit:example]

[para]
[:en]
Except where otherwise specified, the meaning of an [~attribute-declaration] is
[%@impldef meaning of attribute declaration] implementation-defined.
[:zh_CN]
除非特别指明，[~特性声明式]的含义是[%@impldef 特性声明式的含义]由实现定义的。

[para]
[:en]
[%declaration]
[%scope]
A declaration occurs in a scope ([#basic.scope]); the scope rules are summarized
in [#basic.lookup].
[:zh_CN]
[%声明式]
[%作用域]
声明式都出现于某个作用域之中（[#basic.scope]）；[#basic.lookup] 中总结了作用域的
规则。

[:en]
A declaration that declares a function or defines a class, namespace, template,
or function also has one or more scopes nested within it.
[:zh_CN]
在声明了函数，或定义了类、命名空间、模板或函数的声明式中，还嵌套了一个或多个作用
域。

[:en]
These nested scopes, in turn, can have declarations nested within them.
[:zh_CN]
这些嵌套的作用域中本身也可以带有嵌套的声明式。

[:en]
Unless otherwise stated, utterances in Clause [#dcl.dcl] about components in,
of, or contained by a declaration or subcomponent thereof refer only to those
components of the declaration that are [em not] nested within scopes nested
within the declaration.
[:zh_CN]
除非另外指出，否则在第 [#dcl.dcl] 条中提到的，对声明式内的，声明式的，或者声明式
所包含的成分及其子成分的说法，所涉及的都[em 不是]声明式中所嵌套的作用域中的嵌套
声明式的成分。

[para]
[:en]
[%identifier]
[%declarator]
In a [~simple-declaration], the optional [~init-declarator-list] can be omitted
only when declaring a class (Clause [#class]) or enumeration ([#dcl.enum]), that
is, when the [~decl-specifier-seq] contains either a [~class-specifier], an
[~elaborated-type-specifier] with a [~class-key] ([#class.name]), or an
[~enum-specifier].
[:zh_CN]
[%标识符]
[%声明符]
在[~简单声明式]中，仅当声明类（第 [#class] 条）或枚举（[#dcl.enum]）时，就是说，
当其[~声明说明符序列]中包含[~类说明符]，带有[~类关键字]（[#class.name]）的[~详细
类型说明符]，或者[~枚举说明符]时，才能省略可选的[~初始化声明符列表]。

[:en]
In these cases and whenever a [~class-specifier] or [~enum-specifier] is present
in the [~decl-specifier-seq], the identifiers in these specifiers are among the
names being declared by the declaration (as [~class-name]s, [~enum-name]s, or
[~enumerator]s, depending on the syntax).
[:zh_CN]
在这些情况中，以及一旦其[~声明说明符序列]中出现[~类说明符]或[~枚举说明符]时，
这些说明符中的标识符就是由该声明式所声明的名字（依赖其语法，作为[~类名]、
[~枚举名]或[~枚举符]）。

[:en]
In such cases, the [~decl-specifier-seq] shall introduce one or more names into
the program, or shall redeclare a name introduced by a previous declaration.
[:zh_CN]
在这些情况中，其[~声明说明符序列]都应当向程序中引入一个或多个名字，或应当重复
声明由之前的声明式所引入的名字。

[enter:example]
[codeblock]
enum { };           // [:en] ill-formed
                    // [|:zh_CN] 非良构
typedef class { };  // [:en] ill-formed
                    // [|:zh_CN] 非良构
[codeblock:end]
[exit:example]

[para]
[%[`static_assert]]
[:en]
In a [~static_assert-declaration] the [~constant-expression] shall be a constant
expression ([#expr.const]) that can be contextually converted to [`bool]
(Clause [#conv]).
[:zh_CN]
[~static_assert-声明式]中的[~常量表达式]应当为能够按语境转换为 [`bool]（第
[#conv] 条）的常量表达式（[#expr.const]）。

[:en]
If the value of the expression when so converted is [`true], the declaration has
no effect.
[:zh_CN]
如果表达式经此转换后的值是 [`true]，则声明式没有效果。

[:en]
Otherwise, the program is ill-formed, and the resulting diagnostic message
([#intro.compliance]) shall include the text of the [~string-literal], if one is
supplied, except that characters not in the basic source character set
([#lex.charset]) are not required to appear in the diagnostic message.
[:zh_CN]
否则，程序是非良构的，且如果提供了[~字符串字面量]，则所产生的诊断消息
（[#intro.compliance]）应该包含其中的文本，但诊断信息中不必包括不属于基本源字符
集（[#lex.charset]）的字符。

[enter:example]
[codeblock]
static_assert(char(-1) < 0, "this library requires plain 'char' to be signed");
[codeblock:end]
[exit:example]

[para]
[:en]
An [~empty-declaration] has no effect.
[:zh_CN]
[~空声明式]没有效果。

[para]
[:en]
Each [~init-declarator] in the [~init-declarator-list] contains exactly one
[~declarator-id], which is the name declared by that [~init-declarator] and
hence one of the names declared by the declaration.
[:zh_CN]
[~初始化声明符列表]中的每个[~初始化声明符]都包含恰好一个[~声明符标识]，它是由该
[~初始化声明符]所声明的名字，也是由该声明式所声明的名字之一。

[:en]
The [~type-specifiers] ([#dcl.type]) in the [~decl-specifier-seq] and the
recursive [~declarator] structure of the [~init-declarator] describe a type
([#dcl.meaning]), which is then associated with the name being declared by the
[~init-declarator].
[:zh_CN]
[~声明说明符序列]中的[~类型说明符]（[#dcl.type]），以及其[~初始化声明符]中递归的
[~声明符]结构描述了一个类型（[#dcl.meaning]），它与该[~初始化声明符]所声明的名字
相关联。

[para]
[:en]
If the [~decl-specifier-seq] contains the [`typedef] specifier, the declaration
is called a [+typedef declaration] and the name of each [~init-declarator] is
declared to be a [~typedef-name], synonymous with its associated type
([#dcl.typedef]).
[:zh_CN]
若[~声明说明符序列]包含 [`typedef] 说明符，则该声明式被称为 [+typedef 声明式]，
而每个[~初始化声明符]的名字则被声明为 [~typedef-名]，它们是其所关联的类型的
同义词（[#dcl.typedef]）。

[:en]
If the [~decl-specifier-seq] contains no [`typedef] specifier, the declaration
is called a [+function declaration] if the type associated with the name is a
function type ([#dcl.fct]) and an [+object declaration] otherwise.
[:zh_CN]
若[~声明说明符序列]不包含 [`typedef] 说明符，则当与该名字关联的类型是函数类型
（[#dcl.fct]）时，该声明式被称为[+函数声明式]，否则为[+对象声明式]。

[para]
[:en]
[%definition[!declaration as]]
Syntactic components beyond those found in the general form of declaration are
added to a function declaration to make a [~function-definition].
[:zh_CN]
[%定义式[!声明式作为～]]
构成[~函数定义式]时，将对函数声明式添加不属于常规形式的声明式的语法成分。

[:en]
An object declaration, however, is also a definition unless it contains the
[`extern] specifier and has no initializer ([#basic.def]).
[:zh_CN]
然而，除非在对象声明式中含有 [`extern] 说明符且没有初始化式（[#basic.def]），
否则它也是定义式。

[:en]
[%initialization[!definition and]]
A definition causes the appropriate amount of storage to be reserved and any
appropriate initialization ([#dcl.init]) to be done.
[:zh_CN]
[%初始化[!定义式与～]]
定义式导致保留适当数量的存储，并进行任何适当的初始化（[#dcl.init]）。

[para]
[:en]
Only in function declarations for constructors, destructors, and type
conversions can the [~decl-specifier-seq] be omitted.
[:zh_CN]
仅能在构造函数、析构函数和类型转换的函数声明式中省略[~声明说明符序列]。

[footnote]
[:en]
The ["implicit int] rule of C is no longer supported.
[:zh_CN]
不再支持 C 的“隐式 int”规则。
[footnote:end]

[include dcl.spec]

[include dcl.enum]

[include basic.namespace]

[include dcl.asm]

[include dcl.link]

[include dcl.attr]

[%:end#declaration]
