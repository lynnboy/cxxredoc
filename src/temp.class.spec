[section#temp.class.spec
    [:en] Class template partial specializations
    [:zh_CN] 类模板部分特化
]

[para]
[:en]
[%specialization[!class template partial]]
[%template[!primary]]
A [+primary] class template declaration is one in which the class template name
is an identifier.
[:zh_CN]
[%特化[!类模板部分～]]
[%模板[!主～]]
[+主]类模板声明式是其类模板名为一个标识符的声明式。

[:en]
A template declaration in which the class template name is a
[~simple-template-id] is a [+partial specialization] of the class template named
in the [~simple-template-id].
[:zh_CN]
类模板名为一个[~简单模板标识]的模板声明式，是由其[~简单模板标识]中所提名的类模板
的[+部分特化式]。

[:en]
A partial specialization of a class template provides an alternative definition
of the template that is used instead of the primary definition when the
arguments in a specialization match those given in the partial specialization
([#temp.class.spec.match]).
[:zh_CN]
类模板的部分特化式提供了该模板的替换定义式，当某个特例中的实参与该部分特化式中所
给定的相匹配（[#temp.class.spec.match]）时，将使用这个定义式代替其主定义式。

[:en]
The primary template shall be declared before any specializations of that
template.
[:zh_CN]
应当在一个模板的任何特化式之前声明其主模板。

[:en]
A partial specialization shall be declared before the first use of a class
template specialization that would make use of the partial specialization as the
result of an implicit or explicit instantiation in every translation unit in
which such a use occurs; no diagnostic is required.
[:zh_CN]
部分特化式应当在首次使用类模板的特例，并由于隐式或显式实例化而使用了该部分特化式
之前，在每个包含这种使用的翻译单元中进行声明；无须诊断。

[para]
[:en]
Each class template partial specialization is a distinct template and
definitions shall be provided for the members of a template partial
specialization ([#temp.class.spec.mfunc]).
[:zh_CN]
每个类模板部分特化都是独立的模板，并且应该为模板部分特化的成员提供定义式
（[#temp.class.spec.mfunc]）。

[para]
[enter:example]
[codeblock]
template<class T1, class T2, int I> class A             { };    // #1
template<class T, int I>            class A<T, T*, I>   { };    // #2
template<class T1, class T2, int I> class A<T1*, T2, I> { };    // #3
template<class T>                   class A<int, T*, 5> { };    // #4
template<class T1, class T2, int I> class A<T1, T2*, I> { };    // #5
[codeblock:end]

[:en]
The first declaration declares the primary (unspecialized) class template.
[:zh_CN]
第一个声明式声明了主（未特化的）类模板。

[:en]
The second and subsequent declarations declare partial specializations of
the primary template.
[:zh_CN]
第二个和随后的声明式声明了主模板的部分特化。
[exit:example]

[para]
[:en]
The template parameters are specified in the angle bracket enclosed list that
immediately follows the keyword [`template].
[:zh_CN]
紧跟在 [`template] 关键字后面的角括号包围的列表中指定其模板形参。

[:en]
For partial specializations, the template argument list is explicitly written
immediately following the class template name.
[:zh_CN]
对于部分特化式，紧跟在类模板名后面明确写出其模板实参列表。

[:en]
For primary templates, this list is implicitly described by the template
parameter list.
[:zh_CN]
对于主模板，这个列表由其模板形参列表所隐含地说明。

[:en]
Specifically, the order of the template arguments is the sequence in which they
appear in the template parameter list.
[:zh_CN]
具体来说，模板实参的顺序就是它们出现在模板形参列表中的顺序。

[enter:example]
[:en]
the template argument list for the primary template in the example above is
[`<T1, T2, I>].
[:zh_CN]
上例中的主模板的模板实参列表是 [`<T1, T2, I>]。
[exit:example]

[enter:note]
[:en]
The template argument list shall not be specified in the primary template
declaration.
[:zh_CN]
在主模板声明式中不能指定模板实参列表。

[:en]
For example,
[:zh_CN]
例如，

[codeblock]
template<class T1, class T2, int I> class A<T1, T2, I>  { };    // [:en] error
                                                                // [|:zh_CN] 错误
[codeblock:end]
[exit:note]

[para]
[:en]
A class template partial specialization may be declared or redeclared in any
namespace scope in which the corresponding primary template may be defined
([#namespace.memdef] and [#temp.mem]).
[:zh_CN]
类模板部分特化式可以在任何能够对其对应的主模板进行定义的命名空间作用域中进行声明
或重复声明（[#namespace.memdef] 和 [#temp.mem]）。

[enter:example]
[codeblock]
template<class T> struct A {
  struct C {
    template<class T2> struct B { };
  };
};

// [:en] partial specialization of [`A<T>::C::B<T2>]
// [|:zh_CN] [`A<T>::C::B<T2>] 的部分特化式
template<class T> template<class T2>
  struct A<T>::C::B<T2*> { };

A<short>::C::B<int*> absip;     // [:en] uses partial specialization
                                // [|:zh_CN] 使用了部分特化式
[codeblock:end]
[exit:example]

[para]
[:en]
Partial specialization declarations themselves are not found by name lookup.
[:zh_CN]
部分特化声明式自身不能被名字查找所找到。

[:en]
Rather, when the primary template name is used, any previously-declared partial
specializations of the primary template are also considered.
[:zh_CN]
确切地说，当使用某个主模板名时，这个主模板的之前声明过的所有部分特化式都会被考察
。

[:en]
One consequence is that a [~using-declaration] which refers to a class template
does not restrict the set of partial specializations which may be found through
the [~using-declaration].
[:zh_CN]
其结论之一是，指代某个类模板的 [~using-声明式]并不会限制可以通过该 [~using-声明
式]找到的部分特化式的集合。

[enter:example]
[codeblock]
namespace N {
  template<class T1, class T2> class A { };         // [:en] primary template
                                                    // [|:zh_CN] 主模板
}

using N::A;                             // [:en] refers to the primary template
                                        // [|:zh_CN] 指代主模板

namespace N {
  template<class T> class A<T, T*> { }; // [:en] partial specialization
                                        // [|:zh_CN] 部分特化式
}

A<int,int*> a;                  // [:en] uses the partial specialization, which is found through
                                // [|:zh_CN] 使用了部分特化式，它是通过指代
                                // [:en@~] the using declaration which refers to the primary template
                                // [|:zh_CN@~] 主模板的 using 声明式找到的
[codeblock:end]
[exit:example]

[para]
[:en]
A non-type argument is non-specialized if it is the name of a non-type
parameter.
[:zh_CN]
如果一个非类型实参是某个非类型形参的名字，则它是未特化的。

[:en]
All other non-type arguments are specialized.
[:zh_CN]
所有其他的非类型实参都是特化的。

[para]
[:en]
Within the argument list of a class template partial specialization, the
following restrictions apply:
[:zh_CN]
下列限制适用于类模板部分特化式的实参列表：

[list]
[item]
[:en]
A partially specialized non-type argument expression shall not involve
a template parameter of the partial specialization except when the argument
expression is a simple [~identifier].
[:zh_CN]
被部分特化的非类型实参表达式中不能涉及该部分特化式的某个模板形参，除非实参表达式
是单纯的[~标识符]。

[enter:example]
[codeblock]
template <int I, int J> struct A {};
template <int I> struct A<I+5, I*2> {}; // [:en] error
                                        // [|:zh_CN] 错误

template <int I, int J> struct B {};
template <int I> struct B<I, I> {};     // OK
[codeblock:end]
[exit:example]

[item]
[:en]
The type of a template parameter corresponding to a specialized non-type
argument shall not be dependent on a parameter of the specialization.
[:zh_CN]
对应于某个被特化的非类型实参的模板形参的类型，不能依存于该特化式中的某个形参。

[enter:example]
[codeblock]
template <class T, T t> struct C {};
template <class T> struct C<T, 1>;                  // [:en] error
                                                    // [|:zh_CN] 错误

template< int X, int (*array_ptr)[X] > class A {};
int array[5];
template< int X > class A<X,&array> { };            // [:en] error
                                                    // [|:zh_CN] 错误
[codeblock:end]
[exit:example]

[item]
[:en]
The argument list of the specialization shall not be identical to the implicit
argument list of the primary template.
[:zh_CN]
特化式的实参列表不能与主模板的隐含的实参列表相同。

[item]
[:en]
The specialization shall be more specialized than the primary template
([#temp.class.order]).
[:zh_CN]
特化式应当比主模板更加特定（[#temp.class.order]）。

[item]
[:en]
The template parameter list of a specialization shall not contain default
template argument values.
[:zh_CN]
特化式的模板形参列表中不能包含默认模板实参值。

[footnote]
[:en]
There is no way in which they could be used.
[:zh_CN]
不存在使用它们的方式。
[footnote:end]

[item]
[:en]
An argument shall not contain an unexpanded parameter pack.
[:zh_CN]
实参不能包含未展开的形参包组。

[:en]
If an argument is a pack expansion ([#temp.variadic]), it shall be the last
argument in the template argument list.
[:zh_CN]
若某个实参是包组展开式（[#temp.variadic]），则它应当为模板实参列表中的最后一个
实参。
[list:end]

[include temp.class.spec.match]

[include temp.class.order]

[include temp.class.spec.mfunc]
