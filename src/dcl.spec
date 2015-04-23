[section#dcl.spec
    [:en] Specifiers
]

[%:begin#specifier
    [:en] specifier
]

[para]
[:en]
[%specifier[!declaration]]
The specifiers that can be used in a declaration are

[syntax]
[rule decl-specifier [:zh_CN] ]
    [| storage-class-specifier ]
    [| type-specifier ]
    [| function-specifier ]
    [| [`friend] ]
    [| [`typedef] ]
    [| [`constexpr] ]
[rule:end]

[rule decl-specifier-seq [:zh_CN] ]
    [| decl-specifier [~:opt attribute-specifier-seq] ]
    [| decl-specifier decl-specifier-seq ]
[rule:end]
[syntax:end]

[:en]
The optional [~attribute-specifier-seq] in a [~decl-specifier-seq] appertains to
the type determined by the preceding [~decl-specifier]s ([#dcl.meaning]).

[:en]
The [~attribute-specifier-seq] affects the type only for the declaration it
appears in, not other declarations involving the same type.

[para]
[:en]
Each [~decl-specifier] shall appear at most once in the complete
[~decl-specifier-seq] of a declaration, except that [`long] may appear twice.

[para]
[:en]
[%ambiguity[!declaration type]]
If a [~type-name] is encountered while parsing a [~decl-specifier-seq], it is
interpreted as part of the [~decl-specifier-seq] if and only if there is no
previous [~type-specifier] other than a [~cv-qualifier] in the
[~decl-specifier-seq].

[:en]
The sequence shall be self-consistent as described below.

[enter:example]
[codeblock]
typedef char* Pc;
static Pc;                      // [:en] error: name missing
[codeblock:end]

[:en]
Here, the declaration [`static Pc] is ill-formed because no name was specified
for the static variable of type [`Pc].

[:en]
To get a variable called [`Pc], a [~type-specifier] (other than [`const] or
[`volatile]) has to be present to indicate that the [~typedef-name] [`Pc] is the
name being (re)declared, rather than being part of the [~decl-specifier]
sequence.

[:en]
For another example,

[codeblock]
void f(const Pc);               // [:en] [`void f(char* const)] (not [`const char*])
void g(const int Pc);           // [:en] [`void g(const int)]
[codeblock:end]
[exit:example]

[para]
[%[`signed][![`typedef] and]]
[%[`unsigned][![`typedef] and]]
[%[`long][![`typedef] and]]
[%[`short][![`typedef] and]]

[enter:note]
[:en]
Since [`signed], [`unsigned], [`long], and [`short] by default imply [`int], a
[~type-name] appearing after one of those specifiers is treated as the name
being (re)declared.

[enter:example]
[codeblock]
void h(unsigned Pc);            // [:en] [`void h(unsigned int)]
void k(unsigned int Pc);        // [:en] [`void k(unsigned int)]
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
