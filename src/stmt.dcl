[section#stmt.dcl
    [:en] Declaration statement
    [:zh_CN] 声明语句
]

[%  [:en] statement[!declaration]
    [:zh_CN] 语句[!声明～] ]

[para]
[:en]
A declaration statement introduces one or more new identifiers into a block; it
has the form
[:zh_CN]
声明语句向语句块中引入一个或多个新标识符；它的形式为

[syntax]
[rule declaration-statement [:zh_CN] 声明语句 ]
    [| block-declaration ]
[rule:end]
[syntax:end]

[:en]
If an identifier introduced by a declaration was previously declared in an outer
block, [%declaration hiding[see name hiding]] [%name hiding] [%block structure]
the outer declaration is hidden for the remainder of the block, after which it
resumes its force.
[:zh_CN]
若由声明式所引入的标识符在外层块中已经被声明过，[%声明式的隐藏[see 名字隐藏]]
[%名字隐藏][%语句块的结构] 则外面的声明式在该块的余下部分中被隐藏，其后又恢复其
效力。

[para]
[:en]
[%block[!initialization in]]
[%initialization[!automatic]]
Variables with automatic storage duration ([#basic.stc.auto]) are initialized
each time their [~declaration-statement] is executed.
[:zh_CN]
[%语句块[!～中的初始化]]
[%初始化[!自动～]]
具有自动存储期（[#basic.stc.auto]）的变量，在每次执行它们的[~声明语句]时进行初始
化。

[:en]
[%local variable[!destruction of]]
Variables with automatic storage duration declared in the block are destroyed on
exit from the block ([#stmt.jump]).
[:zh_CN]
[%局部变量[!～的销毁]]
在语句块中声明的具有自动存储期的变量，在从该语句块中退出（[#stmt.jump]）时进行
销毁。

[para]
[:en]
[%initialization[!jump past]]
[%[`goto][!initialization and]]
It is possible to transfer into a block, but not in a way that bypasses
declarations with initialization.
[:zh_CN]
[%初始化[!跳转越过～]]
[%[`goto][!初始化与～]]
向语句块中转移控制是可能的，但其路径不能经过带有初始化的声明式。

[:en]
A program that jumps
[:zh_CN]
从某个具有自动存储期的变量不在作用域之中的一点，跳转

[footnote]
[:en]
The transfer from the condition of a [`switch] statement to a [`case] label is
considered a jump in this respect.
[:zh_CN]
从 [`switch] 语句的条件到 [`case] 标号的转移被看作是这方面跳转的一种。
[footnote:end]

[:en@~]
from a point where a variable with automatic storage duration is not in scope to
a point where it is in scope is ill-formed unless the variable has scalar type,
class type with a trivial default constructor and a trivial destructor, a
cv-qualified version of one of these types, or an array of one of the preceding
types and is declared without an [~initializer] ([#dcl.init]).
[:zh_CN@~]
到它在作用域之中的一点，则程序非良构，除非该变量具有标量类型，带有平凡默认构造
函数和平凡析构函数的类类型，这些类型之一的被 cv-限定的版本，或者以上类型之一的
数组，且其声明时没有[~初始化式]（[#dcl.init]）。

[enter:example]
[codeblock]
void f() {
  // ...
  goto lx;          // [:en] ill-formed: jump into scope of [`a]
                    // [|:zh_CN] 非良构：向 [`a] 的作用域之中跳转
  // ...
ly:
  X a = 1;
  // ...
lx:
  goto ly;          // [:en] OK, jump implies destructor
                    // [|:zh_CN] OK，跳转隐含了对 [`a] 的析构函数
                    // [:en@~] call for [`a] followed by construction
                    // [|:zh_CN@~] 的调用，再跟着它的紧跟标号
                    // [:en@~] again immediately following label [`ly]
                    // [|:zh_CN@~] [`ly] 之后的又一次构造
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
[:zh_CN]
[%初始化[!自动～]]
[%初始化[!局部 [`static] 的～]]
对所有带有静态存储期（[#basic.stc.static]）或线程存储期（[#basic.stc.thread]）的
块作用域变量，在发生任何其他初始化之前进行零初始化（[#dcl.init]）。

[:en]
Constant initialization ([#basic.start.init]) of a block-scope entity with
static storage duration, if applicable, is performed before its block is first
entered.
[:zh_CN]
带有静态存储期的块作用域实体的常量初始化（[#basic.start.init]）（如果适用），在
首次进入块之前进行。

[:en]
An implementation is permitted to perform early initialization of other
block-scope variables with static or thread storage duration under the same
conditions that an implementation is permitted to statically initialize a
variable with static or thread storage duration in namespace scope
([#basic.start.init]).
[:zh_CN]
允许实现对其他具有静态或线程存储期的块作用域变量预先实施初始化，这与实现被允许对
命名空间作用域（[#basic.start.init]）中带有静态或线程存储期的变量静态地进行初始
化的条件相同。

[:en]
Otherwise such a variable is initialized the first time control passes through
its declaration; such a variable is considered initialized upon the completion
of its initialization.
[:zh_CN]
否则这种变量就是在控制首次通过其声明式时进行初始化的；这种变量一旦完成初始化，
就被当作是已经初始化过的。

[:en]
If the initialization exits by throwing an exception, the initialization is not
complete, so it will be tried again the next time control enters the
declaration.
[:zh_CN]
若其初始化通过抛出异常而退出，则初始化并未完成，因此当控制下次进入该声明式时将
再次尝试进行初始化。

[:en]
If control enters the declaration concurrently while the variable is being
initialized, the concurrent execution shall wait for completion of the
initialization.
[:zh_CN]
若控制在该变量正初始化时并发地进入其声明式，则并发执行应当等待初始化完成。

[footnote]
[:en]
The implementation must not introduce any deadlock around execution of the
initializer.
[:zh_CN]
实现不能在初始化式的执行周围引入任何死锁。
[footnote:end]

[:en]
If control re-enters the declaration recursively while the variable is being
initialized, the behavior is undefined.
[:zh_CN]
若控制在该变量正初始化时递归地再次进入其声明式，则其行为是未定义的。

[enter:example]
[codeblock]
int foo(int i) {
  static int s = foo(2*i);      // [:en] recursive call - undefined
                                // [|:zh_CN] 递归调用：未定义行为
  return i+1;
}
[codeblock:end]
[exit:example]

[para]
[:en]
[%[`static][!destruction of local]]
The destructor for a block-scope object with static or thread storage duration
will be executed if and only if it was constructed.
[:zh_CN]
[%[`static][!局部～的销毁]]
当且仅当带有静态或线程存储期的块作用域对象已被构造时，它的析构函数才会执行。

[enter:note]
[:en]
[#basic.start.term] describes the order in which block-scope objects with static
and thread storage duration are destroyed.
[:zh_CN]
[#basic.start.term] 说明带有静态和线程存储期的块作用域对象的销毁顺序。
[exit:note]
