[section#string.io
    [:en] Inserters and extractors
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

[:en] After constructing a [`sentry] object, if the sentry converts to true,
calls [`str.erase()] and then extracts characters from [`is] and appends them
to [`str] as if by calling [`str.append(1,c)].

[:en] If [`is.width()] is greater than zero, the maximum number [`n] of
characters appended is [`is.width()]; otherwise [`n] is [`str.max_size()].

[:en] Characters are extracted and appended until any of the following occurs:

[list]
[item]
[:en] [$n] characters are stored;
[item]
[:en] end-of-file occurs on the input sequence;
[item]
[:en] [`isspace(c,is.getloc())] is true for the next available input character
[$c].
[list:end]

[para]
[:en] After the last character (if any) is extracted, [`is.width(0)] is called
and the [`sentry] object [`k] is destroyed.

[para]
[:en] If the function extracts no characters, it calls
[`is.setstate(ios::failbit)], which may throw [`ios_base::failure]
([#iostate.flags]).

[para:returns]
[:en] [`is]
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

[:en] Forms a character sequence [`seq], initially consisting of the elements
defined by the range [[`str.begin(), str.end()]).

[:en] Determines padding for [`seq] as described in [#ostream.formatted.reqmts].

[:en] Then inserts [`seq] as if by calling [`os.rdbuf()->sputn(seq, n)], where
[`n] is the larger of [`os.width()] and [`str.size()]; then calls
[`os.width(0)].

[para:returns]
[:en] [`os]
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

[:en] After constructing a [`sentry] object, if the sentry converts to true,
calls [`str.erase()] and then extracts characters from [`is] and appends them to
[`str] as if by calling [`str.append(1, c)] until any of the following occurs:

[list]
[item]
[:en] end-of-file occurs on the input sequence (in which case, the [`getline]
function calls [`is.setstate(ios_base::eofbit)]).
[item]
[:en] [`traits::eq(c, delim)] for the next available input character [$c] (in
which case, [$c] is extracted but not appended) ([#iostate.flags])
[item]
[:en] [`str.max_size()] characters are stored (in which case, the function calls
[`is.setstate(ios_base::failbit))] ([#iostate.flags])
[list:end]

[para]
[:en] The conditions are tested in the order shown.

[:en] In any case, after the last character is extracted, the [`sentry] object
[`k] is destroyed.

[para]
[:en] If the function extracts no characters, it calls
[`is.setstate(ios_base::failbit)] which may throw [`ios_base::failure]
([#iostate.flags]).

[para:returns]
[:en] [`is].
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
[:en] [`getline(is,str,is.widen('\textbackslash n'))]
[exit:description]
