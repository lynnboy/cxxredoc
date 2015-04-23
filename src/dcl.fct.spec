[section#dcl.fct.spec
    [:en] Function specifiers
]
[%  [:en] specifier[!function]
    [:zh_CN] ]
[%  [:en] function [seealso friend function]
        [seealso member function]
        [seealso inline function]
        [seealso virtual function]
]

[para]
[:en]
[~Function-specifiers] can be used only in function declarations.

[syntax]
[rule function-specifier [:zh_CN] ]
    [| [`inline] ]
    [| [`virtual] ]
    [| [`explicit] ]
[rule:end]
[syntax:end]

[para]
[:en]
[%specifier[![`inline]]]
[%inline function]]
A function declaration ([#dcl.fct], [#class.mfct], [#class.friend]) with an
[`inline] specifier declares an [+inline function].

[:en]
The inline specifier indicates to the implementation that inline substitution of
the function body at the point of call is to be preferred to the usual function
call mechanism.

[:en]
An implementation is not required to perform this inline substitution at the
point of call; however, even if this inline substitution is omitted, the other
rules for inline functions defined by [#dcl.fct.spec] shall still be respected.

[para]
[:en]
A function defined within a class definition is an inline function.

[:en]
The [`inline] specifier shall not appear on a block scope function declaration.

[footnote]
[:en]
The inline keyword has no effect on the linkage of a function.
[footnote:end]

[:en]
If the [`inline] specifier is used in a friend declaration, that declaration
shall be a definition or the function shall have previously been declared
inline.

[para]
[:en]
An inline function shall be defined in every translation unit in which it is
odr-used and shall have exactly the same definition in every case
([#basic.def.odr]).

[enter:note]
[:en]
A call to the inline function may be encountered before its definition appears
in the translation unit.
[exit:note]

[:en]
If the definition of a function appears in a translation unit before its first
declaration as inline, the program is ill-formed.

[:en]
If a function with external linkage is declared inline in one translation unit,
it shall be declared inline in all translation units in which it appears; no
diagnostic is required.

[:en]
An [`inline] function with external linkage shall have the same address in all
translation units.

[:en]
A [`static] local variable in an [`extern inline] function always refers to the
same object.

[:en]
A type defined within the body of an [`extern inline] function is the same type
in every translation unit.

[para]
[:en]
[%specifier[![`virtual]]]
The [`virtual] specifier shall be used only in the initial declaration of a
non-static class member function; see [#class.virtual].

[para]
[:en]
[%specifier[![`explicit]]]
The [`explicit] specifier shall be used only in the declaration of a constructor
or conversion function within its class definition; see [#class.conv.ctor] and
[#class.conv.fct].
