[/
% ----------------------------------------------------------------------
% Class template student_t_distribution
% ----------------------------------------------------------------------
/]

[section#rand.dist.norm.t
    [:en] Class template [`student_t_distribution]
]

[%@library student_t_distribution]
[%[:en]random number distribution[![`student_t_distribution]]]

[para]
[:en] A [`student_t_distribution] random number distribution produces random
numbers [$x] distributed according to the probability density function

[:en]
[%probability density function[![`student_t_distribution]]]
[%[`student_t_distribution][!probability density function]]
[math]
p(x | n) = [=frac@1@[=sqrt@n[=pi]]] [=cdot]
    [=frac@[=Gamma] [$@op (] (n + 1) / 2 [$@op )] @[=Gamma](n/2) ]
    [=cdot] [$@op (] 1 + [=frac@x[^2]@n] [$@op )] [^-(n+1)/2] .
[math:end]

[codeblock:synopsis [special unspecified] ]
template<class RealType = double>
 class student_t_distribution
{
public:
 // [:en] types
 typedef RealType result_type;
 typedef unspecified param_type;

 // [:en] constructor and reset functions
 explicit student_t_distribution(RealType n = 1);
 explicit student_t_distribution(const param_type& parm);
 void reset();

 // [:en] generating functions
 template<class URNG>
   result_type operator()(URNG& g);
 template<class URNG>
   result_type operator()(URNG& g, const param_type& parm);

 // [:en] property functions
 RealType n() const;
 param_type param() const;
 void param(const param_type& parm);
 result_type min() const;
 result_type max() const;
};
[codeblock:end]

[%@library student_t_distribution[![:en]constructor]]
[codeblock:declaration]
explicit student_t_distribution(RealType n = 1);
[codeblock:end]

[enter:description]
[para:requires]
[:en] 0 < [`n].

[para:effects]
[:en] Constructs a [`student_t_distribution] object; [`n] corresponds to the
parameter of the distribution.
[exit:description]

[%@library student_t_distribution[!mean]]
[%@library mean[!student_t_distribution]]
[codeblock:declaration]
RealType n() const;
[codeblock:end]

[enter:description]
[para:returns]
[:en] The value of the [`n] parameter with which the object was constructed.
[exit:description]
