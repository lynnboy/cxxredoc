[section:chapter#dcl.dcl
    [:en] Declarations
]

[%:begin#declaration
    [:en] declaration
]

[/
%gram: \rSec1[gram.dcl]{Declarations}
%gram:
/]

[%  [:en] linkage specification[see specification, linkage]
    [:zh_CN] ]

[para]
[:en]
Declarations generally specify how names are to be interpreted.

[:en]Declarations have the form

[syntax]
[rule declaration-seq [:zh_CN] ]
    [| declaration ]
    [| declaration-seq declaration ]
[rule:end]

[rule declaration [:zh_CN] ]
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

[rule block-declaration [:en] ]
    [| simple-declaration ]
    [| asm-definition ]
    [| namespace-alias-definition ]
    [| using-declaration ]
    [| using-directive ]
    [| static_assert-declaration ]
    [| alias-declaration ]
    [| opaque-enum-declaration ]
[rule:end]

[rule alias-declaration ]
    [| [`using] identifier [~:opt attribute-specifier-seq] [`=] type-id [`;] ]
[rule:end]

[rule simple-declaration [:zh_CN] ]
    [| [~:opt decl-specifier-seq] [~:opt init-declarator-list] [`;] ]
    [| attribute-specifier-seq [~:opt decl-specifier-seq] init-declarator-list [`;] ]
[rule:end]

[rule static_assert-declaration [:zh_CN] ]
    [| [`static_assert] [`(] constant-expression [`)] [`;] ]
    [| [`static_assert] [`(] constant-expression [`,] string-literal [`)] [`;] ]
[rule:end]

[rule empty-declaration [:zh_CN] ]
    [| [`;] ]
[rule:end]

[rule attribute-declaration [:zh_CN] ]
    [| attribute-specifier-seq [`;] ]
[rule:end]
[syntax:end]

[enter:note]
[:en]
[~asm-definition]s are described in [#dcl.asm], and
[~linkage-specification]s are described in [#dcl.link].

[:en]
[~Function-definition]s are described in [#dcl.fct.def] and
[~template-declaration]s are described in Clause [#temp].

[:en]
[~Namespace-definition]s are described in [#namespace.def],
[~using-declaration]s are described in [#namespace.udecl] and
[~using-directive]s are described in [#namespace.udir].
[exit:note]

[para]
[:en]
The [~simple-declaration]

[syntax:explanation]
[~:opt attribute-specifier-seq] [~:opt decl-specifier-seq] [~:opt init-declarator-list] [`;]
[syntax:end]

[:en@~]
is divided into three parts.

[:en]
Attributes are described in [#dcl.attr].

[:en]
[~decl-specifier]s, the principal components of a [~decl-specifier-seq], are
described in [#dcl.spec].

[:en]
[~declarator]s, the components of an [~init-declarator-list], are described in
Clause [#dcl.decl].

[:en]
The [~attribute-specifier-seq] in a [~simple-declaration] appertains to each of
the entities declared by the [~declarator]s of the [~init-declarator-list].

[enter:note]
[:en]
In the declaration for an entity, attributes appertaining to that entity may
appear at the start of the declaration and after the [~declarator-id] for that
declaration.
[exit:note]

[enter:example]
[codeblock]
[[noreturn]] void f [[noreturn]] (); // OK
[codeblock:end]
[exit:example]

[para]
[:en]
Except where otherwise specified, the meaning of an [~attribute-declaration] is
[%@impldef meaning of attribute declaration].

[para]
[:en]
[%declaration]
[%scope]
A declaration occurs in a scope ([#basic.scope]); the scope rules are summarized
in [#basic.lookup].

[:en]
A declaration that declares a function or defines a class, namespace, template,
or function also has one or more scopes nested within it.

[:en]
These nested scopes, in turn, can have declarations nested within them.

[:en]
Unless otherwise stated, utterances in Clause [#dcl.dcl] about components in,
of, or contained by a declaration or subcomponent thereof refer only to those
components of the declaration that are [em not] nested within scopes nested
within the declaration.

[para]
[:en]
[%identifier]
[%declarator]
In a [~simple-declaration], the optional [~init-declarator-list] can be omitted
only when declaring a class (Clause [#class]) or enumeration ([#dcl.enum]), that
is, when the [~decl-specifier-seq] contains either a [~class-specifier], an
[~elaborated-type-specifier] with a [~class-key] ([#class.name]), or an
[~enum-specifier].

[:en]
In these cases and whenever a [~class-specifier] or [~enum-specifier] is present
in the [~decl-specifier-seq], the identifiers in these specifiers are among the
names being declared by the declaration (as [~class-name]s, [~enum-name]s, or
[~enumerator]s, depending on the syntax).

[:en]
In such cases, the [~decl-specifier-seq] shall introduce one or more names into
the program, or shall redeclare a name introduced by a previous declaration.

[enter:example]
[codeblock]
enum { };           // [:en] ill-formed
typedef class { };  // [:en] ill-formed
[codeblock:end]
[exit:example]

[para]
[:en]
[%[`static_assert]]
In a [~static_assert-declaration] the [~constant-expression] shall be a constant
expression ([#expr.const]) that can be contextually converted to [`bool]
(Clause [#conv]).

[:en]
If the value of the expression when so converted is [`true], the declaration has
no effect.

[:en]
Otherwise, the program is ill-formed, and the resulting diagnostic message
([#intro.compliance]) shall include the text of the [~string-literal], if one is
supplied, except that characters not in the basic source character set
([#lex.charset]) are not required to appear in the diagnostic message.

[enter:example]
[codeblock]
static_assert(char(-1) < 0, "this library requires plain 'char' to be signed");
[codeblock:end]
[exit:example]

[para]
[:en]
An [~empty-declaration] has no effect.

[para]
[:en]
Each [~init-declarator] in the [~init-declarator-list] contains exactly one
[~declarator-id], which is the name declared by that [~init-declarator] and
hence one of the names declared by the declaration.

[:en]
The [~type-specifiers] ([#dcl.type]) in the [~decl-specifier-seq] and the
recursive [~declarator] structure of the [~init-declarator] describe a type
([#dcl.meaning]), which is then associated with the name being declared by the
[~init-declarator].

[para]
[:en]
If the [~decl-specifier-seq] contains the [`typedef] specifier, the declaration
is called a [+typedef declaration] and the name of each [~init-declarator] is
declared to be a [~typedef-name], synonymous with its associated type
([#dcl.typedef]).

[:en]
If the [~decl-specifier-seq] contains no [`typedef] specifier, the declaration
is called a [+function declaration] if the type associated with the name is a
function type ([#dcl.fct]) and an [+object declaration] otherwise.

[para]
[:en]
[%definition[!declaration as]]
Syntactic components beyond those found in the general form of declaration are
added to a function declaration to make a [~function-definition].

[:en]
An object declaration, however, is also a definition unless it contains the
[`extern] specifier and has no initializer ([#basic.def]).

[:en]
[%initialization[!definition and]]
A definition causes the appropriate amount of storage to be reserved and any
appropriate initialization ([#dcl.init]) to be done.

[para]
[:en]
Only in function declarations for constructors, destructors, and type
conversions can the [~decl-specifier-seq] be omitted.

[footnote]
[:en]
The ["implicit int] rule of C is no longer supported.
[footnote:end]

[include dcl.spec]

[include dcl.enum]

[include basic.namespace]

[include dcl.asm]

[include dcl.link]

[include dcl.attr]

[%:end#declaration]
