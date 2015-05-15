[section#except.spec
    [:en] Exception specifications
    [:zh_CN] 异常说明
]

[%:begin#exception.specification
    [:en] exception specification
    [:zh_CN] 异常说明
]

[para]
[:en]
[%exception specification[!non-throwing]]
The [def exception specification] of a function is a (possibly empty) set of
types, indicating that the function might exit via an exception that matches a
handler of one of the types in the set; the (conceptual) set of all types is
used to denote that the function might exit via an exception of arbitrary type.
[:zh_CN]
[%异常说明[!无抛出～]]
函数的[def 异常说明]是（可能为空的）类型集合，指出该函数可能通过与此集合中的类型
之一的处理器相匹配的异常而退出；（概念上的）所有类型的集合用于指出函数可能通过
任意类型的异常而退出。

[:en]
If the set is empty, the function is said to have a [def non-throwing exception
specification].
[:zh_CN]
如果集合为空，则函数被称为带有[def 无抛出异常说明]。

[:en]
The exception specification is either defined explicitly by using an
[~exception-specification] as a suffix of a function declaration[=']s declarator
([#dcl.fct]) or implicitly.
[:zh_CN]
异常说明要么通过使用[~异常说明]作为函数声明式的后缀进行明确定义（[#dcl.fct]），
要么被隐式定义。

[syntax]
[rule exception-specification [:zh_CN] 异常说明 ]
    [| dynamic-exception-specification ]
    [| noexcept-specification ]
[rule:end]

[rule dynamic-exception-specification [:zh_CN] 动态异常说明 ]
    [| [`throw] [`(] [~:opt type-id-list] [`)] ]
[rule:end]

[rule type-id-list [:zh_CN] 类型标识列表 ]
    [| type-id [`:opt ...] ]
    [| type-id-list [`,] type-id [`:opt ...] ]
[rule:end]

[rule noexcept-specification [:zh_CN] noexcept-说明 ]
    [| [`noexcept] [`(] constant-expression [`)] ]
    [| [`noexcept] ]
[rule:end]
[syntax:end]

[:en]
[%exception specification[!noexcept[!constant expression and]]]
In a [~noexcept-specification], the [~constant-expression], if supplied, shall
be a constant expression ([#expr.const]) that is contextually converted to
[`bool] (Clause [#conv]).
[:zh_CN]
[%异常说明[!noexcept～[!常量表达式与～]]]
在 [~noexcept-说明]中，[~常量表达式]（如果提供）应当是按语境转换为 [`bool]（第
[#conv] 条）的常量表达式（[#expr.const]）。

[:en]
A [`(] token that follows [`noexcept] is part of the [~noexcept-specification]
and does not commence an initializer ([#dcl.init]).
[:zh_CN]
跟在 [`noexcept] 后面的 [`(] 记号是 [~noexcept-说明]的一部分，而并不开始一个
初始化式（[#dcl.init]）。

[para]
[:en]
An [~exception-specification] shall appear only on a function declarator for a
function type, pointer to function type, reference to function type, or pointer
to member function type that is the top-level type of a declaration or
definition, or on such a type appearing as a parameter or return type in a
function declarator.
[:zh_CN]
[~异常说明]只能出现在作为声明式或定义式的顶层类型的函数类型、函数指针类型、函数
引用类型或成员函数指针类型的函数声明符上，或者函数声明符中作为形参或返回类型的
这些类型上。

[:en]
An [~exception-specification] shall not appear in a typedef declaration or
[~alias-declaration].
[:zh_CN]
[~异常说明]不能出现在 typedef 声明式或[~别名声明式]中。

[enter:example]
[codeblock]
void f() throw(int);                    // OK
void (*fp)() throw (int);               // OK
void g(void pfa() throw(int));          // OK
typedef int (*pf)() throw(int);         // [:en] ill-formed
                                        // [|:zh_CN] 非良构
[codeblock:end]
[exit:example]

[:en]
[%exception specification[!incomplete type and]]
A type denoted in a [~dynamic-exception-specification] shall not denote an
incomplete type or an rvalue reference type.
[:zh_CN]
[%异常说明[!不完整类型与～]]
在[~动态异常说明]中涉指的类型不能代表不完整类型或右值引用类型。

[:en]
A type denoted in a [~dynamic-exception-specification] shall not denote a
pointer or reference to an incomplete type, other than ["pointer to [$cv]
[`void]].
[:zh_CN]
在[~动态异常说明]中涉指的类型不能代表除“[$cv] [`void] 指针”之外的指向不完整类型
的指针或引用。

[:en]
A type [$cv] [`T], ["array of [`T]], or ["function returning [`T]] denoted in a
[~dynamic-exception-specification] is adjusted to type [`T], ["pointer to [`T]],
or ["pointer to function returning [`T]], respectively.
[:zh_CN]
[~动态异常说明]中指定的类型 [$cv] [`T]，“[`T] 的数组”，或“[`T] 为返回类型的函数”
分别被调整为 [`T]，“[`T] 的指针”，或“[`T] 为返回类型的函数的指针”。

[:en]
A [~dynamic-exception-specification] denotes an exception specification that is
the set of adjusted types specified thereby.
[:zh_CN]
[~动态异常说明]代表调整后的其所指定的类型的集合的异常说明。

[para]
[:en]
The [~exception-specification] [`noexcept] or
[`noexcept(][~constant-expression][`)], where the [~constant-expression] yields
[`true], denotes an exception specification that is the empty set.
[:zh_CN]
[~异常说明] [`noexcept] 或 [`noexcept(][~常量表达式][`)]，其中的[~常量表达式]
产生 [`true]，代表作为空集的异常说明。

[:en]
The [~exception-specification] [`noexcept(][~constant-expression][`)], where the
[~constant-expression] yields [`false], or the absence of an
[~exception-specification] in a function declarator other than that for a
destructor ([#class.dtor]) or a deallocation function
([#basic.stc.dynamic.deallocation]) denotes an exception specification that is
the set of all types.
[:zh_CN]
[~异常说明] [`noexcept(][~常量表达式][`)]，其中的[~常量表达式]产生 [`false]，或
除了析构函数（[#class.dtor]）或回收函数（[#basic.stc.dynamic.deallocation]）以外
的函数声明符中不带有[~异常说明]，代表作为所有类型的集合的异常说明。

[para]
[:en]
[%exception specification[!compatible]]
Two [~exception-specification]s are [def compatible [%compatible[see exception
specification [!compatible]]]] if the sets of types they denote are the same.
[:zh_CN]
[%异常说明[!兼容]]
如果两个[~异常说明]所代表的类型集合相同，则它们[def 兼容 [%兼容 [see 异常说明
[!兼容]]]]。

[para]
[:en]
If any declaration of a function has an [~exception-specification] that is not a
[~noexcept-specification] allowing all exceptions, all declarations, including
the definition and any explicit specialization, of that function shall have a
compatible [~exception-specification].
[:zh_CN]
若某函数的任何声明式带有[~异常说明]且并非允许所有异常的 [~noexcept-说明]，则该
函数的所有声明式，包括其定义式和任何显式特化式都应带有与之兼容的[~异常说明]。

[:en]
If any declaration of a pointer to function, reference to function, or pointer
to member function has an [~exception-specification], all occurrences of that
declaration shall have a compatible [~exception-specification].
[:zh_CN]
若某函数指针，函数引用，或成员函数指针的任何声明式带有[~异常说明]，则它的所有
声明式都应带有与之兼容的[~异常说明]。

[:en]
If a declaration of a function has an implicit exception specification, other
declarations of the function shall not specify an [~exception-specification].
[:zh_CN]
若某函数的声明式具有隐含的异常说明，则该函数的其他声明式都不应指定[~异常说明]。

[:en]
In an explicit instantiation an [~exception-specification] may be specified, but
is not required.
[:zh_CN]
在显式实例化式中可以指定[~异常说明]，但并不必须。

[:en]
If an [~exception-specification] is specified in an explicit instantiation
directive, it shall be compatible with the [~exception-specification]s of other
declarations of that function.
[:zh_CN]
若在显式实例化指令中指定了[~异常说明]，则它应当与该函数的其他声明式的[~异常说明]
相兼容。

[:en]
A diagnostic is required only if the [~exception-specification]s are not
compatible within a single translation unit.
[:zh_CN]
仅当同一个翻译单元中的这些[~异常说明]不相兼容时才需要进行诊断。

[para]
[:en]
[%exception specification[!virtual function and]]
If a virtual function has an exception specification, all declarations,
including the definition, of any function that overrides that virtual function
in any derived class shall only allow exceptions that are allowed by the
exception specification of the base class virtual function, unless the
overriding function is defined as deleted.
[:zh_CN]
[%异常说明[!虚函数与～]]
若虚函数带有异常说明，则在任何派生类中覆盖了该虚函数的任何函数的所有声明式，包括
定义式，应当只允许基类虚函数的异常说明中所允许的异常，除非覆盖函数被定义为弃置的
。

[enter:example]
[codeblock]
struct B {
  virtual void f() throw (int, double);
  virtual void g();
};

struct D: B {
  void f();                     // [:en] ill-formed
                                // [|:zh_CN] 非良构
  void g() throw (int);         // OK
};
[codeblock:end]

[:en]
The declaration of [`D::f] is ill-formed because it allows all exceptions,
whereas [`B::f] allows only [`int] and [`double].
[:zh_CN]
[`D::f] 的声明式是非良构的，这是由于它允许所有异常，而 [`B::f] 仅允许 [`int] 和
[`double]。
[exit:example]

[:en]
A similar restriction applies to assignment to and initialization of pointers to
functions, pointers to member functions, and references to functions: the target
entity shall allow at least the exceptions allowed by the source value in the
assignment or initialization.
[:zh_CN]
相似的限制适用于对函数指针、成员函数指针和函数引用所进行的赋值或初始化：赋值或
初始化中的目标实体应当至少允许由源值所允许的异常。

[enter:example]
[codeblock]
class A { /* ... */ };
void (*pf1)();      // [:en] no exception specification
                    // [|:zh_CN] 没有异常说明
void (*pf2)() throw(A);

void f() {
  pf1 = pf2;        // [:en] OK: [`pf1] is less restrictive
                    // [|:zh_CN] OK：[`pf1] 限制较少
  pf2 = pf1;        // [:en] error: [`pf2] is more restrictive
                    // [|:zh_CN] 错误：[`pf2] 限制较多
}
[codeblock:end]
[exit:example]

[para]
[:en]
In such an assignment or initialization, [~exception-specification]s on return
types and parameter types shall be compatible.
[:zh_CN]
在这种赋值或初始化中，返回类型和形参类型上的[~异常说明]应当互相兼容。

[:en]
In other assignments or initializations, [~exception-specification]s shall be
compatible.
[:zh_CN]
在其他赋值或初始化中，其[~异常说明]应当互相兼容。

[para]
[:en]
An [~exception-specification] can include the same type more than once and can
include classes that are related by inheritance, even though doing so is
redundant.
[:zh_CN]
[~异常说明]中可以多次包含相同的类型，而且可以包含具有继承关系的类，虽然这样做是
多余的。

[enter:note]
[:en]
An [~exception-specification] can also include the class [`std::bad_exception]
([#bad.exception]).
[:zh_CN]
[~异常说明]还可以包含类 [`std::bad_exception]（[#bad.exception]）。
[exit:note]

[para]
[:en]
[%allowing an exception[see exception specification[!allowing an exception]]]
A function is said to [def allow an exception [%exception specification
[!allowing an exception]]] of type [`E] if its exception specification contains
a type [`T] for which a handler of type [`T] would be a match ([#except.handle])
for an exception of type [`E].
[:zh_CN]
[%允许一种异常[see 异常说明[!允许一种异常]]]
若某函数的异常说明中包含某个类型 [`T]，而 [`T] 类型的处理器可以匹配类型 [`E] 的
异常（[#except.handle]），则称它[def 允许 [`E] 类型的异常 [%异常说明[!允许一种
异常]]]。

[:en]
[%allowing all exceptions
    [see exception specification[!allowing all exceptions]]]
A function is said to [def allow all exceptions [%exception specification
[!allowing all exceptions]]] if its exception specification is the set of all
types.
[:zh_CN]
[%允许所有异常 [see 异常说明[!允许所有异常]]]
若某函数的异常说明是所有类型的集合，则称它[def 允许所有异常 [%异常处理[!允许所有
异常]]]。

[para]
[:en]
[%exception handling[![`unexpected()] called]]
[%[`unexpected()][!called]]
Whenever an exception of type [`E] is thrown and the search for a handler
([#except.handle]) encounters the outermost block of a function with an
exception specification that does not allow [`E], then,
[:zh_CN]
[%异常处理[!调用 [`unexpected()]]]
[%[`unexpected()][!调用]]
当抛出类型 [`E] 的异常而搜索处理器（[#except.handle]）时遇到带有并不允许 [`E] 的
异常说明的函数的最外层块时，

[list]
[item]
[:en@~]
if the function definition has a [~dynamic-exception-specification], the
function [`std::unexpected()] is called ([#except.unexpected]),
[:zh_CN@~]
若该函数的定义式带有[~动态异常说明]，就调用函数 [`std::unexpected()]
（[#except.unexpected]），

[item]
[:en@~]
[%exception handling[![`terminate()] called]]
[%[`terminate()][!called]]
otherwise, the function [`std::terminate()] is called ([#except.terminate]).
[:zh_CN@~]
[%异常处理[!调用 [`terminate()]]]
[%[`terminate()][!调用]]
否则就调用函数 [`std::terminate()]（[#except.terminate]）。
[list:end]

[enter:example]
[codeblock]
class X { };
class Y { };
class Z: public X { };
class W { };

void f() throw (X, Y) {
  int n = 0;
  if (n) throw X();             // OK
  if (n) throw Z();             // [:en] also OK
                                // [|:zh_CN] 也 OK
  throw W();                    // [:en] will call [`std::unexpected()]
                                // [|:zh_CN] 将会调用 [`std::unexpected()]
}
[codeblock:end]
[exit:example]

[para:~]
[enter:note]
[:en]
A function can have multiple declarations with different non-throwing
[~exception-specification]s; for this purpose, the one on the function
definition is used.
[:zh_CN]
一个函数可以有多个具有不同的无抛出[~异常说明]的声明式；对于这种情况，使用该函数
的定义式中的那个。
[exit:note]

[para]
[:en]
An implementation shall not reject an expression merely because when executed it
throws or might throw an exception that the containing function does not allow.
[:zh_CN]
实现不能仅仅因为当执行一个表达式时，将会或可能会抛出一个不被包含它的函数所允许的
异常，就拒绝这个表达式。

[enter:example]
[codeblock]
extern void f() throw(X, Y);

void g() throw(X) {
  f();                          // OK
}

[codeblock:end]

[:en@~]
the call to [`f] is well-formed even though when called, [`f] might throw
exception [`Y] that [`g] does not allow.
[:zh_CN@~]
即使当调用时 [`f] 可能抛出 [`g] 并不允许的异常 [`Y]，对 [`f] 的调用仍是良构的。
[exit:example]

[para]
[enter:note]
[:en]
An exception specification is not considered part of a function[=']s type; see
[#dcl.fct].
[:zh_CN]
异常说明并不被当作函数类型的一部分，参见 [#dcl.fct]。
[exit:note]

[para]
[:en]
A [def potential exception] of a given context is either a type that might be
thrown as an exception or a pseudo-type, denoted by ["any], that represents the
situation where an exception of an arbitrary type might be thrown.
[:zh_CN]
给定语境的[def 潜在异常]，要么是可能作为异常抛出的类型，要么是表示为“any”的，
用来代表可能抛出任意类型的异常的情况的伪类型。

[:en]
A subexpression [`e1] of an expression [`e] is an [def immediate subexpression]
if there is no subexpression [`e2] of [`e] such that [`e1] is a subexpression of
[`e2].
[:zh_CN]
如果对于表达式 [`e] 的子表达式 [`e1]，不存在 [`e] 的子表达式 [`e2] 使得 [`e1] 是
[`e2] 的子表达式，则 [`e1] 是 [`e] 的[def 直接子表达式]。

[para]
[:en]
The [def set of potential exceptions of a function, function pointer, or member
function pointer] [`f] is defined as follows:
[:zh_CN]
[def 函数、函数指针或成员函数指针 [`f] 的潜在异常集合[%函数、函数指针或成员函数
指针的潜在异常集合]]定义如下：

[list]
[item]
[:en]
If the exception specification of [`f] is the set of all types, the set consists
of the pseudo-type ["any].
[:zh_CN]
如果 [`f] 的异常说明是全部类型的集合，则该集合包含伪类型“any”。

[item]
[:en]
Otherwise, the set consists of every type in the exception specification of
[`f].
[:zh_CN]
否则，该集合由 [`f] 的异常说明中的所有类型构成。
[list:end]

[para]
[:en]
The [def set of potential exceptions of an expression] [`e] is empty
if [`e] is a core constant expression ([#expr.const]).
[:zh_CN]
[def 表达式 [`e] 的潜在异常集合[%表达式的潜在异常集合]]，当 [`e] 是核心常量表达
式（[#expr.const]）时为空。

[:en]
Otherwise, it is the union of the sets of potential exceptions of the immediate
subexpressions of [`e], including default argument expressions used in a
function call, combined with a set [$S] defined by the form of [`e], as follows:
[:zh_CN]
否则，它是 [`e] 的直接子表达式（其中包括用在函数调用中的默认实参表达式）的潜在
异常集合的并集，再与一个根据 [`e] 的形式所定义（如下）的集合 [$S] 合并的结果：

[list]
[item]
[:en]
If [`e] is a function call ([#expr.call]):
[:zh_CN]
如果 [`e] 是函数调用（[#expr.call]）：

[list]
[item]
[:en]
If its [~postfix-expression] is a (possibly parenthesized) [~id-expression]
([#expr.prim.general]), class member access ([#expr.ref]), or pointer-to-member
operation ([#expr.mptr.oper]) whose [~cast-expression] is an [~id-expression],
[$S] is the set of potential exceptions of the entity selected by the contained
[~id-expression] (after overload resolution, if applicable).
[:zh_CN]
若其[~后缀表达式]是（可能带有括号的）[~标识表达式]（[#expr.prim.general]），
类成员访问（[#expr.ref]），或者其[~强制转换表达式]是[~标识表达式]的成员指针操作
（[#expr.mptr.oper]），则 [$S] 为由所包含的[~标识表达式]所选择的实体（如果适用则
于重载决议之后）的潜在异常集合。

[item]
[:en]
Otherwise, [$S] contains the pseudo-type ["any].
[:zh_CN]
否则，[$S] 包含伪类型“any”。
[list:end]

[item]
[:en]
If [`e] implicitly invokes a function (such as an overloaded operator, an
allocation function in a [~new-expression], or a destructor if [`e] is a
full-expression ([#intro.execution])), [$S] is the set of potential exceptions
of the function.
[:zh_CN]
如果 [`e] 隐式调用了函数（比如重载运算符，[~new-表达式]中的分配函数，或者当 [`e]
是全表达式时的析构函数（[#intro.execution]）），则 [$S] 为该函数的潜在异常集合。

[item]
[:en]
if [`e] is a [~throw-expression] ([#expr.throw]), [$S] consists of the type of
the exception object that would be initialized by the operand, if present, or
the pseudo-type ["any] otherwise.
[:zh_CN]
如果 [`e] 是 [~throw-表达式]（[#expr.throw]），则 [$S] 由（当存在时）其操作数所
初始化的异常对象的类型构成，否则由伪类型“any”构成。

[item]
[:en]
if [`e] is a [`dynamic_cast] expression that casts to a reference type and
requires a run-time check ([#expr.dynamic.cast]), [$S] consists of the type
[`std::bad_cast].
[:zh_CN]
如果 [`e] 是转换为引用类型并需要运行时检查的 [`dynamic_cast] 表达式
（[#expr.dynamic.cast]），则 [$S] 由 [`std::bad_cast] 构成。

[item]
[:en]
if [`e] is a [`typeid] expression applied to a glvalue expression whose type is
a polymorphic class type ([#expr.typeid]), [$S] consists of the type
[`std::bad_typeid].
[:zh_CN]
如果 [`e] 是施加于多态类类型的泛左值表达式的 [`typeid] 表达式（[#expr.typeid]）
，则 [$S] 由 [`std::bad_typeid] 构成。

[item]
[:en]
if [`e] is a [~new-expression] with a non-constant [~expression] in the
[~noptr-new-declarator] ([#expr.new]), [$S] consists of the type
[`std::bad_array_new_length].
[:zh_CN]
如果 [`e] 是在[~非指针-new-声明符]中带有非常量[~表达式]的 [~new-表达式]
（[#expr.new]），则 [$S] 由 [`std::bad_array_new_length] 构成。
[list:end]

[enter:example]
[:en]
Given the following declarations
[:zh_CN]
跟定下列声明式

[codeblock]
  void f() throw(int); 
  void g();  
  struct A { A(); };
  struct B { B() noexcept; };
  struct D() { D() throw (double); };
[codeblock:end]

[:en@~]
the set of potential exceptions for some sample expressions is:
[:zh_CN@~]
则一些示例表达式的潜在异常集合为：

[list]
[item]
[:en@~] for [`f()], the set consists of [`int];
[:zh_CN@~] 对于 [`f()]，集合由 [`int] 构成；
[item]
[:en@~] for [`g()], the set consists of ["any];
[:zh_CN@~] 对于 [`g()]，集合由“any”构成；
[item]
[:en@~] for [`new A], the set consists of ["any];
[:zh_CN@~] 对于 [`new A]，集合由“any”构成；
[item]
[:en@~] for [`B()], the set is empty;
[:zh_CN@~] 对于 [`B()]，集合为空；
[item]
[:en@~] for [`new D], the set consists of ["any] and [`double].
[:zh_CN@~] 对于 [`new D]，集合由“any”和 [`double] 构成；
[list:end]
[exit:example]

[para]
[:en]
Given a member function [`f] of some class [`X], where [`f] is an inheriting
constructor ([#class.inhctor]) or an implicitly-declared special member
function, the [def set of potential exceptions of the implicitly-declared member
function] [`f] consists of all the members from the following sets:
[:zh_CN]
给定某个类 [`X] 的成员函数 [`f]，其中 [`f] 是继承构造函数（[#class.inhctor]）或
隐式声明的特殊成员函数，[def 隐式声明的成员函数 [`f] 的潜在异常集合 [%隐式声明的
成员函数的潜在异常集合]]由下列集合的所有成员构成：

[list]
[item]
[:en]
if [`f] is a constructor,
[:zh_CN]
如果 [`f] 是构造函数，则有

[list]
[item]
[:en]
the sets of potential exceptions of the constructor invocations
[:zh_CN]
对

[list]
[item]
[:en@~] for [`X][=']s non-variant non-static data members,
[:zh_CN@~] [`X] 的非可变非静态数据成员，
[item]
[:en@~] for [`X][=']s direct base classes, and
[:zh_CN@~] [`X] 的直接基类，以及
[item]
[:en@~] if [`X] is non-abstract ([#class.abstract]), for [`X][=']s virtual base
classes,
[:zh_CN@~] 当 [`X] 非抽象（[#class.abstract]）时，[`X] 的虚基类
[list:end]

[:en@~]
(including default argument expressions used in such invocations) as selected
by overload resolution for the implicit definition of [`f] ([#class.ctor]).
[:zh_CN@~]
由重载决议为 [`f] 的隐式定义（[#class.ctor]）所选择的构造函数的调用（包括这些
调用中使用的默认实参表达式）的潜在异常集合。

[enter:note]
[:en]
Even though destructors for fully-constructed subobjects are invoked when an
exception is thrown during the execution of a constructor ([#except.ctor]),
their exception specifications do not contribute to the exception specification
of the constructor, because an exception thrown from such a destructor could
never escape the constructor ([#except.throw], [#except.terminate]).
[:zh_CN]
虽然完全构造的子对象的析构函数在构造函数的执行中抛出异常时也会被调用
（[#except.ctor]），它们的异常说明并不会对构造函数的异常说明有贡献，这是因为从
这种析构函数抛出的异常不可能逃脱构造函数（[#except.throw]，[#except.terminate]）
。
[exit:note]

[item]
[:en]
the sets of potential exceptions of the initialization of non-static data
members from [~brace-or-equal-initializer]s that are not ignored
([#class.base.init]);
[:zh_CN]
非静态数据成员以未被忽略的[~花括号或等号初始化式]所进行的初始化
（[#class.base.init]）的潜在异常集合。
[list:end]

[item]
[:en]
if [`f] is an assignment operator, the sets of potential exceptions of the
assignment operator invocations for [`X][=']s non-variant non-static data
members and for [`X][=']s direct base classes (including default argument
expressions used in such invocations), as selected by overload resolution for
the implicit definition of [`f] ([#class.copy]);
[:zh_CN]
如果 [`f] 是赋值运算符，则有对 [`X] 的非可变非静态数据成员以及 [`X] 的直接基类
由重载决议为 [`f] 的隐式定义（[#class.copy]）所选择的赋值运算符的调用（包括这些
调用中使用的默认实参表达式）的潜在异常集合。

[item]
[:en]
if [`f] is a destructor, the sets of potential exceptions of the destructor
invocations for [`X][=']s non-variant non-static data members and for [`X][=']s
virtual and direct base classes.
[:zh_CN]
如果 [`f] 是析构函数，则有对 [`X] 的非可变非静态数据成员以及 [`X] 的虚基类和直接
基类的析构函数的调用的潜在异常集合。
[list:end]

[para]
[:en]
An inheriting constructor ([#class.inhctor]) and an implicitly-declared special
member function (Clause [#special]) are considered to have an implicit exception
specification, as follows, where [$S] is the set of potential exceptions of the
implicitly-declared member function:
[:zh_CN]
继承构造函数（[#class.inhctor]）和隐式声明的特殊成员函数（第 [#special] 条），被
当作带有如下的隐含的异常说明，其中 [$S] 为隐式声明的成员函数的潜在异常集合：

[list]
[item]
[:en@~] if [$S] contains the pseudo-type ["any], the implicit exception
specification is the set of all types;
[:zh_CN@~] 若 [$S] 包含伪类型“any”，则隐含的异常说明是所有类型的集合；
[item]
[:en@~] otherwise, the implicit exception specification contains all the types
in [$S].
[:zh_CN@~] 否则，隐含的异常说明包含 [$S] 中的所有类型。
[list:end]

[enter:note]
[:en]
An instantiation of an inheriting constructor template has an implied exception
specification as if it were a non-template inheriting constructor.
[:zh_CN]
继承构造函数模板的实例化，如同它是非模板的继承构造函数一样带有隐含的异常说明。
[exit:note]

[enter:example]
[codeblock]
struct A {
  A(int = (A(5), 0)) noexcept;
  A(const A&) throw();
  A(A&&) throw();
  ~A() throw(X);
};
struct B {
  B() throw();
  B(const B&) = default; // [:en] exception specification contains no types
                         // [|:zh_CN] 异常说明不包含任何类型
  B(B&&, int = (throw Y(), 0)) noexcept;
  ~B() throw(Y);
};
int n = 7;
struct D : public A, public B {
    int * p = new (std::nothrow) int[n];
    // [:en] exception specification of [`D::D()] contains [`X] and [`std::bad_array_new_length]
    // [|:zh_CN] [`D::D()] 的异常说明包含 [`X] 和 [`std::bad_array_new_length]
    // [:en] exception specification of [`D::D(const D&)] contains no types
    // [|:zh_CN] [`D::D(const D&)] 的异常说明不包含任何类型
    // [:en] exception specification of [`D::D(D&&)] contains [`Y]
    // [|:zh_CN] [`D::D(D&&)] 的异常说明包含 [`Y]
    // [:en] exception specification of [`D::~D()] contains [`X] and [`Y]
    // [|:zh_CN] [`D::~D()] 的异常说明包含 [`X] 和 [`Y]
};
[codeblock:end]

[:en]
Furthermore, if [`A::~A()] or [`B::~B()] were virtual, [`D::~D()] would not be
as restrictive as that of [`A::~A], and the program would be ill-formed since a
function that overrides a virtual function from a base class shall have an
[~exception-specification] at least as restrictive as that in the base class.
[:zh_CN]
此外，如果 [`A::~A()] 或者 [`B::~B()] 是虚函数，则 [`D::~D()] 不能与 [`A::~A]
同样受限，而由于覆盖了基类中的虚函数的函数应当带有至少与基类中同样受限的[~异常
说明]，该程序将是非良构的。
[exit:example]

[para]
[:en]
A deallocation function ([#basic.stc.dynamic.deallocation]) with no explicit
[~exception-specification] has an exception specification that is the empty set.
[:zh_CN]
不带有显式[~异常说明]的回收函数（[#basic.stc.dynamic.deallocation]）被当作具有
空集的异常说明。

[para]
[:en]
An [~exception-specification] is considered to be [+needed] when:
[:zh_CN]
以下情况下，认为[+需要]一个[~异常说明]：

[list]
[item]
[:en] in an expression, the function is the unique lookup result or the selected
member of a set of overloaded functions ([#basic.lookup], [#over.match],
[#over.over]);
[:zh_CN] 在表达式中，该函数是唯一查找结果，或是重载函数集合中所选择的成员
（[#basic.lookup]，[#over.match]，[#over.over]）；

[item]
[:en] the function is odr-used ([#basic.def.odr]) or, if it appears in an
unevaluated operand, would be odr-used if the expression were
potentially-evaluated;
[:zh_CN] 该函数被 ODR-式使用（[#basic.def.odr]），或若它出现于免求值操作数中，当
该表达式被潜在求值时将被 ODR-式使用；

[item]
[:en] the [~exception-specification] is compared to that of another declaration
(e.g., an explicit specialization or an overriding virtual function);
[:zh_CN] 将其[~异常说明]与另一个声明式进行比较（例如显式特化式或覆盖虚函数）；

[item]
[:en] the function is defined; or
[:zh_CN] 该函数被定义；或者

[item]
[:en] the [~exception-specification] is needed for a defaulted special member
function that calls the function.
[:zh_CN] 其[~异常说明]被调用了该函数的预置特殊成员函数所需要。

[enter:note]
[:en]
A defaulted declaration does not require the [~exception-specification] of a
base member function to be evaluated until the implicit
[~exception-specification] of the derived function is needed, but an explicit
[~exception-specification] needs the implicit [~exception-specification] to
compare against.
[:zh_CN]
预置的声明式并不需要基类成员函数的[~异常说明]被求值，直到派生函数的隐含[~异常
说明]被需要之时，但显式[~异常说明]需要隐含的[~异常说明]以进行比较。
[exit:note]
[list:end]

[:en]
The [~exception-specification] of a defaulted special member function is
evaluated as described above only when needed; similarly, the
[~exception-specification] of a specialization of a function template or member
function of a class template is instantiated only when needed.
[:zh_CN]
预置特殊成员函数的[~异常说明]仅在需要时才根据上文进行求值；相似地，函数模板或
类模板的成员函数特例的[~异常说明]仅在需要时才被实例化。

[para]
[:en]
In a [~dynamic-exception-specification], a [~type-id] followed by an ellipsis is
a pack expansion ([#temp.variadic]).
[:zh_CN]
在[~动态异常说明]中，[~类型标识]后面跟着省略号是包组展开式（[#temp.variadic]）。

[para]
[enter:note]
[:en]
The use of [~dynamic-exception-specification]s is deprecated (see Annex
[#depr]).
[:zh_CN]
使用[~动态异常说明]是被摒弃的（参见附录 [#depr]）。
[exit:note]

[%:end#exception.specification]
