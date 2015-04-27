[section#pairs.spec
    [:en] Specialized algorithms
]

[%@library operator==[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator==(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`x.first == y.first && x.second == y.second].
[exit:description]

[%@library operator<[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator<(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`x.first < y.first || (!(y.first < x.first) && x.second < y.second)].
[exit:description]

[%@library operator!=[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator!=(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`!(x == y)]
[exit:description]

[%@library operator>[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator>(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`y < x]
[exit:description]

[%@library operator>=[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator>=(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`!(x < y)]
[exit:description]

[%@library operator<=[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator<=(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`!(y < x)]
[exit:description]

[%@library swap[!pair]]
[codeblock:declaration]
template<class T1, class T2> void swap(pair<T1, T2>& x, pair<T1, T2>& y)
  noexcept(noexcept(x.swap(y)));
[codeblock:end]

[enter:description]
[para:effects]
[:en] [`x.swap(y)]
[exit:description]

[%@library make_pair]
[codeblock:declaration]
template <class T1, class T2>
  constexpr pair<V1, V2> make_pair(T1&& x, T2&& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`pair<V1, V2>(std::forward<T1>(x), std::forward<T2>(y))];

[para:~]
[:en@~] where [`V1] and [`V2] are determined as follows: Let [`Ui] be
[`decay_t<Ti>] for each [`Ti].

[:en]
Then each [`Vi] is [`X&] if [`Ui] equals [`reference_wrapper<X>], otherwise
[`Vi] is [`Ui].

[para]
[enter:example]
[:en]
In place of:

[codeblock]
  return pair<int, double>(5, 3.1415926);   // [:en] explicit types
[codeblock:end]

[:en@~]
a [=Cpp] program may contain:

[codeblock]
  return make_pair(5, 3.1415926);           // [:en] types are deduced
[codeblock:end]
[exit:example]
[exit:description]
