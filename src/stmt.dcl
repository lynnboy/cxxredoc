[section#stmt.dcl
    [:en] Declaration statement
]

[%  [:en] statement[!declaration]
    [:zh_CN] ]

[para]
[:en]
A declaration statement introduces one or more new identifiers into a block; it
has the form

[syntax]
[rule declaration-statement [:zh_CN] ]
    [| block-declaration ]
[rule:end]
[syntax:end]

[:en]
If an identifier introduced by a declaration was previously declared in an outer
block,
[%declaration hiding[see name hiding]]
[%name hiding]
[%block structure]
the outer declaration is hidden for the remainder of the block, after which it
resumes its force.

[para]
[:en]
[%block[!initialization in]]
[%initialization[!automatic]]
Variables with automatic storage duration ([#basic.stc.auto]) are initialized
each time their [~declaration-statement] is executed.

[:en]
[%local variable[!destruction of]]
Variables with automatic storage duration declared in the block are destroyed on
exit from the block ([#stmt.jump]).

[para]
[:en]
[%initialization[!jump past]]
[%[`goto][!initialization and]]
It is possible to transfer into a block, but not in a way that bypasses
declarations with initialization.

[:en]
A program that jumps

[footnote]
The transfer from the condition of a [`switch] statement to a [`case] label is
considered a jump in this respect.
[footnote:end]

[:en@~]
from a point where a variable with automatic storage duration is not in scope to
a point where it is in scope is ill-formed unless the variable has scalar type,
class type with a trivial default constructor and a trivial destructor, a
cv-qualified version of one of these types, or an array of one of the preceding
types and is declared without an [~initializer] ([#dcl.init]).

[enter:example]
[codeblock]
void f() {
  // ...
  goto lx;          // [:en] ill-formed: jump into scope of [`a]
  // ...
ly:
  X a = 1;
  // ...
lx:
  goto ly;          // [:en] OK, jump implies destructor
                    // [:en@~] call for [`a] followed by construction
                    // [:en@~] again immediately following label [`ly]
}
[codeblock:end]
[exit:example]

[para]
[:en]
[%initialization[!automatic]]
[%initialization[!local [`static]]]
The zero-initialization ([#dcl.init]) of all block-scope variables with static
storage duration ([#basic.stc.static]) or thread storage duration
([#basic.stc.thread]) is performed before any other initialization takes place.

[:en]
Constant initialization ([#basic.start.init]) of a block-scope entity with
static storage duration, if applicable, is performed before its block is first
entered.

[:en]
An implementation is permitted to perform early initialization of other
block-scope variables with static or thread storage duration under the same
conditions that an implementation is permitted to statically initialize a
variable with static or thread storage duration in namespace scope
([#basic.start.init]).

[:en]
Otherwise such a variable is initialized the first time control passes through
its declaration; such a variable is considered initialized upon the completion
of its initialization.

[:en]
If the initialization exits by throwing an exception, the initialization is not
complete, so it will be tried again the next time control enters the
declaration.

[:en]
If control enters the declaration concurrently while the variable is being
initialized, the concurrent execution shall wait for completion of the
initialization.

[footnote]
[:en]
The implementation must not introduce any deadlock around execution of the
initializer.
[footnote:end]

[:en]
If control re-enters the declaration recursively while the variable is being
initialized, the behavior is undefined.

[enter:example]
[codeblock]
int foo(int i) {
  static int s = foo(2*i);      // [:en] recursive call - undefined
  return i+1;
}
[codeblock:end]
[exit:example]

[para]
[:en]
[%[`static][!destruction of local]]
The destructor for a block-scope object with static or thread storage duration
will be executed if and only if it was constructed.

[enter:note]
[:en]
[#basic.start.term] describes the order in which block-scope objects with static
and thread storage duration are destroyed.
[exit:note]
