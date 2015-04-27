[section#intseq.make
    [:en] Alias template [`make_integer_sequence]
]

[%@library make_integer_sequence]
[codeblock:declaration]
template<class T, T N>
  using make_integer_sequence = integer_sequence<T, [=Seebelow]>;
[codeblock:end]

[enter:description]
[para]
[:en] If [`N] is negative the program is ill-formed.

[:en] The alias template [`make_integer_sequence] denotes a specialization of
[`integer_sequence] with [`N] template non-type arguments.

[:en] The type [`make_integer_sequence<T, N>] denotes the type
[`integer_sequence<T, 0, 1, ..., N-1>].

[enter:note]
[:en] [`make_integer_sequence<int, 0>] denotes the type [`integer_sequence<int>]
[exit:note]
[exit:description]
