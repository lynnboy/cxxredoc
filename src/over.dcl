[section#over.dcl
    [:en] Declaration matching
    [:zh_CN] 声明式的匹配
]

[:en]
[%overloading[!declaration matching]]
[%scope[!overloading and]]
[%base class[!overloading and]]
[:zh_CN]
[%重载[!声明式的匹配]]
[%作用域[!重载与～]]
[%基类[!重载与～]]

[para]
[:en]
Two function declarations of the same name refer to the same function if they
are in the same scope and have equivalent parameter declarations ([#over.load]).
[:zh_CN]
若相同名字的两个函数声明式处于同一个作用域中，并带有等价的形参声明式
（[#over.load]），则它们涉指同一个函数。

[:en]
A function member of a derived class is [em not] in the same scope as a function
member of the same name in a base class.
[:zh_CN]
派生类中的函数成员与基类中相同名字的函数成员[em 并不]处于同一个作用域之中。

[enter:example]
[codeblock]
struct B {
  int f(int);
};

struct D : B {
  int f(const char*);
};
[codeblock:end]

[:en]
[%name hiding[!function]]
[%name hiding[!overloading versus]]
Here [`D::f(const char*)] hides [`B::f(int)] rather than overloading it.
[:zh_CN]
[%名字隐藏[!函数]]
[%名字隐藏[!重载与～]]
此处 [`D::f(const char*)] 隐藏了 [`B::f(int)] 而不是重载它。

[%Ben]
[codeblock]
void h(D* pd) {
  pd->f(1);                     // [:en] error:
                                // [|:zh_CN] 错误：
                                // [:en@~] [`D::f(const char*)] hides [`B::f(int)]
                                // [|:zh_CN@~] [`D::f(const char*)] 隐藏了 [`B::f(int)]
  pd->B::f(1);                  // OK
  pd->f("Ben");                 // [:en] OK, calls [`D::f]
                                // [|:zh_CN] OK，调用了 [`D::f]
}
[codeblock:end]
[exit:example]

[para]
[:en]
A locally declared function is not in the same scope as a function in
a containing scope.
[:zh_CN]
局部声明的函数与包围它的作用域中的函数并不处于同一个作用域之中。

[enter:example]
[codeblock]
void f(const char*);
void g() {
  extern void f(int);
  f("asdf");                    // [:en] error: [`f(int)] hides [`f(const char*)]
                                // [|:zh_CN] 错误：[`f(int)] 隐藏了 [`f(const char*)]
                                // [:en@~] so there is no [`f(const char*)] in this scope
                                // [|:zh_CN@~] 故在此作用域中并没有 [`f(const char*)]
}

void caller () {
  extern void callee(int, int);
  {
    extern void callee(int);    // [:en] hides [`callee(int, int)]
                                // [|:zh_CN] 隐藏了 [`callee(int, int)]
    callee(88, 99);             // [:en@~] error: only [`callee(int)] in scope
                                // [|:zh_CN@~] 错误：作用域中只有 [`callee(int)]
  }
}
[codeblock:end]
[exit:example]

[para]
[:en]
[%access control[!overloading and]]
[%overloading[!access control and]]
Different versions of an overloaded member function can be given different
access rules.
[:zh_CN]
[%访问控制[!重载与～]]
[%重载[!访问控制与～]]
不同版本的重载成员函数可以被赋予不同的访问权。

[enter:example]
[codeblock]
class buffer {
private:
    char* p;
    int size;
protected:
    buffer(int s, char* store) { size = s; p = store; }
public:
    buffer(int s) { p = new char[size = s]; }
};
[codeblock:end]
[exit:example]
