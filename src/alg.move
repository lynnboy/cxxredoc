[section#alg.move
    [:en] Move
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
[=range[result,result + (last - first))] starting from first and proceeding to
last.

[:en] For each non-negative integer [`n < (last-first)], performs
[`*(result + n) = std::move(*(first + n))].

[para:returns]
[:en] [`result + (last - first)].

[para:requires]
[:en] [`result] shall not be in the range [=range[first,last)].

[para:complexity]
[:en] Exactly [`last - first] move assignments.
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
to first.

[footnote]
[:en] [`move_backward] should be used instead of move when last is in the range
[=range[result - (last - first),result)].
[footnote:end]

[:en] For each positive integer [`n <= (last - first)], performs
[`*(result - n) = std::move(*(last - n))].

[para:requires]
[:en] [`result] shall not be in the range [=brange(first,last`]].

[para:returns]
[:en] [`result - (last - first)].

[para:complexity]
[:en] Exactly [`last - first] assignments.
[exit:description]
