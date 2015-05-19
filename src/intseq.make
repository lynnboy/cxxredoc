[section#intseq.make
    [:en] Alias template [`make_integer_sequence]
    [:zh_CN] 别名模板 [`make_integer_sequence]
]

[%@library make_integer_sequence]
[codeblock:declaration]
template<class T, T N>
  using make_integer_sequence = integer_sequence<T, [=Seebelow]>;
[codeblock:end]

[enter:description]
[para]
[:en] If [`N] is negative the program is ill-formed.
[:zh_CN] 若 [`N] 为负数则程序非良构。

[:en] The alias template [`make_integer_sequence] denotes a specialization of
[`integer_sequence] with [`N] template non-type arguments.
[:zh_CN] 别名模板 [`make_integer_sequence] 代表带有 [`N] 个模板非类型实参的
[`integer_sequence] 的特例。

[:en] The type [`make_integer_sequence<T, N>] denotes the type
[`integer_sequence<T, 0, 1, ..., N-1>].
[:zh_CN] 类型 [`make_integer_sequence<T, N>] 代表类型
[`integer_sequence<T, 0, 1, ..., N-1>]。

[enter:note]
[:en] [`make_integer_sequence<int, 0>] denotes the type [`integer_sequence<int>]
[:zh_CN] [`make_integer_sequence<int, 0>] 代表类型 [`integer_sequence<int>]
[exit:note]
[exit:description]
