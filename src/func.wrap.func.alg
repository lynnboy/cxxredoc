[section#func.wrap.func.alg
    [:en] specialized algorithms
]

[%@library function[!swap]]
[%@library swap[!function]]
[codeblock:declaration]
template<class R, class... ArgTypes>
  void swap(function<R(ArgTypes...)>& f1, function<R(ArgTypes...)>& f2);
[codeblock:end]

[enter:description]
[para:effects]
[:en] [`f1.swap(f2);]
[exit:description]
