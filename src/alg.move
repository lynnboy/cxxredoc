[section#alg.move
    [:en] Move
    [:zh_CN] 移动
]

[%@library move]
[codeblock:declaration]
template<class InputIterator, class OutputIterator>
  OutputIterator move(InputIterator first, InputIterator last,
                      OutputIterator result);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Moves elements in the range [=range[first,last)] into the range
[=range[result,result + (last - first))] starting from [`first] and proceeding
to [`last].
[:zh_CN] 将范围 [=range[first,last)] 中的元素移动到范围 [=range[result,result +
(last - first))] 中，开始于 [`first] 并进行到 [`last]。

[:en] For each non-negative integer [`n < (last-first)], performs
[`*(result + n) = std::move(*(first + n))].
[:zh_CN] 对于每个非负整数 [`n < (last-first)]，实施
[`*(result + n) = std::move(*(first + n))]。

[para:returns]
[:en] [`result + (last - first)].
[:zh_CN] [`result + (last - first)]。

[para:requires]
[:en] [`result] shall not be in the range [=range[first,last)].
[:zh_CN] [`result] 不能处于范围 [=range[first,last)] 之中。

[para:complexity]
[:en] Exactly [`last - first] move assignments.
[:zh_CN] 恰好进行 [`last - first] 次移动赋值。
[exit:description]

[%@library move_backward]
[codeblock:declaration]
template<class BidirectionalIterator1, class BidirectionalIterator2>
  BidirectionalIterator2
    move_backward(BidirectionalIterator1 first,
                  BidirectionalIterator1 last,
                  BidirectionalIterator2 result);
[codeblock:end]


[enter:description]
[para:effects]
[:en] Moves elements in the range [=range[first,last)] into the range
[=range[result - (last-first),result)] starting from [`last - 1] and proceeding
to [`first].
[:zh_CN] 将范围 [=range[first,last)] 中的元素移动到范围 [=range[result -
(last-first),result)] 中，开始于 [`last - 1] 并进行到 [`first]。

[footnote]
[:en] [`move_backward] should be used instead of [`move] when [`last] is in the
range [=range[result - (last - first),result)].
[:zh_CN] 如果 [`last] 处于范围 [=range[result - (last - first),result)] 之中，则
应该用 [`move_backward] 来代替 [`move]。
[footnote:end]

[:en] For each positive integer [`n <= (last - first)], performs
[`*(result - n) = std::move(*(last - n))].
[:zh_CN] 对于每个正整数 [`n <= (last - first)]，实施
[`*(result - n) = std::move(*(last - n))]。

[para:requires]
[:en] [`result] shall not be in the range [=brange(first,last`]].
[:zh_CN] [`result] 不能处于范围 [=brange(first,last`]] 之中。

[para:returns]
[:en] [`result - (last - first)].
[:zh_CN] [`result - (last - first)]。

[para:complexity]
[:en] Exactly [`last - first] assignments.
[:zh_CN] 恰好进行 [`last - first] 次赋值。
[exit:description]
