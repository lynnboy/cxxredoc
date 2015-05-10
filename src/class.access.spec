[section#class.access.spec
    [:en] Access specifiers
    [:zh_CN] 访问说明符
]

[%  [:en] access specifier
    [:zh_CN] 访问说明符 ]

[para]
[:en]
Member declarations can be labeled by an [~access-specifier] (Clause
[#class.derived]):
[:zh_CN]
可以用[~访问说明符]对成员声明式进行标记（第 [#class.derived] 条）：

[syntax:explanation]
[~access-specifier] [`:] [~:opt member-specification]
[syntax:end]

[:en]
An [~access-specifier] specifies the access rules for members following it until
the end of the class or until another [~access-specifier] is encountered.
[:zh_CN]
[~访问说明符]指定了跟在它后面，直到类的结尾或遇到另一个[~访问说明符]之前的成员的
访问规则。

[enter:example]
[codeblock]
class X {
  int a;            // [:en] [`X::a] is private by default: [`class] used
                    // [|:zh_CN] [`X::a] 默认为私有的：使用了 [`class]
public:
  int b;            // [:en] [`X::b] is public
                    // [|:zh_CN] [`X::b] 是公用的
  int c;            // [:en] [`X::c] is public
                    // [|:zh_CN] [`X::c] 是公用的
};
[codeblock:end]
[exit:example]

[para]
[:en]
Any number of access specifiers is allowed and no particular order is required.
[:zh_CN]
允许任意数量的访问说明符且不需有特定的顺序。

[enter:example]
[codeblock]
struct S {
  int a;            // [:en] [`S::a] is public by default: [`struct] used
                    // [|:zh_CN] [`S::a] 默认为私有的：使用了 [`struct]
protected:
  int b;            // [:en] [`S::b] is protected
                    // [|:zh_CN] [`S::b] 是受保护的
private:
  int c;            // [:en] [`S::c] is private
                    // [|:zh_CN] [`S::c] 是私有的
public:
  int d;            // [:en] [`S::d] is public
                    // [|:zh_CN] [`S::d] 是公用的
};
[codeblock:end]
[exit:example]

[para]
[enter:note]
[:en]
The effect of access control on the order of allocation of data members is
described in [#class.mem].
[:zh_CN]
访问控制对数据成员的分配顺序的影响在 [#class.mem] 中说明。
[exit:note]

[para]
[:en]
When a member is redeclared within its class definition, the access specified at
its redeclaration shall be the same as at its initial declaration.
[:zh_CN]
当某个成员在类定义式中被重复声明时，其重复的声明式中指定的访问应与其首个声明式
相同。

[enter:example]
[codeblock]
struct S {
  class A;
  enum E : int;
private:
  class A { };        // [:en] error: cannot change access
                      // [|:zh_CN] 错误：无法改变其访问
  enum E: int { e0 }; // [:en] error: cannot change access
                      // [|:zh_CN] 错误：无法改变其访问
};
[codeblock:end]
[exit:example]

[para]
[enter:note]
[:en]
In a derived class, the lookup of a base class name will find the
injected-class-name instead of the name of the base class in the scope in which
it was declared.
[:zh_CN]
在派生类中，对基类名的查找将找到注入类名而不是在声明了该基类的作用域中的基类的
名字。

[:en]
The injected-class-name might be less accessible than the name of the base class
in the scope in which it was declared.
[:zh_CN]
该注入类名可能比在声明了该基类的作用域中的基类的名字的可访问性更弱。
[exit:note]

[para:~]
[enter:example]
[codeblock]
class A { };
class B : private A { };
class C : public B {
  A* p;             // [:en] error: injected-class-name [`A] is inaccessible
                    // [|:zh_CN] 错误：注入类名 [`A] 不可访问
  ::A* q;           // OK
};
[codeblock:end]
[exit:example]
