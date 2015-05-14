[section#temp.expl.spec
    [:en] Explicit specialization
    [:zh_CN] 显式特化
]

[para]
[:en]
[%specialization[!template explicit]]
An explicit specialization of any of the following:
[:zh_CN]
[%特化式[!模板显式～]]
下述任意之一的显式特化式：

[list]
[item]
[:en@~] function template
[:zh_CN@~] 函数模板
[item]
[:en@~] class template
[:zh_CN@~] 类模板
[item]
[:en@~] variable template
[:zh_CN@~] 变量模板
[item]
[:en@~] member function of a class template
[:zh_CN@~] 类模板的成员函数
[item]
[:en@~] static data member of a class template
[:zh_CN@~] 类模板的静态数据成员
[item]
[:en@~] member class of a class template
[:zh_CN@~] 类模板的成员类
[item]
[:en@~] member enumeration of a class template
[:zh_CN@~] 类模板的成员枚举
[item]
[:en@~] member class template of a class or class template
[:zh_CN@~] 类或类模板的成员类模板
[item]
[:en@~] member function template of a class or class template
[:zh_CN@~] 类或类模板的成员函数模板
[list:end]

[:en@~]
can be declared by a declaration introduced by [`template<>]; that is:
[:zh_CN@~]
可以由 [`template<>] 开始的声明式来进行声明；就是：


[%[~explicit-specialization]]
[syntax]
[rule explicit-specialization [:zh_CN] 显式特化式 ]
    [| [`template] [`<] [`>] declaration ]
[rule:end]
[syntax:end]

[enter:example]
[codeblock]
template<class T> class stream;

template<> class stream<char> { /* ... */ };

template<class T> class Array { /* ... */ };
template<class T> void sort(Array<T>& v) { /* ... */ }

template<> void sort<char*>(Array<char*>&) ;
[codeblock:end]

[:en]
Given these declarations, [`stream<char>] will be used as the definition of
streams of [`char]s; other streams will be handled by class template
specializations instantiated from the class template.
[:zh_CN]
给定这些声明式，[`stream<char>] 将被用作 [`char] 流的定义；其他的流则由从类模板
实例化出来的类模板特例来处理。

[:en]
Similarly, [`sort<char*>] will be used as the sort function for arguments of
type [`Array<char*>]; other [`Array] types will be sorted by functions generated
from the template.
[:zh_CN]
相似地，[`sort<char*>] 将被用作实参类型为 [`Array<char*>] 的排序函数；其他
[`Array] 类型则以从模板所生成的函数进行排序。
[exit:example]

[para]
[:en]
An explicit specialization shall be declared in a namespace enclosing the
specialized template.
[:zh_CN]
显式特化式应当在包含被特化的模板的命名空间中进行声明。

[:en]
An explicit specialization whose [~declarator-id] is not qualified shall be
declared in the nearest enclosing namespace of the template, or, if the
namespace is inline ([#namespace.def]), any namespace from its enclosing
namespace set.
[:zh_CN]
[~声明符标识]未被限定的显式特化式应当在其模板的最内层外围命名空间中，或者若该
命名空间为内联的（[#namespace.def]），在其外围命名空间集合中的任意命名空间中进行
声明。

[:en]
Such a declaration may also be a definition.
[:zh_CN]
这个声明式也可以是定义式。

[:en]
If the declaration is not a definition, the specialization may be defined later
([#namespace.memdef]).
[:zh_CN]
若声明式不是定义式，则该特例可以稍后进行定义（[#namespace.memdef]）。

[para]
[:en]
A declaration of a function template, class template, or variable template being
explicitly specialized shall precede the declaration of the explicit
specialization.
[:zh_CN]
被显式特化的函数模板、类模板或变量模板的声明式，应当先于其显式特化式的声明式。

[enter:note]
[:en]
A declaration, but not a definition of the template is required.
[:zh_CN]
所需要的是模板的声明式，而不是定义式。
[exit:note]

[:en]
The definition of a class or class template shall precede the declaration of an
explicit specialization for a member template of the class or class template.
[:zh_CN]
类或类模板的定义式，应当先于这个类或类模板的成员模板的显式特化式的声明式。

[enter:example]
[codeblock]
template<> class X<int> { /* ... */ };          // [:en] error: [`X] not a template
                                                // [|:zh_CN] 错误：[`X] 不是模板

template<class T> class X;

template<> class X<char*> { /* ... */ };        // [:en] OK: [`X] is a template
                                                // [|:zh_CN] OK：[`X] 是模板
[codeblock:end]
[exit:example]

[para]
[:en]
A member function, a member function template, a member class, a member
enumeration, a member class template, a static data member, or a static data
member template of a class template may be explicitly specialized for a class
specialization that is implicitly instantiated; in this case, the definition of
the class template shall precede the explicit specialization for the member of
the class template.
[:zh_CN]
类模板的成员函数、成员函数模板、成员类、成员枚举、成员类模板或静态数据成员，可以
针对被隐式实例化的类的特例来进行显式特化；此种情况下，类模板的定义式应当先于类
模板的成员的显式特化式。

[:en]
If such an explicit specialization for the member of a class template names an
implicitly-declared special member function (Clause [#special]), the program is
ill-formed.
[:zh_CN]
如果这种类模板的成员的显式特化式指名了某个隐式声明的特殊成员函数（第 [#special]
条），则程序是非良构的。

[para]
[:en]
A member of an explicitly specialized class is not implicitly instantiated from
the member declaration of the class template; instead, the member of the class
template specialization shall itself be explicitly defined if its definition is
required.
[:zh_CN]
被显式特化的类的成员并不是从类模板的成员声明进行隐式实例化的；类模板特例的成员
自身，如果需要其定义式的话，应当进行显式定义。

[:en]
In this case, the definition of the class template explicit specialization shall
be in scope at the point at which the member is defined.
[:zh_CN]
这种情况下，在定义该成员之处，类模板显式特化式的定义式应当处于作用域中。

[:en]
The definition of an explicitly specialized class is unrelated to the definition
of a generated specialization.
[:zh_CN]
类的显式特化出来的定义式与生成出来的特例的定义式无关。

[:en]
That is, its members need not have the same names, types, etc. as the members of
a generated specialization.
[:zh_CN]
就是说，其成员无需与生成的特例的成员具有相同的名字、类型等等。

[:en]
Members of an explicitly specialized class template are defined in the same
manner as members of normal classes, and not using the [`template<>] syntax.
[:zh_CN]
显式特化的类模板的成员以与普通类的成员相同的方式进行定义，而不使用 [`template<>]
语法。

[:en]
The same is true when defining a member of an explicitly specialized member
class.
[:zh_CN]
当定义显式特化式的成员类的成员时也是如此。

[:en]
However, [`template<>] is used in defining a member of an explicitly specialized
member class template that is specialized as a class template.
[:zh_CN]
然而，对于被显式特化为类模板的成员类模板，当定义其成员时要使用 [`template<>]。

[enter:example]
[codeblock]
template<class T> struct A {
  struct B { };
  template<class U> struct C { };
};

template<> struct A<int> {
  void f(int);
};

void h() {
  A<int> a;
  a.f(16);          // [:en] [`A<int>::f] must be defined somewhere
                    // [|:zh_CN] [`A<int>::f] 必须在某处进行定义
}

// [:en] [`template<>] not used for a member of an
// [|:zh_CN] 被显式特化的类模板的成员
// [:en@~] explicitly specialized class template
// [|:zh_CN@~] 不需要使用 [`template<>]
void A<int>::f(int) { /* ... */ }

template<> struct A<char>::B {
  void f();
};
// [:en] [`template<>] also not used when defining a member of
// [|:zh_CN] 对被显式特化的成员类的成员进行定义时
// [:en@~] an explicitly specialized member class
// [|:zh_CN@~] 也不需要使用 [`template<>]
void A<char>::B::f() { /* ... */ }

template<> template<class U> struct A<char>::C {
  void f();
};
// [:en] [`template<>] is used when defining a member of an explicitly
// [|:zh_CN] 对于被显式特化为类模板的成员类模板，
// [:en@~] specialized member class template specialized as a class template
// [|:zh_CN@~] 定义其成员时需要使用 [`template<>]
template<>
template<class U> void A<char>::C<U>::f() { /* ... */ }

template<> struct A<short>::B {
  void f();
};
template<> void A<short>::B::f() { /* ... */ }  // [:en] error: [`template<>] not permitted
                                                // [|:zh_CN] 错误：不允许 [`template<>]

template<> template<class U> struct A<short>::C {
  void f();
};
template<class U> void A<short>::C<U>::f() { /* ... */ }  // [:en] error: [`template<>] required
                                                          // [|:zh_CN] 错误：需要 [`template<>]
[codeblock:end]
[exit:example]

[para]
[:en]
If a template, a member template or a member of a class template is explicitly
specialized then that specialization shall be declared before the first use of
that specialization that would cause an implicit instantiation to take place,
in every translation unit in which such a use occurs; no diagnostic is required.
[:zh_CN]
若模板、成员模板或类模板的成员被显式特化，则应当在对该特例的第一次可能导致发生
隐式实例化的使用之前，在每个发生这种使用的翻译单元中声明这个特化；无须诊断。

[:en]
If the program does not provide a definition for an explicit specialization and
either the specialization is used in a way that would cause an implicit
instantiation to take place or the member is a virtual member function,
the program is ill-formed, no diagnostic required.
[:zh_CN]
若程序中未对显式特化式提供定义式，而该特例被以将会导致发生隐式实例化的方式使用，
或者该成员是虚成员函数，则程序是非良构的，无须诊断。

[:en]
An implicit instantiation is never generated for an explicit specialization
that is declared but not defined.
[:zh_CN]
已声明但未定义的显式特化式不会生成隐式实例。

[enter:example]
[codeblock]
class String { };
template<class T> class Array { /* ... */ };
template<class T> void sort(Array<T>& v) { /* ... */ }

void f(Array<String>& v) {
  sort(v);          // [:en] use primary template
                    // [|:zh_CN] 使用主模板
                    // [:en@~] [`sort(Array<T>&)], [`T] is [`String]
                    // [|:zh_CN@~] [`sort(Array<T>&)]，[`T] 为 [`String]
}

template<> void sort<String>(Array<String>& v); // [:en] error: specialization
                                                // [|:zh_CN] 错误：特化式
                                                // [:en@~] after use of primary template
                                                // [|:zh_CN@~] 出现在使用主模板之后
template<> void sort<>(Array<char*>& v);        // [:en] OK: [`sort<char*>] not yet used
                                                // [|:zh_CN] OK：[`sort<char*>] 还未被使用
template<class T> struct A {
  enum E : T;
  enum class S : T;
};
template<> enum A<int>::E : int { eint };         // OK
template<> enum class A<int>::S : int { sint };   // OK
template<class T> enum A<T>::E : T { eT };
template<class T> enum class A<T>::S : T { sT };
template<> enum A<char>::E : char { echar };       // [:en] ill-formed, [`A<char>::E] was instantiated
                                                   // [|:zh_CN] 非良构，当实例化 [`A<char>] 时
                                                   // [:en@~] when [`A<char>] was instantiated
                                                   // [|:zh_CN@~] 即实例化 [`A<char>::E]
template<> enum class A<char>::S : char { schar }; // OK
[codeblock:end]
[exit:example]

[para]
[:en]
The placement of explicit specialization declarations for function templates,
class templates, variable templates, member functions of class templates, static
data members of class templates, member classes of class templates, member
enumerations of class templates, member class templates of class templates,
member function templates of class templates, static data member templates of
class templates, member functions of member templates of class templates, member
functions of member templates of non-template classes, static data member
templates of non-template classes, member function templates of member classes
of class templates, etc., and the placement of partial specialization
declarations of class templates, variable templates, member class templates of
non-template classes, static data member templates of non-template classes,
member class templates of class templates, etc., can affect whether a program is
well-formed according to the relative positioning of the explicit specialization
declarations and their points of instantiation in the translation unit as
specified above and below.
[:zh_CN]
函数模板，类模板，变量模板，类模板的成员函数，类模板的静态数据成员，类模板的成员
类，类模板的成员枚举，类模板的成员类模板，类模板的成员函数模板，类模板的静态数据
成员模板，类模板的成员模板的成员函数，非模板类的成员模板的成员函数，非模板类的
静态数据成员模板，类模板的成员类的成员函数模板，等等，它们的显式特化声明式的出现
位置，以及类模板，变量模板，非模板类的成员类模板，非模板类的静态数据成员模板，
类模板的成员类模板，等等，它们的部分特化声明式的出现位置，根据它们的显式特化
声明式，以及在上文和下文中所指定的它们在翻译单元中的实例化点的相对位置不同，将
能够影响程序是否是良构的。

[:en]
[%immolation[!self]]
When writing a specialization, be careful about its location; or to make it
compile will be such a trial as to kindle its self-immolation.
[:zh_CN]
[%牺牲[!自我～]]
当书写一个特化式时，要当心其位置；否则若试图使其能够编译，则将通向使它自我牺牲
之路。

[para]
[:en]
A template explicit specialization is in the scope of the namespace in which
the template was defined.
[:zh_CN]
模板显式特化式处于定义了该模板的命名空间的作用域中。

[enter:example]
[codeblock]
namespace N {
  template<class T> class X { /* ... */ };
  template<class T> class Y { /* ... */ };

  template<> class X<int> { /* ... */ };        // [:en] OK: specialization
                                                // [|:zh_CN] OK：在相同命名空间
                                                // [:en@~] in same namespace
                                                // [|:zh_CN@~] 中进行特化
  template<> class Y<double>;                   // [:en] forward declare intent to
                                                // [|:zh_CN] 针对 [`double] 的特例
                                                // [:en@~] specialize for [`double]
                                                // [|:zh_CN@~] 的前向声明
}

template<> class N::Y<double> { /* ... */ };    // [:en] OK: specialization
                                                // [|:zh_CN] OK：在外围命名空间
                                                // [:en@~] in enclosing namespace
                                                // [|:zh_CN@~] 中进行特化
template<> class N::Y<short> { /* ... */ };     // [:en] OK: specialization
                                                // [|:zh_CN] OK：在外围命名空间
                                                // [:en@~] in enclosing namespace
                                                // [|:zh_CN@~] 中进行特化
[codeblock:end]
[exit:example]

[para]
[:en]
A [~simple-template-id] that names a class template explicit specialization that
has been declared but not defined can be used exactly like the names of other
incompletely-defined classes ([#basic.types]).
[:zh_CN]
指名了已声明但未定义的类模板显式特化式的[~简单模板标识]，可以与其他未完整定义的
类的名字完全相同的方式被使用（[#basic.types]）。

[enter:example]
[codeblock]
template<class T> class X;      // [:en] [`X] is a class template
                                // [|:zh_CN] [`X] 是类模板
template<> class X<int>;

X<int>* p;                      // [:en] OK: pointer to declared class [`X<int>]
                                // [|:zh_CN] OK：指向已声明的类 [`X<int>] 的指针
X<int> x;                       // [:en] error: object of incomplete class [`X<int>]
                                // [|:zh_CN] 错误：不完整类 [`X<int>] 的对象
[codeblock:end]
[exit:example]

[para]
[:en]
A trailing [~template-argument] can be left unspecified in the [~template-id]
naming an explicit function template specialization provided it can be deduced
from the function argument type.
[:zh_CN]
指名某个显式函数模板特化式的[~模板标识]中，可以不指定其尾部的[~模板实参]，只要它
可以从其函数实参类型中推断出来。

[enter:example]
[codeblock]
template<class T> class Array { /* ... */ };
template<class T> void sort(Array<T>& v);

// [:en] explicit specialization for [`sort(Array<int>&)]
// [|:zh_CN] [`sort(Array<int>&)] 的显式特化式
// [:en@~] with deduced [~template-argument] of type 
// [|:zh_CN@~] 带有被推断为类型 [`int] 的[~模板实参]
template<> void sort(Array<int>&);
[codeblock:end]
[exit:example]

[para]
[:en]
A function with the same name as a template and a type that exactly matches that
of a template specialization is not an explicit specialization ([#temp.fct]).
[:zh_CN]
与某个模板具有相同的名字，并具有与某个模板特例的类型精确匹配的类型的函数，不是
显式特化式（[#temp.fct]）。

[para]
[:en]
An explicit specialization of a function template is inline only if it is
declared with the [`inline] specifier or defined as deleted, and independently
of whether its function template is inline.
[:zh_CN]
函数模板的显式特化式，仅当以 [`inline] 说明符声明或被定义为弃置的时，它才是内联
的，且与该函数模板是否是内联无关。

[enter:example]
[codeblock]
template<class T> void f(T) { /* ... */ }
template<class T> inline T g(T) { /* ... */ }

template<> inline void f<>(int) { /* ... */ }   // [:en] OK: inline
                                                // [|:zh_CN] OK：内联
template<> int g<>(int) { /* ... */ }           // [:en] OK: not inline
                                                // [|:zh_CN] OK：不是内联
[codeblock:end]
[exit:example]

[para]
[:en]
An explicit specialization of a static data member of a template or an explicit
specialization of a static data member template is a definition if the
declaration includes an initializer; otherwise, it is a declaration.
[:zh_CN]
模板的静态数据成员的显式特化式，或者静态数据成员模板的显式特化式，若其声明式包含
初始化式则它是定义式；否则它是声明式。

[enter:note]
[:en]
The definition of a static data member of a template that requires default
initialization must use a [~braced-init-list]:
[:zh_CN]
模板的静态数据成员，需要默认初始化的定义式必须使用[~花括号初始化列表]。

[codeblock]
template<> X Q<int>::x;         // [:en] declaration
                                // [|:zh_CN] 声明式
template<> X Q<int>::x ();      // [:en] error: declares a function
                                // [|:zh_CN] 错误：声明了一个函数
template<> X Q<int>::x { };     // [:en] definition
                                // [|:zh_CN] 定义式
[codeblock:end]
[exit:note]

[para]
[:en]
A member or a member template of a class template may be explicitly specialized
for a given implicit instantiation of the class template, even if the member
or member template is defined in the class template definition.
[:zh_CN]
针对类模板的给定隐式实例，可以对类模板的成员或成员模板进行显式特化，无论该成员或
成员模板在类模板中是否已经定义。

[:en]
An explicit specialization of a member or member template is specified using the
syntax for explicit specialization.
[:zh_CN]
使用显式特化式的语法来指定成员或成员模板的显式特化式。

[enter:example]
[codeblock]
template<class T> struct A {
  void f(T);
  template<class X1> void g1(T, X1);
  template<class X2> void g2(T, X2);
  void h(T) { }
};

// [:en] specialization
// [|:zh_CN] 特化式
template<> void A<int>::f(int);

// [:en] out of class member template definition
// [|:zh_CN] 类外的成员模板定义式
template<class T> template<class X1> void A<T>::g1(T, X1) { }

// [:en] member template specialization
// [|:zh_CN] 成员模板特化式
template<> template<class X1> void A<int>::g1(int, X1);

// [:en] member template specialization
// [|:zh_CN] 成员模板特化式
template<> template<>
  void A<int>::g1(int, char);           // [:en] [`X1] deduced as [`char]
                                        // [|:zh_CN] [`X1] 被推断为 [`char]
template<> template<>
  void A<int>::g2<char>(int, char);     // [:en] [`X2] specified as [`char]
                                        // [|:zh_CN] [`X2] 被指定为 [`char]

// [:en] member specialization even if defined in class definition
// [|:zh_CN] 即使在类定义式中已定义也能进行成员特化
template<> void A<int>::h(int) { }
[codeblock:end]
[exit:example]

[para]
[:en]
A member or a member template may be nested within many enclosing class
templates.
[:zh_CN]
成员或成员模板可以被嵌套在许多层的外围类模板中。

[:en]
In an explicit specialization for such a member, the member declaration shall be
preceded by a [`template<>] for each enclosing class template that is explicitly
specialized.
[:zh_CN]
在此种成员的显式特化式中，应当为每个被显式特化的外围类模板向成员声明式指定一个
[`template<>] 前缀。

[enter:example]
[codeblock]
template<class T1> class A {
  template<class T2> class B {
    void mf();
  };
};
template<> template<> class A<int>::B<double>;
template<> template<> void A<char>::B<char>::mf();
[codeblock:end]
[exit:example]

[para]
[:en]
In an explicit specialization declaration for a member of a class template or
a member template that appears in namespace scope, the member template and some
of its enclosing class templates may remain unspecialized, except that the
declaration shall not explicitly specialize a class member template if its
enclosing class templates are not explicitly specialized as well.
[:zh_CN]
在类模板的成员或者成员模板的出现在命名空间作用域中的显式特化声明式中，成员模板和
一些它的外围类模板可以仍保持为未特化的，但若外围类模板并未被显式特化，则此声明式
也不能显式特化类成员模板。

[:en]
In such explicit specialization declaration, the keyword [`template] followed by
a [~template-parameter-list] shall be provided instead of the [`template<>]
preceding the explicit specialization declaration of the member.
[:zh_CN]
在这种显式特化声明式中，应当提供 [`template] 关键字后面跟着[~模板形参列表]，而
不是成员的显式特化声明式前面的 [`template<>]。

[:en]
The types of the [~template-parameters] in the [~template-parameter-list] shall
be the same as those specified in the primary template definition.
[:zh_CN]
[~模板形参列表]中的[~模板形参]的类型应当与主模板定义式中所指定的相同。

[enter:example]
[codeblock]
template <class T1> class A {
  template<class T2> class B {
    template<class T3> void mf1(T3);
    void mf2();
  };
};
template <> template <class X>
  class A<int>::B {
      template <class T> void mf1(T);
  };
template <> template <> template<class T>
  void A<int>::B<double>::mf1(T t) { }
template <class Y> template <>
  void A<Y>::B<double>::mf2() { }       // [:en] ill-formed; [`B<double>] is specialized but
                                        // [|:zh_CN] 非良构；[`B<double>] 已特化，但
                                        // [:en@~] its enclosing class template [`A] is not
                                        // [|:zh_CN@~] 其外围类模板 [`A] 未被特化
[codeblock:end]
[exit:example]

[para]
[:en]
A specialization of a member function template, member class template, or static
data member template of a non-specialized class template is itself a template.
[:zh_CN]
未特化的类模板的成员函数模板、成员类模板或静态数据成员模板的特例也是模板。

[para]
[:en]
An explicit specialization declaration shall not be a friend declaration.
[:zh_CN]
显式特化声明式不能是友元声明式。

[para]
[:en]
Default function arguments shall not be specified in a declaration or
a definition for one of the following explicit specializations:
[:zh_CN]
不能在如下的显式特化声明式或定义式中指定默认函数实参：

[list]
[item]
[:en@~] the explicit specialization of a function template;
[:zh_CN@~] 函数模板的显式特化式；
[item]
[:en@~] the explicit specialization of a member function template;
[:zh_CN@~] 成员函数模板的显式特化式；
[item]
[:en@~] the explicit specialization of a member function of a class template
where the class template specialization to which the member function
specialization belongs is implicitly instantiated.
[:zh_CN@~] 类模板的成员函数的显式特化式，其中该成员函数特例所属的类模板特例被
隐式实例化。

[enter:note]
[:en]
Default function arguments may be specified in the declaration or definition of
a member function of a class template specialization that is explicitly
specialized.
[:zh_CN]
被显式特化的类模板特例的成员函数的声明式或定义式中可以指定默认函数实参。
[exit:note]
[list:end]
