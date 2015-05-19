[section#util.smartptr.shared.mod
    [:en] [`shared_ptr] modifiers
    [:zh_CN] [`shared_ptr] 的改动函数
]

[%@library shared_ptr[!swap]]
[%@library swap[!shared_ptr]]
[codeblock:declaration]
void swap(shared_ptr& r) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Exchanges the contents of [`*this] and [`r].
[:zh_CN] 交换 [`*this] 和 [`r] 的内容。
[exit:description]

[%@library reset[!shared_ptr]]
[%@library shared_ptr[!reset]]
[codeblock:declaration]
void reset() noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`shared_ptr().swap(*this)].
[:zh_CN] 等价于 [`shared_ptr().swap(*this)]。
[exit:description]

[%@library reset[!shared_ptr]]
[%@library shared_ptr[!reset]]
[codeblock:declaration]
template<class Y> void reset(Y* p);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`shared_ptr(p).swap(*this)].
[:zh_CN] 等价于 [`shared_ptr(p).swap(*this)]。
[exit:description]

[%@library reset[!shared_ptr]]
[%@library shared_ptr[!reset]]
[codeblock:declaration]
template<class Y, class D> void reset(Y* p, D d);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`shared_ptr(p, d).swap(*this)].
[:zh_CN] 等价于 [`shared_ptr(p, d).swap(*this)]。
[exit:description]

[%@library reset[!shared_ptr]]
[%@library shared_ptr[!reset]]
[codeblock:declaration]
template<class Y, class D, class A> void reset(Y* p, D d, A a);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`shared_ptr(p, d, a).swap(*this)].
[:zh_CN] 等价于 [`shared_ptr(p, d, a).swap(*this)]。
[exit:description]
