[section#temp.res
    [:en] Name resolution
    [:zh_CN] 名字决议
]

[para]
[:en]
[%overloading[!resolution[!template name]]]
[%lookup[!template name]]
Three kinds of names can be used within a template definition:
[:zh_CN]
[%重载[!～决议[!模板名字]]]
[%查找[!模板名字～]]
模板定义式中可以使用三种名字：

[list]
[item]
[:en]
The name of the template itself, and names declared within the template itself.
[:zh_CN]
该模板自身的名字，以及在该模板自身之中声明的名字。

[item]
[:en]
Names dependent on a [~template-parameter] ([#temp.dep]).
[:zh_CN]
依存于某个[~模板形参]（[#temp.dep]）的名字。

[item]
[:en]
Names from scopes which are visible within the template definition.
[:zh_CN]
该模板定义式可见的作用域中的名字。
[list:end]

[para]
[:en]
A name used in a template declaration or definition and that is dependent on a
[~template-parameter] is assumed not to name a type unless the applicable name
lookup finds a type name or the name is qualified by the keyword [`typename].
[:zh_CN]
在模板声明式或定义式中所使用的依存于某个[~模板形参]的名字，除非被适当的名字查找
找到为某个类型名或者是被 [`typename] 关键字所限定，否则假定它并不指名一个类型。

[enter:example]
[codeblock]
// [:en] no [`B] declared here
// [|:zh_CN] 此处没有声明 [`B]

class X;

template<class T> class Y {
  class Z;                      // [:en] forward declaration of member class
                                // [|:zh_CN] 成员类的前向声明式

  void f() {
    X* a1;                      // [:en] declare pointer to [`X]
                                // [|:zh_CN] 声明 [`X] 的指针
    T* a2;                      // [:en] declare pointer to [`T]
                                // [|:zh_CN] 声明 [`T] 的指针
    Y* a3;                      // [:en] declare pointer to [`Y<T>]
                                // [|:zh_CN] 声明 [`Y<T>] 的指针
    Z* a4;                      // [:en] declare pointer to [`Z]
                                // [|:zh_CN] 声明 [`Z] 的指针
    typedef typename T::A TA;
    TA* a5;                     // [:en] declare pointer to [`T][=']s [`A]
                                // [|:zh_CN] 声明 [`T] 中的 [`A] 的指针
    typename T::A* a6;          // [:en] declare pointer to [`T][=']s [`A]
                                // [|:zh_CN] 声明 [`T] 中的 [`A] 的指针
    T::A* a7;                   // [:en] [`T::A] is not a type name:
                                // [|:zh_CN] [`T::A] 不是类型名：
                                // [:en@~] multiply [`T::A] by [`a7]; ill-formed,
                                // [|:zh_CN@~] 对 [`T::A] 乘以 [`a7]；非良构
                                // [:en@~] no visible declaration of [`a7]
                                // [|:zh_CN@~] 没有可见的 [`a7] 的声明式
    B* a8;                      // [:en] [`B] is not a type name:
                                // [|:zh_CN] [`B] 不是类型名：
                                // [:en@~] multiply [`B] by [`a8]; ill-formed,
                                // [|:zh_CN@~] 对 [`a8] 乘以 [`a8]；非良构
                                // [:en@~] no visible declarations of [`B] and [`a8]
                                // [|:zh_CN@~] 没有可见的 [`B] 和 [`a8] 的声明式
  }
};
[codeblock:end]
[exit:example]

[para]
[:en]
When a [~qualified-id] is intended to refer to a type that is not a member of
the current instantiation ([#temp.dep.type]) and its [~nested-name-specifier]
refers to a dependent type, it shall be prefixed by the keyword [`typename],
forming a [~typename-specifier].
[:zh_CN]
当某个[~限定标识]有意指代某个并非当前实例的成员的类型（[#temp.dep.type]），并且
其[~嵌套名说明符]指代某个待决类型时，它应当带有 [`typename] 关键字前缀，以构成
一个 [~typename-说明符]。

[:en]
If the [~qualified-id] in a [~typename-specifier] does not denote a type, the
program is ill-formed.
[:zh_CN]
若 [~typename-说明符]中的[~限定标识]并不代表某个类型，则程序非良构。

[syntax]
[rule typename-specifier [:zh_CN] typename-说明符 ]
    [| [`typename] nested-name-specifier identifier ]
    [| [`typename] nested-name-specifier [`:opt template] simple-template-id ]
[rule:end]
[syntax:end]

[para]
[:en]
If a specialization of a template is instantiated for a set of
[~template-argument]s such that the [~qualified-id] prefixed by [`typename]
does not denote a type, the specialization is ill-formed.
[:zh_CN]
如果某个模板的特化式针对一组[~模板实参]进行实例化，使得带有 [`typename] 前缀的
[~限定标识]并不代表某个类型，则该特化式非良构。

[:en]
The usual qualified name lookup ([#basic.lookup.qual]) is used to find the
[~qualified-id] even in the presence of [`typename].
[:zh_CN]
即使带有 [`typename]，也应当使用常规的限定名查找（[#basic.lookup.qual]）来对其
[~限定标识]进行查找。

[enter:example]
[codeblock]
struct A {
  struct X { };
  int X;
};
struct B {
  struct X { };
};
template<class T> void f(T t) {
  typename T::X x;
}
void foo() {
  A a;
  B b;
  f(b);             // [:en] OK: [`T::X] refers to [`B::X]
                    // [|:zh_CN] OK：[`T::X] 指代 [`B::X]
  f(a);             // [:en] error: [`T::X] refers to the data member [`A::X] not the struct [`A::X]
                    // [|:zh_CN] 错误：[`T::X] 指代数据成员 [`A::X] 而不是 [`A::X] 结构
}
[codeblock:end]
[exit:example]

[para]
[:en]
A qualified name used as the name in a [~mem-initializer-id], a
[~base-specifier], or an [~elaborated-type-specifier] is implicitly assumed to
name a type, without the use of the [`typename] keyword.
[:zh_CN]
不使用 [`typename] 关键字时，用作[~成员初始化式标识]，[~基说明符]，或者[~详细
类型说明符]中的名字的限定名隐含地假定为指名某个类型。

[:en]
In a [~nested-name-specifier] that immediately contains a
[~nested-name-specifier] that depends on a template parameter, the [~identifier]
or [~simple-template-id] is implicitly assumed to name a type, without the use
of the [`typename] keyword.
[:zh_CN]
不使用 [`typename] 关键字时，在一个[~嵌套名说明符]中，其中直接包含一个依存于某个
模板形参的[~嵌套名说明符]，其[~标识符]或[~简单模板标识]隐含地假定为指名某个类型
。

[enter:note]
[:en]
The [`typename] keyword is not permitted by the syntax of these constructs.
[:zh_CN]
这些构造的语法不允许有 [`typename] 关键字。
[exit:note]

[para]
[:en]
If, for a given set of template arguments, a specialization of a template is
instantiated that refers to a [~qualified-id] that denotes a type, and the
[~qualified-id] refers to a member of an unknown specialization, the
[~qualified-id] shall either be prefixed by [`typename] or shall be used in a
context in which it implicitly names a type as described above.
[:zh_CN]
对于给定的一组模板实参，如果所实例化的模板特例涉指某个代表类型的[~限定标识]，
并且该[~限定标识]代表某个未知特例的成员，则该[~限定标识]要么应当带有 [`typename]
前缀，要么应当在如上所述的隐式指名类型的语境中使用。

[enter:example]
[codeblock]
template <class T> void f(int i) {
  T::x * i;         // [:en] [`T::x] must not be a type
                    // [|:zh_CN] [`T::x] 不能为类型
}

struct Foo {
  typedef int x;
};

struct Bar {
  static int const x = 5;
};

int main() {
  f<Bar>(1);        // OK
  f<Foo>(1);        // [:en] error: [`Foo::x] is a type
                    // [|:zh_CN] 错误：[`Foo:x] 是类型
}
[codeblock:end]
[exit:example]

[para]
[:en]
Within the definition of a class template or within the definition of a member
of a class template following the [~declarator-id], the keyword [`typename]
is not required when referring to the name of a previously declared member of
the class template that declares a type.
[:zh_CN]
在类模板的定义式中，或者类模板的成员的定义式中，其[~声明符标识]之后，当指代该
类模板的某个之前已经声明为类型的成员的名字时不需要 [`typename] 关键字。

[enter:note]
[:en]
such names can be found using unqualified name lookup ([#basic.lookup.unqual]),
class member lookup ([#class.qual]) into the current instantiation
([#temp.dep.type]), or class member access expression lookup
([#basic.lookup.classref]) when the type of the object expression is the current
instantiation ([#temp.dep.expr]).
[:zh_CN]
可以通过未限定名查找（[#basic.lookup.unqual]），在当前实例（[#temp.dep.type]）中
进行类成员查找（[#class.qual]），或当对象表达式的类型为当前实例
（[#temp.dep.expr]）时进行类成员访问表达式的查找（[#basic.lookup.classref]）来对
这种名字进行查找。

[exit:note]

[enter:example]
[codeblock]
template<class T> struct A {
  typedef int B;
  B b;              // [:en] OK, no [`typename] required
                    // [|:zh_CN] OK，不需要 [`typename]
};
[codeblock:end]
[exit:example]

[para]
[:en]
[%checking[!syntax]]
[%checking[!point of error]]
Knowing which names are type names allows the syntax of every template to be
checked.
[:zh_CN]
[%检查[!语法～]]
[%检查[!错误～点]]
知道哪个名字是类型名，就允许对每个模板定义式的语法进行检查。

[:en]
No diagnostic shall be issued for a template for which a valid specialization
can be generated.
[:zh_CN]
不应该对可以生成有效特例的模板给出诊断消息。

[:en]
If no valid specialization can be generated for a template, and that template is
not instantiated, the template is ill-formed, no diagnostic required.
[:zh_CN]
若无法对某个模板生成有效特例，而该模板未被实例化，则该模板非良构，无须诊断。

[:en]
If every valid specialization of a variadic template requires an empty template
parameter pack, the template is ill-formed, no diagnostic required.
[:zh_CN]
如果一个变参模板的每个有效特例均需要一个空的模板形参包组，则该模板非良构，无须
诊断。

[:en]
If a hypothetical instantiation of a template immediately following its
definition would be ill-formed due to a construct that does not depend on a
template parameter, the program is ill-formed; no diagnostic is required.
[:zh_CN]
如果一个假定的紧跟模板的定义式之后的实例化，将因为并不依存于模板形参的语言构造而
非良构，则程序非良构；无须诊断。

[:en]
If the interpretation of such a construct in the hypothetical instantiation is
different from the interpretation of the corresponding construct in any actual
instantiation of the template, the program is ill-formed; no diagnostic is
required.
[:zh_CN]
如果对假定的实例化中的这个语言构造的解释，与该模板的任何真实实例化中的对应语言
构造的解释不同，则程序非良构；无须诊断。

[enter:note]
[:en]
This can happen in situations including the following:
[:zh_CN]
这可能发生于以下情况：

[list]
[item]
[:en] a type used in a non-dependent name is incomplete at the point at which a
template is defined but is complete at the point at which an instantiation is
performed, or
[:zh_CN] 非待决名中所使用的类型在模板的定义点是不完整的，但在进行实例化之处是
完整的，或者

[item]
[:en] an instantiation uses a default argument or default template argument
that had not been defined at the point at which the template was defined, or
[:zh_CN] 某个实例所使用的默认实参或默认模板实参，在该模板进行定义时还未定义，
或者

[item]
[:en] constant expression evaluation ([#expr.const]) within the template
instantiation uses
[:zh_CN] 模板实例中的常量表达式求值（[#expr.const]），使用了

[list]
[item]
[:en@~] the value of a [`const] object of integral or unscoped enumeration type
or
[:zh_CN@~] 整型或无作用域枚举类型的 [`const] 对象的值，或者
[item]
[:en@~] the value of a [`constexpr] object or
[:zh_CN@~] [`constexpr] 对象的值，或者
[item]
[:en@~] the value of a reference or
[:zh_CN@~] 引用的值，或者
[item]
[:en@~] the definition of a [`constexpr] function,
[:zh_CN@~] [`constexpr] 函数的定义式，
[list:end]

[:en@~]
and that entity was not defined when the template was defined, or
[:zh_CN@~]
而该实体在模板进行定义时还未定义，或者

[item]
[:en] a class template specialization or variable template specialization that
is specified by a non-dependent [~simple-template-id] is used by the template,
and either it is instantiated from a partial specialization that was not defined
when the template was defined or it names an explicit specialization that was
not declared when the template was defined.
[:zh_CN] 该模板中使用的非待决[~简单模板标识]指定了类模板特例或变量模板特例，而它
是以在该模板进行定义时还未定义的部分特化式实例化的，或者它指名了该模板进行定义时
还未声明的显式特化式。
[list:end]
[exit:note]

[enter:note]
[:en]
If a template is instantiated, errors will be diagnosed according
to the other rules in this Standard.
[:zh_CN]
若某模板被实例化，则要根据本国际标准中的其他规则对错误进行诊断。

[:en]
Exactly when these errors are diagnosed is a quality of implementation issue.
[:zh_CN]
这些错误要在何时进行诊断是实现的质量问题。
[exit:note]

[enter:example]
[codeblock]
int j;
template<class T> class X {
  void f(T t, int i, char* p) {
    t = i;          // [:en] diagnosed if [`X::f] is instantiated
                    // [|:zh_CN] 若 [`X::f] 被实例化则需诊断
                    // [:en@~] and the assignment to [`t] is an error
                    // [|:zh_CN@~] 且对 [`t] 的赋值是错误的
    p = i;          // [:en] may be diagnosed even if [`X::f] is
                    // [|:zh_CN] 即使 [`X::f] 未被实例化
                    // [:en@~] not instantiated
                    // [|:zh_CN@~] 也需要进行诊断
    p = j;          // [:en] may be diagnosed even if [`X::f] is
                    // [|:zh_CN] 即使 [`X::f] 未被实例化
                    // [:en@~] not instantiated
                    // [|:zh_CN@~] 也需要进行诊断
  }
  void g(T t) {
    +;              // [:en] may be diagnosed even if [`X::g] is
                    // [|:zh_CN] 即使 [`X::g] 未被实例化
                    // [:en@~] not instantiated
                    // [|:zh_CN@~] 也需要进行诊断
  }
};

template<class... T> struct A {
  void operator++(int, T... t);                 // [:en] error: too many parameters
                                                // [|:zh_CN] 错误：过多的形参
};
template<class... T> union X : T... { };        // [:en] error: union with base class
                                                // [|:zh_CN] 错误：带有基类的联合
template<class... T> struct A : T...,  T... { };// [:en] error: duplicate base class
                                                // [|:zh_CN] 错误：重复的基类
[codeblock:end]
[exit:example]

[para]
[:en]
When looking for the declaration of a name used in a template definition, the
usual lookup rules ([#basic.lookup.unqual], [#basic.lookup.argdep]) are used for
non-dependent names.
[:zh_CN]
当查找模板定义式中所使用的名字的声明式时，使用常规名字查找规则
（[#basic.lookup.unqual]，[#basic.lookup.argdep]）来查找非待决名。

[:en]
The lookup of names dependent on the template parameters is postponed until the
actual template argument is known ([#temp.dep]).
[:zh_CN]
对依存于模板形参的名字的查找被延迟到得知其实际模板实参之时（[#temp.dep]）。

[enter:example]
[codeblock]
#include <iostream>
using namespace std;

template<class T> class Set {
  T* p;
  int cnt;
public:
  Set();
  Set<T>(const Set<T>&);
  void printall() {
    for (int i = 0; i<cnt; i++)
      cout << p[i] << '\n';
  }
};
[codeblock:end]

[:en]
in the example, [`i] is the local variable [`i] declared in [`printall], [`cnt]
is the member [`cnt] declared in [`Set], and [`cout] is the standard output
stream declared in [`iostream].
[:zh_CN]
本例中，[`i] 是在 [`printall] 中声明的局部变量 [`i]，[`cnt] 是在 [`Set] 中声明的
[`cnt] 成员，而 [`cout] 是在 [`iostream] 中声明的标准输出流。

[:en]
However, not every declaration can be found this way; the resolution of some
names must be postponed until the actual [~template-argument]s are known.
[:zh_CN]
然而，并不是每个声明式都可以被这样找到；某些名字的决议必须推迟到得知其实际[~模板
实参]时。

[:en]
For example, even though the name [`operator<<] is known within the definition
of [`printall()] and a declaration of it can be found in [`<iostream>], the
actual declaration of [`operator<<] needed to print [`p[i`]] cannot be known
until it is known what type [`T] is ([#temp.dep]).
[:zh_CN]
例如，即使名字 [`operator<<] 在 [`printall()] 的定义式中已知，并且它的一个声明式
可以在 [`<iostream>] 中找到，这个需要打印 [`p[i`]] 的 [`operator<<] 的实际的
声明式直到得知 [`T] 是什么类型之前仍是未知的（[#temp.dep]）。
[exit:example]

[para]
[:en]
If a name does not depend on a [~template-parameter] (as defined in
[#temp.dep]), a declaration (or set of declarations) for that name shall be in
scope at the point where the name appears in the template definition; the name
is bound to the declaration (or declarations) found at that point and this
binding is not affected by declarations that are visible at the point of
instantiation.
[:zh_CN]
如果一个名字并不依存于某个[~模板形参]（如 [#temp.dep] 中的定义），这个名字的一个
声明式（或声明式集合）应当在模板定义式中出现这个名字之处是处于作用域中的；这个
名字被绑定到该处所找到的声明式（或声明式集合），此绑定不受实例化点可见的声明式的
影响。

[enter:example]
[codeblock]
void f(char);

template<class T> void g(T t) {
  f(1);             // [`f(char)]
  f(T(1));          // [:en] dependent
                    // [|:zh_CN] 待决的
  f(t);             // [:en] dependent
                    // [|:zh_CN] 待决的
  dd++;             // [:en] not dependent
                    // [|:zh_CN] 非待决的
                    // [:en@~] error: declaration for [`dd] not found
                    // [|:zh_CN@~] 错误：未找到 [`dd] 的声明式
}

enum E { e };
void f(E);

double dd;
void h() {
  g(e);             // [:en] will cause one call of [`f(char)] followed
                    // [|:zh_CN] 将会产生一个对 [`f(char)] 的调用
                    // [:en@~] by two calls of [`f(E)]
                    // [|:zh_CN@~] 跟着两个对 [`f(E)] 的调用
  g('a');           // [:en] will cause three calls of [`f(char)]
                    // [|:zh_CN] 将会产生三个对 [`f(char)] 的调用
}
[codeblock:end]
[exit:example]

[para]
[enter:note]
[:en]
For purposes of name lookup, default arguments and [~exception-specification]s
of function templates and default arguments and [~exception-specification]s of
member functions of class templates are considered definitions ([#temp.decls]).
[:zh_CN]
为进行名字查找，函数模板的默认实参和[~异常说明]，以及类模板的成员函数的默认实参
和[~异常说明]被当作是定义式（[#temp.decls]）。
[exit:note]

[include temp.local]

[include temp.dep]

[include temp.nondep]

[include temp.dep.res]

[include temp.inject]
