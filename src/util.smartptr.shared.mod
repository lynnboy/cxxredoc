[section#util.smartptr.shared.mod
    [:en] [`shared_ptr] modifiers
]

[%@library shared_ptr[!swap]]
[%@library swap[!shared_ptr]]
[codeblock:declaration]
void swap(shared_ptr& r) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Exchanges the contents of [`*this] and [`r].
[exit:description]

[%@library reset[!shared_ptr]]
[%@library shared_ptr[!reset]]
[codeblock:declaration]
void reset() noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`shared_ptr().swap(*this)].
[exit:description]

[%@library reset[!shared_ptr]]
[%@library shared_ptr[!reset]]
[codeblock:declaration]
template<class Y> void reset(Y* p);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`shared_ptr(p).swap(*this)].
[exit:description]

[%@library reset[!shared_ptr]]
[%@library shared_ptr[!reset]]
[codeblock:declaration]
template<class Y, class D> void reset(Y* p, D d);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`shared_ptr(p, d).swap(*this)].
[exit:description]

[%@library reset[!shared_ptr]]
[%@library shared_ptr[!reset]]
[codeblock:declaration]
template<class Y, class D, class A> void reset(Y* p, D d, A a);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`shared_ptr(p, d, a).swap(*this)].
[exit:description]
