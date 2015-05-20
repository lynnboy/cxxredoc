[section#func.wrap.func.alg
    [:en] specialized algorithms
    [:zh_CN] 特化的算法
]

[%@library function[!swap]]
[%@library swap[!function]]
[codeblock:declaration]
template<class R, class... ArgTypes>
  void swap(function<R(ArgTypes...)>& f1, function<R(ArgTypes...)>& f2);
[codeblock:end]

[enter:description]
[para:effects]
[`f1.swap(f2);]
[exit:description]
