[section#move.iter.op.star
    [:en] [`move_iterator::operator*]
]

[%@library operator*[!move_iterator]]
[%@library move_iterator[!operator*]]
[codeblock:declaration]
reference operator*() const;
[codeblock:end]

[enter:description]
[para:returns]
[:en] [`static_cast<reference>(*current)].
[exit:description]
