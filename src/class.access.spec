[section#class.access.spec
    [:en] Access specifiers
]

[%  [:en] access specifier]

[para]
[:en]
Member declarations can be labeled by an [~access-specifier] (Clause
[#class.derived]):

[syntax:explanation]
[~access-specifier] [`:] [~:opt member-specification]
[syntax:end]

[:en]
An [~access-specifier] specifies the access rules for members following it until
the end of the class or until another [~access-specifier] is encountered.

[enter:example]
[codeblock]
class X {
  int a;            // [:en] [`X::a] is private by default: [`class] used
public:
  int b;            // [:en] [`X::b] is public
  int c;            // [:en] [`X::c] is public
};
[codeblock:end]
[exit:example]

[para]
[:en]
Any number of access specifiers is allowed and no particular order is required.

[enter:example]
[codeblock]
struct S {
  int a;            // [:en] [`S::a] is public by default: [`struct] used
protected:
  int b;            // [:en] [`S::b] is protected
private:
  int c;            // [:en] [`S::c] is private
public:
  int d;            // [:en] [`S::d] is public
};
[codeblock:end]
[exit:example]

[para]
[enter:note]
[:en]
The effect of access control on the order of allocation of data members is
described in [#class.mem].
[exit:note]

[para]
[:en]
When a member is redeclared within its class definition, the access specified at
its redeclaration shall be the same as at its initial declaration.

[enter:example]
[codeblock]
struct S {
  class A;
  enum E : int;
private:
  class A { };        // [:en] error: cannot change access
  enum E: int { e0 }; // [:en] error: cannot change access
};
[codeblock:end]
[exit:example]

[para]
[enter:note]
[:en]
In a derived class, the lookup of a base class name will find the
injected-class-name instead of the name of the base class in the scope in which
it was declared.

[:en]
The injected-class-name might be less accessible than the name of the base class
in the scope in which it was declared.
[exit:note]

[para:~]
[enter:example]
[codeblock]
class A { };
class B : private A { };
class C : public B {
  A* p;             // [:en] error: injected-class-name [`A] is inaccessible
  ::A* q;           // OK
};
[codeblock:end]
[exit:example]
