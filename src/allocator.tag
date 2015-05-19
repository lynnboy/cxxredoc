[section#allocator.tag
    [:en] Allocator argument tag
    [:zh_CN] 分配器实参的标签
]

[%@library allocator_arg_t]
[%@library allocator_arg]
[codeblock:declaration]
namespace std {
  struct allocator_arg_t { };
  constexpr allocator_arg_t allocator_arg{};
}
[codeblock:end]

[para]
[:en]
The [`allocator_arg_t] struct is an empty structure type used as a unique type
to disambiguate constructor and function overloading.
[:zh_CN]
[`allocator_arg_t] 结构是一个空结构类型，用于在构造函数和函数的重载中进行区分时
作为一种唯一类型。

[:en]
Specifically, several types (see [`tuple] [#tuple]) have constructors with
[`allocator_arg_t] as the first argument, immediately followed by an argument of
a type that satisfies the [`Allocator] requirements ([#allocator.requirements]).
[:zh_CN]
确切地说，一些类型（参见 [`tuple] [#tuple]）的一些构造函数以 [`allocator_arg_t]
为其第一个实参，紧随其后是符合 [`Allocator] 规定（[#allocator.requirements]）的
类型的一个实参。
