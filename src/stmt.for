[section#stmt.for
    [:en] The [`for] statement
    [:zh_CN] [`for] 语句
]

[%  [:en] statement[![`for]]
    [:zh_CN] 语句[![`for]] ]

[para]
[:en]
The [`for] statement
[:zh_CN]
[`for] 语句

[syntax:explanation]
[`for] [`(] [~for-init-statement] [~:opt condition] [`;] [~:opt expression] [`)] [~statement]
[syntax:end]

[:en@~]
is equivalent to
[:zh_CN@~]
等价于

[codeblock:notation]
{
    [~for-init-statement]
    while ( [~condition] ) {
        [~statement]
        [~expression] ;
    }
}
[codeblock:end]

[:en@~]
except that names declared in the [~for-init-statement] are in the same
declarative region as those declared in the [~condition], and except that a
[%statement[![`continue] in [`for]]] [`continue] in [~statement] (not enclosed
in another iteration statement) will execute [~expression] before re-evaluating
[~condition].
[:zh_CN@~]
不同之处在于 [~for-初始化语句]中所声明的名字，与在[~条件]中所声明的名字具有相同
的声明区，另外，语句中（未被其他重复语句围绕）的
[%语句[![`for]～中的[`continue]]] [`continue]，将于再次求值条件之前执行[~表达式]
。

[enter:note]
[:en]
Thus the first statement specifies initialization for the loop; the condition
([#stmt.select]) specifies a test, made before each iteration, such that the
loop is exited when the condition becomes [`false]; the expression often
specifies incrementing that is done after each iteration.
[:zh_CN]
故第一个语句指定了循环的初始化；条件（[#stmt.select]）指定了每次重复之前的测试，
使得当条件变为 [`false] 时退出循环；其表达式则通常指定了在每次重复后进行的增量。
[exit:note]

[para]
[:en]
Either or both of the condition and the expression can be omitted.
[:zh_CN]
条件和表达式中的任意一个或二者都可省略。

[:en]
A missing [~condition] makes the implied [`while] clause equivalent to
[`while(true)].
[:zh_CN]
当缺少[~条件]时，其隐含的 [`while] 子句就等价于 [`while(true)]。

[para]
[:en]
[%statement[!declaration in [`for]]]
[%[`for][!scope of declaration in]]
If the [~for-init-statement] is a declaration, the scope of the name(s) declared
extends to the end of the [`for] statement.
[:zh_CN]
[%语句[![`for]～中的声明式]]
[%[`for][!～中的声明式的作用域]]
若 [~for-初始化语句]是声明式，则其所声明的名字的作用域延续到该 [`for] 语句的末尾
。

[enter:example]
[codeblock]
int i = 42;
int a[10];

for (int i = 0; i < 10; i++)
  a[i] = i;

int j = i;          // [`j = 42]
[codeblock:end]
[exit:example]
