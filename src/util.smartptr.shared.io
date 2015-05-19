[section#util.smartptr.shared.io
    [:en] [`shared_ptr] I/O
    [:zh_CN] [`shared_ptr] 的 I/O
]

[%@library operator<<[!shared_ptr]]
[%@library shared_ptr[!operator<<]]
[codeblock:declaration]
template<class E, class T, class Y>
  basic_ostream<E, T>& operator<< (basic_ostream<E, T>& os, shared_ptr<Y> const& p);
[codeblock:end]

[enter:description]
[para:effects]
[:en] [`os << p.get();].
[:zh_CN] [`os << p.get();]。

[para:returns]
[:en] [`os].
[:zh_CN] [`os]。
[exit:description]
