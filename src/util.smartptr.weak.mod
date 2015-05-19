[section#util.smartptr.weak.mod
    [:en] [`weak_ptr] modifiers
    [:zh_CN] [`weak_ptr] 的改动函数
]

[%@library weak_ptr[!swap]]
[%@library swap[!weak_ptr]]
[codeblock:declaration]
void swap(weak_ptr& r) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Exchanges the contents of [`*this] and [`r].
[:zh_CN] 交换 [`*this] 和 [`r] 的内容。
[exit:description]

[%@library weak_ptr[!reset]]
[%@library reset[!weak_ptr]]
[codeblock:declaration]
void reset() noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Equivalent to [`weak_ptr().swap(*this)].
[:zh_CN] 等价于 [`weak_ptr().swap(*this)]。
[exit:description]
