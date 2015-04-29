[section#reverse.iter.make
    [:en] Non-member function [`make_reverse_iterator()]
]

[%@library reverse_iterator[!make_reverse_iterator [:en] non-member function]]
[%@library make_reverse_iterator]
[codeblock:declaration]
template <class Iterator>
  reverse_iterator<Iterator> make_reverse_iterator(Iterator i);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`reverse_iterator<Iterator>(i)].
[exit:description]
