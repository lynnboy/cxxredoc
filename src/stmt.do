[section#stmt.do
    [:en] The [`do] statement
    [:zh_CN] [`do] 语句
]

[:en]
[%statement[![`do]]]
[:zh_CN]
[%语句[![`do]]]

[para]
[:en]
The expression is contextually converted to [`bool] (Clause [#conv]); if that
conversion is ill-formed, the program is ill-formed.
[:zh_CN]
其表达式被按语境转换为 [`bool]（第 [#conv] 条）；若这个转换是非良构的，则程序
非良构。

[para]
[:en]
In the [`do] statement the substatement is executed repeatedly until the value
of the expression becomes [`false].
[:zh_CN]
[`do] 语句中，子语句被重复执行，直到其条件的值（[#stmt.select]）变为 [`false]。

[:en]
The test takes place after each execution of the statement.
[:zh_CN]
其测试发生于每次其语句的执行之后。
