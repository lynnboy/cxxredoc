[section#meta.trans.arr
    [:en] Array modifications
]

[table:listing#tab:type-traits.array
    [:en] Array modifications
    [columns
        [column@headercenter@code
            [:en] Template
        ]
        [column@headercenter
            [:en] Comments
        ]
    ]
    [border:row@both]
]

[|]
template <class T> [br]
struct remove_extent;
[|] [:en] If [`T] names a type ["array of [`U]], the member typedef [`type]
    shall be [`U], otherwise [`T].
    [enter:note]
    [:en] For multidimensional arrays, only the first array dimension is
    removed.
    [:en] For a type ["array of [`const U]], the resulting type is [`const U].
    [exit:note]
[|]
template <class T> [br]
struct remove_all_extents;
[|] [:en] If [`T] is ["multi-dimensional array of [`U]], the resulting member
    typedef [`type] is [`U], otherwise [`T].

[table:end]

[para]
[enter:example]
[codeblock]
// [:en] the following assertions hold:
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
assert((is_same<remove_all_extents_t<int>, int>::value));
assert((is_same<remove_all_extents_t<int[2]>, int>::value));
assert((is_same<remove_all_extents_t<int[2][3]>, int>::value));
assert((is_same<remove_all_extents_t<int[][3]>, int>::value));
[codeblock:end]
[exit:example]
