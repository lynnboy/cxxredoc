[section#over.inc
    [:en] Increment and decrement
]

[:en]
[%increment operator[!overloaded][see overloading[!increment operator]]]
[%decrement operator[!overloaded][see overloading[!decrement operator]]]
[%prefix [`++] and [`--][!overloading]]
[%postfix [`++] and [`--][!overloading]]

[para]
[:en]
The user-defined function called [`operator++] implements the prefix and postfix
[`++] operator.

[:en]
If this function is a non-static member function with no parameters, or a
non-member function with one parameter, it defines the prefix increment operator
[`++] for objects of that type.

[:en]
If the function is a non-static member function with one parameter (which shall
be of type [`int]) or a non-member function with two parameters (the second of
which shall be of type [`int]), it defines the postfix increment operator [`++]
for objects of that type.

[:en]
When the postfix increment is called as a result of using the [`++] operator,
the [`int] argument will have value zero.

[footnote]
[:en]
Calling [`operator++] explicitly, as in expressions like [`a.operator++(2)], has
no special properties:

[:en]
The argument to [`operator++] is [`2].
[footnote:end]

[enter:example]
[codeblock]
struct X {
  X&   operator++();            // [:en] prefix [`++a]
  X    operator++(int);         // [:en] postfix [`a++]
};

struct Y { };
Y&   operator++(Y&);            // [:en] prefix [`++b]
Y    operator++(Y&, int);       // [:en] postfix [`b++]

void f(X a, Y b) {
  ++a;                          // [`a.operator++();]
  a++;                          // [`a.operator++(0);]
  ++b;                          // [`operator++(b);]
  b++;                          // [`operator++(b, 0);]

  a.operator++();               // [:en] explicit call: like [`++a;]
  a.operator++(0);              // [:en] explicit call: like [`a++;]
  operator++(b);                // [:en] explicit call: like [`++b;]
  operator++(b, 0);             // [:en] explicit call: like [`b++;]
}
[codeblock:end]
[exit:example]

[para]
[:en]
The prefix and postfix decrement operators [`--] are handled analogously.
