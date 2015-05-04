[section#diff.lex
    [:en] Clause [#lex]: lexical conventions
]

[para:~]
[#lex.key]
[para:change]
[:en] New Keywords [br]
[:en] New keywords are added to [=Cpp]; see [#lex.key].
[para:rationale]
[:en] These keywords were added in order to implement the new semantics of
[=Cpp].
[para:effect]
[:en] Change to semantics of well-defined feature.
[:en] Any ISO C programs that used any of these keywords as identifiers are not
valid [=Cpp] programs.
[para:difficulty]
[:en] Syntactic transformation.
[:en] Converting one specific program is easy.
[:en] Converting a large collection of related programs takes more work.
[para:howwide]
[:en] Common.

[para:~]
[#lex.ccon]
[para:change]
[:en]  Type of character literal is changed from [`int] to [`char]
[para:rationale]
[:en] This is needed for improved overloaded function argument type matching.
[:en] For example:

[codeblock]
int function( int i );
int function( char c );

function( 'x' );
[codeblock:end]

[:en] It is preferable that this call match the second version of function
rather than the first.
[para:effect]
[:en] Change to semantics of well-defined feature.
ISO C programs which depend on

[codeblock]
sizeof('x') == sizeof(int)
[codeblock:end]

[:en@~] will not work the same as [=Cpp] programs.
[para:difficulty]
[:en] Simple.
[para:howwide]
[:en] Programs which depend upon [`sizeof('x')] are probably rare.

[para:~]
[:en] Subclause [#lex.string]:
[para:change]
[:en] String literals made const [br]
[:en] The type of a string literal is changed from ["array of [`char]] to
["array of [`const char].]
[:en] The type of a [`char16_t] string literal is changed from ["array of
[$some-integer-type]] to ["array of [`const char16_t].]
[:en] The type of a [`char32_t] string literal is changed from ["array of
[$some-integer-type]] to ["array of [`const char32_t].]
[:en] The type of a wide string literal is changed from ["array of [`wchar_t]]
to ["array of [`const wchar_t].]
[para:rationale]
[:en] This avoids calling an inappropriate overloaded function, which might
expect to be able to modify its argument.
[para:effect]
[:en] Change to semantics of well-defined feature.
[para:difficulty]
[:en] Syntactic transformation.
[:en] The fix is to add a cast:

[codeblock]
char* p = "abc";                // [:en] valid in C, invalid in [=Cpp]
void f(char*) {
  char* p = (char*)"abc";       // [:en] OK: cast added
  f(p);
  f((char*)"def");              // [:en] OK: cast added
}
[codeblock:end]

[para:howwide]
[:en] Programs that have a legitimate reason to treat string literals
as pointers to potentially modifiable memory are probably rare.
