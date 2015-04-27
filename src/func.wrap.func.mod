[section#func.wrap.func.mod
    [:en] [`function] modifiers
]

[%@library function[!swap]]
[%@library swap[!function]]
[codeblock:declaration]
void swap(function& other) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] interchanges the targets of [`*this] and [`other].
[exit:description]

[%@library function[!assign]]
[%@library assign[!function]]
[codeblock:declaration]
template<class F, class A>
  void assign(F&& f, const A& a);
[codeblock:end]

[enter:description]
[para:effects]
[:en] [`function(allocator_arg, a, std::forward<F>(f)).swap(*this)]
[exit:description]
