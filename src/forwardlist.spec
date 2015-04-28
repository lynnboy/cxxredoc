[section#forwardlist.spec
    [:en] [`forward_list] specialized algorithms
]

[%@library swap[!forward_list]]
[%@library forward_list[!swap]]
[codeblock:declaration]
template <class T, class Allocator>
  void swap(forward_list<T, Allocator>& x, forward_list<T, Allocator>& y)
    noexcept(noexcept(x.swap(y)));
[codeblock:end]

[enter:description]
[para:effects]
[:en] [`x.swap(y)]
[exit:description]
