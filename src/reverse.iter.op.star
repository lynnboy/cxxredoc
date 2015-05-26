[section#reverse.iter.op.star
    [`operator*]
]

[%@library operator*[!reverse_iterator]]
[codeblock:declaration]
reference operator*() const;
[codeblock:end]

[enter:description]
[para:effects]
[codeblock:notation]
Iterator tmp = current;
return *--tmp;
[codeblock:end]

[exit:description]
