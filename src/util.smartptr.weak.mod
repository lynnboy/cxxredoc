[section#util.smartptr.weak.mod
    [:en] [`weak_ptr] modifiers
]

[%@library weak_ptr[!swap]]
[%@library swap[!weak_ptr]]
[codeblock:declaration]
void swap(weak_ptr& r) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Exchanges the contents of [`*this] and [`r].
[exit:description]

[%@library weak_ptr[!reset]]
[%@library reset[!weak_ptr]]
[codeblock:declaration]
void reset() noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`weak_ptr().swap(*this)].
[exit:description]
