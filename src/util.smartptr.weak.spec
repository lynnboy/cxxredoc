[section#util.smartptr.weak.spec
    [:en] [`weak_ptr] specialized algorithms
]

[%@library weak_ptr[!swap]]
[%@library swap[!weak_ptr]]
[codeblock:declaration]
template<class T> void swap(weak_ptr<T>& a, weak_ptr<T>& b) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`a.swap(b)].
[exit:description]
