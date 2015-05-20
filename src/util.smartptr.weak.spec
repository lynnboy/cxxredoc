[section#util.smartptr.weak.spec
    [:en] [`weak_ptr] specialized algorithms
    [:zh_CN] [`weak_ptr] 的特化算法
]

[%@library weak_ptr[!swap]]
[%@library swap[!weak_ptr]]
[codeblock:declaration]
template<class T> void swap(weak_ptr<T>& a, weak_ptr<T>& b) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`a.swap(b)].
[:zh_CN] 等价于 [`a.swap(b)]。
[exit:description]
