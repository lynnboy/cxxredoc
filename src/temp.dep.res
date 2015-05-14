[section#temp.dep.res
    [:en] Dependent name resolution
    [:zh_CN] 待决名字的决议
]

[para]
[:en]
[%name[!dependent]]
In resolving dependent names, names from the following sources are considered:
[:zh_CN]
[%名字[!待决～]]
当对待决名字进行决议时，要考察以下来源的名字：

[list]
[item]
[:en]
Declarations that are visible at the point of definition of the template.
[:zh_CN]
在模板的定义点处可见的声明式。

[item]
[:en]
Declarations from namespaces associated with the types of the function arguments
both from the instantiation context ([#temp.point]) and from the definition
context.
[:zh_CN]
在实例化语境（[#temp.point]）和定义语境中，与函数实参的类型相关联的命名空间中的
声明式。
[list:end]

[include temp.point]

[include temp.dep.candidate]
