[section#func.wrap.func.mod
    [:en] [`function] modifiers
    [:zh_CN] [`function] 的改动函数
]

[%@library function[!swap]]
[%@library swap[!function]]
[codeblock:declaration]
void swap(function& other) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] interchanges the targets of [`*this] and [`other].
[:zh_CN] 互换 [`*this] 和 [`other] 的目标。
[exit:description]

[%@library function[!assign]]
[%@library assign[!function]]
[codeblock:declaration]
template<class F, class A>
  void assign(F&& f, const A& a);
[codeblock:end]

[enter:description]
[para:effects]
[`function(allocator_arg, a, std::forward<F>(f)).swap(*this)]
[exit:description]
