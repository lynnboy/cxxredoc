[section#dcl.asm
    [:en] The [`asm] declarations
]

[:en]
[%declaration[![`asm]]]
[%assembler]
[%[`asm][!implementation-defined]]

[para]
[:en]
An [`asm] declaration has the form

[syntax]
[rule asm-definition [:zh_CN] ]
    [| [`asm] [`(] string-literal [`)] [`;] ]
[rule:end]
[syntax:end]

[:en]
The [`asm] declaration is conditionally-supported; its meaning is
[%@impldef meaning of [`asm] declaration].

[enter:note]
[:en]
Typically it is used to pass information through the implementation to an
assembler.
[exit:note]
