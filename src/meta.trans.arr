[section#meta.trans.arr
    [:en] Array modifications
    [:zh_CN] 数组改造
]

[table:listing#tab:type-traits.array
    [:en] Array modifications
    [:zh_CN] 数组改造
    [columns
        [column@headercenter@code
            [:en] Template
            [:zh_CN] 模板
        ]
        [column@headercenter
            [:en] Comments
            [:zh_CN] 注释
        ]
    ]
    [border:row@both]
]

[|]
template <class T> [br]
struct remove_extent;
[|] [:en] If [`T] names a type ["array of [`U]], the member typedef [`type]
    shall be [`U], otherwise [`T].
    [:zh_CN] 若 [`T] 指名类型“[`U] 的数组”，则成员 typedef [`type] 应当为 [`U]，
    否则为 [`T]。

    [enter:note]
    [:en] For multidimensional arrays, only the first array dimension is
    removed.
    [:zh_CN] 对于多维数组，只移除第一个数组维度。

    [:en] For a type ["array of [`const U]], the resulting type is [`const U].
    [:zh_CN] 对于类型“[`const U] 的数组”，结果的类型为 [`const U]。
    [exit:note]
[|]
template <class T> [br]
struct remove_all_extents;
[|] [:en] If [`T] is ["multi-dimensional array of [`U]], the resulting member
    typedef [`type] is [`U], otherwise [`T].
    [:zh_CN] 若 [`T] 为“[`U] 的多维数组”，结果的成员 typedef [`type] 为 [`U]，
    否则为 [`T]。

[table:end]

[para]
[enter:example]
[codeblock]
// [:en] the following assertions hold:
// [|:zh_CN] 下列断言均成立：
assert((is_same<remove_extent_t<int>, int>::value));
assert((is_same<remove_extent_t<int[2]>, int>::value));
assert((is_same<remove_extent_t<int[2][3]>, int[3]>::value));
assert((is_same<remove_extent_t<int[][3]>, int[3]>::value));
[codeblock:end]
[exit:example]

[para]
[enter:example]
[codeblock]
// [:en] the following assertions hold:
// [|:zh_CN] 下列断言均成立：
assert((is_same<remove_all_extents_t<int>, int>::value));
assert((is_same<remove_all_extents_t<int[2]>, int>::value));
assert((is_same<remove_all_extents_t<int[2][3]>, int>::value));
assert((is_same<remove_all_extents_t<int[][3]>, int>::value));
[codeblock:end]
[exit:example]
