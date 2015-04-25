[section#temp.dep.res
    [:en] Dependent name resolution
]

[para]
[:en]
[%name[!dependent]]
In resolving dependent names, names from the following sources are considered:

[list]
[item]
[:en]
Declarations that are visible at the point of definition of the template.

[item]
[:en]
Declarations from namespaces associated with the types of the function arguments
both from the instantiation context ([#temp.point]) and from the definition
context.
[list:end]

[include temp.point]

[include temp.dep.candidate]
