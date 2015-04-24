[section#over.dcl
    [:en] Declaration matching
]

[:en]
[%overloading[!declaration matching]]
[%scope[!overloading and]]
[%base class[!overloading and]]

[para]
[:en]
Two function declarations of the same name refer to the same function if they
are in the same scope and have equivalent parameter declarations ([#over.load]).

[:en]
A function member of a derived class is [em not] in the same scope as a function
member of the same name in a base class.

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

[%Ben]]
[codeblock]
void h(D* pd) {
  pd->f(1);                     // [:en] error:
                                // [:en@~] [`D::f(const char*)] hides [`B::f(int)]
  pd->B::f(1);                  // OK
  pd->f("Ben");                 // [:en] OK, calls [`D::f]
}
[codeblock:end]
[exit:example]

[para]
[:en]
A locally declared function is not in the same scope as a function in
a containing scope.

[enter:example]
[codeblock]
void f(const char*);
void g() {
  extern void f(int);
  f("asdf");                    // [:en] error: [`f(int)] hides [`f(const char*)]
                                // [:en@~] so there is no [`f(const char*)] in this scope
}

void caller () {
  extern void callee(int, int);
  {
    extern void callee(int);    // [:en] hides [`callee(int, int)]
    callee(88, 99);             // [:en@~] error: only [`callee(int)] in scope
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
