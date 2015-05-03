[section#thread.lock.unique.mod
    [:en] [`unique_lock] modifiers
]

[%@library unique_lock[!swap]]
[%@library swap[!unique_lock]]
[codeblock:declaration]
void swap(unique_lock& u) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] Swaps the data members of [`*this] and [`u].
[exit:description]

[%@library unique_lock[!release]]
[%@library release[!unique_lock]]
[codeblock:declaration]
mutex_type* release() noexcept;
[codeblock:end]

[enter:description]
[para:returns]
[:en] The previous value of [`pm].

[para:postconditions]
[:en] [`pm == 0] and [`owns == false].
[exit:description]

[%@library unique_lock[!swap]]
[%@library swap[!unique_lock]]
[codeblock:declaration]
template <class Mutex>
  void swap(unique_lock<Mutex>& x, unique_lock<Mutex>& y) noexcept;
[codeblock:end]

[enter:description]
[para:effects]
[:en] [`x.swap(y)]
[exit:description]
