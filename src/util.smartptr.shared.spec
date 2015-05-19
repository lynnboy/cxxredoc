[section#util.smartptr.shared.spec
    [:en] [`shared_ptr] specialized algorithms
    [:zh_CN] [`shared_ptr] 特化的算法
]

[%@library shared_ptr[!swap]]
[%@library swap[!shared_ptr]]
[codeblock:declaration]
template<class T> void swap(shared_ptr<T>& a, shared_ptr<T>& b) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`a.swap(b)].
[:zh_CN] 等价于 [`a.swap(b)]。
[exit:description]
