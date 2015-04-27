[section#allocator.tag
    [:en] Allocator argument tag
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

[:en]
Specifically, several types (see [`tuple] [#tuple]) have constructors with
[`allocator_arg_t] as the first argument, immediately followed by an argument of
a type that satisfies the [`Allocator] requirements ([#allocator.requirements]).
