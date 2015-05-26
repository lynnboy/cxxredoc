[section#reverse.iter.make
    [:en] Non-member function [`make_reverse_iterator()]
    [:zh_CN] 非成员函数 [`make_reverse_iterator()]
]

[%@library reverse_iterator
    [!make_reverse_iterator
        [:en] non-member function
        [:zh_CN] 非成员函数
    ]]
[%@library make_reverse_iterator]
[codeblock:declaration]
template <class Iterator>
  reverse_iterator<Iterator> make_reverse_iterator(Iterator i);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`reverse_iterator<Iterator>(i)].
[:zh_CN] [`reverse_iterator<Iterator>(i)]。
[exit:description]
