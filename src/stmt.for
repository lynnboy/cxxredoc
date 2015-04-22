[section#stmt.for
    [:en] The [`for] statement
]

[%  [:en] statement[![`for]]
    [:zh_CN] ]

[para]
[:en]
The [`for] statement

[syntax:explanation]
[`for] [`(] [~for-init-statement] [~:opt condition] [`;] [~:opt expression] [`)] [~statement]
[syntax:end]

[:en@~]
is equivalent to

[codeblock:notation]
{
    [~for-init-statement]
    while ( [~condition] ) {
        [~statement]
        [~expression] ;
    }
}
[codeblock:end]

[:en]
except that names declared in the [~for-init-statement] are in the same
declarative region as those declared in the [~condition], and except that a
[%statement[![~continue] in [`for]]] [~continue] in [~statement] (not enclosed
in another iteration statement) will execute [~expression] before re-evaluating
[~condition].

[enter:note]
[:en]
Thus the first statement specifies initialization for the loop; the condition
([#stmt.select]) specifies a test, made before each iteration, such that the
loop is exited when the condition becomes [`false]; the expression often
specifies incrementing that is done after each iteration.
[exit:note]

[para]
[:en]
Either or both of the condition and the expression can be omitted.

[:en]
A missing [~condition] makes the implied [`while] clause equivalent to
[`while(true)].

[para]
[:en]
[%statement[!declaration in [`for]]]
[%[`for][!scope of declaration in]]
If the [~for-init-statement] is a declaration, the scope of the name(s) declared
extends to the end of the [`for] statement.

[enter:example]
[codeblock]
int i = 42;
int a[10];

for (int i = 0; i < 10; i++)
  a[i] = i;

int j = i;          // [`j = 42]
[codeblock:end]
[exit:example]
