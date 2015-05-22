[section#string.io
    [:en] Inserters and extractors
    [:zh_CN] 插入器和抽取器
]

[%@library operator>>[!basic_string]]
[%@library basic_string[!operator>>]]
[codeblock:declaration]
template<class charT, class traits, class Allocator>
  basic_istream<charT,traits>&
    operator>>(basic_istream<charT,traits>& is,
               basic_string<charT,traits,Allocator>& str);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Behaves as a formatted input function ([#istream.formatted.reqmts]).
[:zh_CN] 表现为一个格式化输入函数（[#istream.formatted.reqmts]）。

[:en] After constructing a [`sentry] object, if the sentry converts to true,
calls [`str.erase()] and then extracts characters from [`is] and appends them
to [`str] as if by calling [`str.append(1,c)].
[:zh_CN] 构造一个 [`sentry] 对象之后，如果这个哨位转换为真，则调用
[`str.erase()]，随即从 [`is] 中抽取字符，并如同调用 [`str.append(1,c)] 一样将
它们追加到 [`str] 中。

[:en] If [`is.width()] is greater than zero, the maximum number [`n] of
characters appended is [`is.width()]; otherwise [`n] is [`str.max_size()].
[:zh_CN] 如果 [`is.width()] 大于零，则所追加的字符的最大数量 [`n] 为
[`is.width()]；否则 [`n] 为 [`str.max_size()]。

[:en] Characters are extracted and appended until any of the following occurs:
[:zh_CN] 进行字符的抽取和追加，直到发生以下任何情况：

[list]
[item]
[:en] [$n] characters are stored;
[:zh_CN] [$n] 个字符已被存储；
[item]
[:en] end-of-file occurs on the input sequence;
[:zh_CN] 输入序列中出现了文件结束；
[item]
[:en] [`isspace(c,is.getloc())] is true for the next available input character
[$c].
[:zh_CN] 对于下一个可用的输入字符 [$c] 有 [`isspace(c,is.getloc())] 为真。
[list:end]

[para]
[:en] After the last character (if any) is extracted, [`is.width(0)] is called
and the [`sentry] object [`k] is destroyed.
[:zh_CN] 当最后一个字符（如果有）被抽取之后，将调用 [`is.width(0)]，并销毁
[`sentry] 对象 [`k]。

[para]
[:en] If the function extracts no characters, it calls
[`is.setstate(ios::failbit)], which may throw [`ios_base::failure]
([#iostate.flags]).
[:zh_CN] 如果该函数未抽取任何字符，则它调用 [`is.setstate(ios::failbit)]，这可能
会抛出 [`ios_base::failure]（[#iostate.flags]）。

[para:returns]
[`is]
[exit:description]

[%@library operator<<[!basic_string]]
[%@library basic_string[!operator<<]]
[codeblock:declaration]
template<class charT, class traits, class Allocator>
  basic_ostream<charT, traits>&
    operator<<(basic_ostream<charT, traits>& os,
               const basic_string<charT,traits,Allocator>& str);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Behaves as a formatted output function ([#ostream.formatted.reqmts]) of
[`os].
[:zh_CN] 表现为一个 [`os] 的格式化输出函数（[#ostream.formatted.reqmts]）。

[:en] Forms a character sequence [`seq], initially consisting of the elements
defined by the range [[`str.begin(), str.end()]).
[:zh_CN] 构成一个字符序列 [`seq]，它起初由范围 [[`str.begin(), str.end()]) 所
定义的元素构成。

[:en] Determines padding for [`seq] as described in [#ostream.formatted.reqmts].
[:zh_CN] 根据 [#ostream.formatted.reqmts] 所述为 [`seq] 确定填充。

[:en] Then inserts [`seq] as if by calling [`os.rdbuf()->sputn(seq, n)], where
[`n] is the larger of [`os.width()] and [`str.size()]; then calls
[`os.width(0)].
[:zh_CN] 然后如同调用 [`os.rdbuf()->sputn(seq, n)] 那样插入 [`seq]，其中 [`n] 为
[`os.width()] 和 [`str.size()] 中的较大值；然后调用 [`os.width(0)]。

[para:returns]
[`os]
[exit:description]

[%@library getline[!basic_string]]
[%@library basic_string[!getline]]
[codeblock:declaration]
template<class charT, class traits, class Allocator>
  basic_istream<charT,traits>&
    getline(basic_istream<charT,traits>& is,
            basic_string<charT,traits,Allocator>& str,
            charT delim);
template<class charT, class traits, class Allocator>
  basic_istream<charT,traits>&
    getline(basic_istream<charT,traits>&& is,
            basic_string<charT,traits,Allocator>& str,
            charT delim);
[codeblock:end]

[enter:description]
[para:effects]
[:en] Behaves as an unformatted input function ([#istream.unformatted]), except
that it does not affect the value returned by subsequent calls to
[`basic_istream<>::gcount()].
[:zh_CN] 表现为一个非格式化输入函数（[#istream.unformatted]），但它不会对后续的
[`basic_istream<>::gcount()] 调用的返回值产生影响。

[:en] After constructing a [`sentry] object, if the sentry converts to true,
calls [`str.erase()] and then extracts characters from [`is] and appends them to
[`str] as if by calling [`str.append(1, c)] until any of the following occurs:
[:zh_CN] 构造一个 [`sentry] 对象之后，如果这个哨位转换为真，则调用
[`str.erase()]，随即从 [`is] 中抽取字符，并如同调用 [`str.append(1, c)] 一样将
它们追加到 [`str] 中，直到发生以下任何情况：

[list]
[item]
[:en] end-of-file occurs on the input sequence (in which case, the [`getline]
function calls [`is.setstate(ios_base::eofbit)]).
[:zh_CN] 输入序列中出现了文件结束（这种情况下，[`getline] 函数将调用
[`is.setstate(ios_base::eofbit)]）。
[item]
[:en] [`traits::eq(c, delim)] for the next available input character [$c] (in
which case, [$c] is extracted but not appended) ([#iostate.flags])
[:zh_CN] 对于下一个可用的输入字符 [$c] 有 [`traits::eq(c, delim)]（这种情况下，
[$c] 已被抽取但并未进行追加）（[#iostate.flags]）
[item]
[:en] [`str.max_size()] characters are stored (in which case, the function calls
[`is.setstate(ios_base::failbit)]) ([#iostate.flags])
[:zh_CN] [`str.max_size()] 个字符已被存储（这种情况下，函数将调用
[`is.setstate(ios_base::failbit)]）（[#iostate.flags]）
[list:end]

[para]
[:en] The conditions are tested in the order shown.
[:zh_CN] 这些条件是以所展示的顺序进行测试的。

[:en] In any case, after the last character is extracted, the [`sentry] object
[`k] is destroyed.
[:zh_CN] 在任何情况下，当最后一个字符被抽取之后，将销毁 [`sentry] 对象 [`k]。

[para]
[:en] If the function extracts no characters, it calls
[`is.setstate(ios_base::failbit)] which may throw [`ios_base::failure]
([#iostate.flags]).
[:zh_CN] 如果该函数未抽取任何字符，则它调用 [`is.setstate(ios_base::failbit)]，
这可能会抛出 [`ios_base::failure]（[#iostate.flags]）。

[para:returns]
[:en] [`is].
[:zh_CN] [`is]。
[exit:description]

[%@library getline[!basic_string]]
[%@library basic_string[!getline]]
[codeblock:declaration]
template<class charT, class traits, class Allocator>
  basic_istream<charT,traits>&
    getline(basic_istream<charT,traits>& is,
            basic_string<charT,traits,Allocator>& str);
template<class charT, class traits, class Allocator>
  basic_istream<charT,traits>&
    getline(basic_istream<charT,traits>&& is,
            basic_string<charT,traits,Allocator>& str);
[codeblock:end]

[enter:description]
[para:returns]
[`getline(is,str,is.widen('\n'))]
[exit:description]
