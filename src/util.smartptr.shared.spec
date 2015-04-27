[section#util.smartptr.shared.spec
    [:en] [`shared_ptr] specialized algorithms
]

[%@library shared_ptr[!swap]]
[%@library swap[!shared_ptr]]
[codeblock:declaration]
template<class T> void swap(shared_ptr<T>& a, shared_ptr<T>& b) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`a.swap(b)].
[exit:description]
