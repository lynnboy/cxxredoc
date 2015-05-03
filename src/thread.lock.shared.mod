[section#thread.lock.shared.mod
    [:en] [`shared_lock] modifiers
]

[%@library shared_lock[!swap]]
[%@library swap[!shared_lock]]
[codeblock:declaration]
void swap(shared_lock& sl) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Swaps the data members of [`*this] and [`sl].
[exit:description]

[%@library shared_lock[!release]]
[%@library release[!shared_lock]]
[codeblock:declaration]
mutex_type* release() noexcept;
[codeblock:end]

[enter:description]
[para:returns]
[:en] The previous value of [`pm].

[para:postconditions]
[:en] [`pm == nullptr] and [`owns == false].
[exit:description]

[%@library shared_lock[!swap]]
[%@library swap[!shared_lock]]
[codeblock:declaration]
template <class Mutex>
  void swap(shared_lock<Mutex>& x, shared_lock<Mutex>& y) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] [`x.swap(y)].
[exit:description]
