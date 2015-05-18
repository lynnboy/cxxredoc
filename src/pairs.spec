[section#pairs.spec
    [:en] Specialized algorithms
    [:zh_CN] 特化的算法
]

[%@library operator==[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator==(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`x.first == y.first && x.second == y.second].
[:zh_CN] [`x.first == y.first && x.second == y.second]。
[exit:description]

[%@library operator<[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator<(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`x.first < y.first || (!(y.first < x.first) && x.second < y.second)].
[:zh_CN] [`x.first < y.first || (!(y.first < x.first) && x.second < y.second)]。
[exit:description]

[%@library operator!=[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator!=(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[`!(x == y)]
[exit:description]

[%@library operator>[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator>(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[`y < x]
[exit:description]

[%@library operator>=[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator>=(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[`!(x < y)]
[exit:description]

[%@library operator<=[!pair]]
[codeblock:declaration]
template <class T1, class T2>
  constexpr bool operator<=(const pair<T1, T2>& x, const pair<T1, T2>& y);
[codeblock:end]

[enter:description]
[para:returns]
[`!(y < x)]
[exit:description]

[%@library swap[!pair]]
[codeblock:declaration]
template<class T1, class T2> void swap(pair<T1, T2>& x, pair<T1, T2>& y)
  noexcept(noexcept(x.swap(y)));
[codeblock:end]

[enter:description]
[para:effects]
[`x.swap(y)]
[exit:description]

[%@library make_pair]
[codeblock:declaration]
template <class T1, class T2>
  constexpr pair<V1, V2> make_pair(T1&& x, T2&& y);
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`pair<V1, V2>(std::forward<T1>(x), std::forward<T2>(y))];
[:zh_CN] [`pair<V1, V2>(std::forward<T1>(x), std::forward<T2>(y))]；

[para:~]
[:en@~] where [`V1] and [`V2] are determined as follows:
[:zh_CN@~] 其中的 [`V1] 和 [`V2] 以如下方式确定：

[:en] Let [`Ui] be [`decay_t<Ti>] for each [`Ti].
[:zh_CN] 对于每个 [`Ti]，令 [`Ui] 为 [`decay_t<Ti>]。

[:en]
Then each [`Vi] is [`X&] if [`Ui] equals [`reference_wrapper<X>], otherwise
[`Vi] is [`Ui].
[:zh_CN]
若 [`Ui] 等同于 [`reference_wrapper<X>] 则 [`Vi] 为 [`X&]，否则 [`Vi] 为 [`Ui]。

[para]
[enter:example]
[:en]
In place of:
[:zh_CN]
当使用

[codeblock]
  return pair<int, double>(5, 3.1415926);   // [:en] explicit types
                                            // [|:zh_CN] 明确的类型
[codeblock:end]

[:en@~]
a [=Cpp] program may contain:
[:zh_CN@~]
时，[=Cpp] 程序可以代之以

[codeblock]
  return make_pair(5, 3.1415926);           // [:en] types are deduced
                                            // [|:zh_CN] 类型被推断
[codeblock:end]
[exit:example]
[exit:description]
