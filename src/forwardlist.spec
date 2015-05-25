[section#forwardlist.spec
    [:en] [`forward_list] specialized algorithms
    [:zh_CN] [`forward_list] 的特化算法
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
[`x.swap(y)]
[exit:description]
