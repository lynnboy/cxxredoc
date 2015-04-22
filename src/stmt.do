[section#stmt.do
    [:en] The [`do] statement
]

[:en]
[%statement[![`do]]]

[para]
[:en]
The expression is contextually converted to [`bool] (Clause [#conv]); if that
conversion is ill-formed, the program is ill-formed.

[para]
[:en]
In the [`do] statement the substatement is executed repeatedly until the value
of the expression becomes [`false].

[:en]
The test takes place after each execution of the statement.
