[section#diff.dcl
    [:en] Clause [#dcl.dcl]: declarations
]

[#dcl.stc]
[para:change]
[:en] In [=Cpp], the [`static] or [`extern] specifiers can only be applied to
names of objects or functions
[:en] Using these specifiers with type declarations is illegal in [=Cpp].
[:en] In C, these specifiers are ignored when used on type declarations.
[para:~]
[:en] Example:

[codeblock]
static struct S {               // [:en] valid C, invalid in [=Cpp]
  int i;
};
[codeblock:end]

[para:rationale]
[:en] Storage class specifiers don't have any meaning when associated with a
type.
[:en] In [=Cpp], class members can be declared with the [`static] storage class
specifier.
[:en] Allowing storage class specifiers on type declarations could render the
code confusing for users.
[para:effect]
[:en] Deletion of semantically well-defined feature.
[para:difficulty]
[:en] Syntactic transformation.
[para:howwide]
[:en] Seldom.

[para:~]
[#dcl.typedef]
[para:change]
[:en] A [=Cpp] typedef name must be different from any class type name declared
in the same scope (except if the typedef is a synonym of the class name with the
same name).
[:en] In C, a typedef name and a struct tag name declared in the same scope can
have the same name (because they have different name spaces)

[para:~]
[:en] Example:

[codeblock]
typedef struct name1 { /*...*/ } name1;         // [:en] valid C and [=Cpp]
struct name { /*...*/ };
typedef int name;               // [:en] valid C, invalid [=Cpp]
[codeblock:end]

[para:rationale]
[:en] For ease of use, [=Cpp] doesn't require that a type name be prefixed with
the keywords [`class], [`struct] or [`union] when used in object declarations or
type casts.

[para:~]
[:en] Example:

[codeblock]
class name { /*...*/ };
name i;                         // [:en] [`i] has type [`class name]
[codeblock:end]

[para:effect]
[:en] Deletion of semantically well-defined feature.
[para:difficulty]
[:en] Semantic transformation.
[:en] One of the 2 types has to be renamed.
[para:howwide]
[:en] Seldom.

[para:~]
[:en] [#dcl.type] [=[]see also [#basic.link][=]]
[para:change]
[:en] const objects must be initialized in [=Cpp] but can be left uninitialized
in C
[para:rationale]
[:en] A const object cannot be assigned to so it must be initialized to hold a
useful value.
[para:effect]
[:en] Deletion of semantically well-defined feature.
[para:difficulty]
[:en] Semantic transformation.
[para:howwide]
[:en] Seldom.

[para:~]
[#dcl.type]
[para:change]
[:en] Banning implicit int

[para:~]
[:en] In [=Cpp] a [~decl-specifier-seq] must contain a [~type-specifier], unless
it is followed by a declarator for a constructor, a destructor, or a conversion
function.
[:en] In the following example, the left-hand column presents valid C; the
right-hand column presents equivalent [=Cpp] :

[codeblock]
void f(const parm);            void f(const int parm);
const n = 3;                   const int n = 3;
main()                         int main()
    /* ... */                      /* ... */
[codeblock:end]

[para:rationale]
[:en] In [=Cpp], implicit int creates several opportunities for ambiguity
between expressions involving function-like casts and declarations.
[:en] Explicit declaration is increasingly considered to be proper style.
[:en] Liaison with WG14 (C) indicated support for (at least) deprecating
implicit int in the next revision of C.
[para:effect]
[:en] Deletion of semantically well-defined feature.
[para:difficulty]
[:en] Syntactic transformation.
[:en] Could be automated.
[para:howwide]
[:en] Common.

[#dcl.spec.auto]
[para:change]
[:en] The keyword [`auto] cannot be used as a storage class specifier.

[codeblock]
void f() {
  auto int x;     // [:en] valid C, invalid C++
}
[codeblock:end]

[para:rationale]
[:en] Allowing the use of [`auto] to deduce the type of a variable from its
initializer results in undesired interpretations of [`auto] as a storage class
specifier in certain contexts.
[para:effect]
[:en] Deletion of semantically well-defined feature.
[para:difficulty]
[:en] Syntactic transformation.
[para:howwide]
[:en] Rare.

[para:~]
[#dcl.enum]
[para:change]
[:en] [=Cpp] objects of enumeration type can only be assigned values of the same
enumeration type.
[:en] In C, objects of enumeration type can be assigned values of any integral
type

[para:~]
[:en] Example:

[codeblock]
enum color { red, blue, green };
enum color c = 1;               // [:en] valid C, invalid [=Cpp]
[codeblock:end]

[para:rationale]
[:en] The type-safe nature of [=Cpp].
[para:effect]
[:en] Deletion of semantically well-defined feature.
[para:difficulty]
[:en] Syntactic transformation.
[:en] (The type error produced by the assignment can be automatically corrected
by applying an explicit cast.)
[para:howwide]
[:en] Common.

[para:~]
[#dcl.enum]
[para:change]
[:en] In [=Cpp], the type of an enumerator is its enumeration.
[:en] In C, the type of an enumerator is [`int].

[:en] Example:

[codeblock]
enum e { A };
sizeof(A) == sizeof(int)        // [:en] in C
sizeof(A) == sizeof(e)          // [:en] in [=Cpp]
/* [:en] and [`sizeof(int)] is not necessarily equal to [`sizeof(e)] */
[codeblock:end]

[para:rationale]
[:en] In [=Cpp], an enumeration is a distinct type.
[para:effect]
[:en] Change to semantics of well-defined feature.
[para:difficulty]
[:en] Semantic transformation.
[para:howwide]
[:en] Seldom.
[:en] The only time this affects existing C code is when the size of an
enumerator is taken.
[:en] Taking the size of an enumerator is not a common C coding practice.
