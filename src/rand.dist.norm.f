[/
% ----------------------------------------------------------------------
% Class template fisher_f_distribution
% ----------------------------------------------------------------------
/]

[section#rand.dist.norm.f
    [:en] Class template [`fisher_f_distribution]
]

[%@library fisher_f_distribution]
[%[:en]random number distribution[![`fisher_f_distribution]]]

[para]
[:en] A [`fisher_f_distribution] random number distribution produces random
numbers [$x [=ge] 0] distributed according to the probability density function

[:en]
[%probability density function[![`fisher_f_distribution]]]
[%[`fisher_f_distribution][!probability density function]]
[math]
p(x | m, n) = [=frac@[=Gamma] [$@op (] (m + n) / 2 [$@op )]
                    @[=Gamma](m/2) [=Gamma](n/2) ]
    [=cdot] [$@op (][=frac@m@n][$@op )][^m/2] [=cdot] x[^(m/2)-1]
    [=cdot] [$@op (] 1 + [=frac@mx@n] [$@op )] [^-(m+n)/2] .
[math:end]

[codeblock:synopsis [special unspecified] ]
template<class RealType = double>
 class fisher_f_distribution
{
public:
 // [:en] types
 typedef RealType result_type;
 typedef unspecified param_type;

 // [:en] constructor and reset functions
 explicit fisher_f_distribution(RealType m = 1, RealType n = 1);
 explicit fisher_f_distribution(const param_type& parm);
 void reset();

 // [:en] generating functions
 template<class URNG>
   result_type operator()(URNG& g);
 template<class URNG>
   result_type operator()(URNG& g, const param_type& parm);

 // [:en] property functions
 RealType m() const;
 RealType n() const;
 param_type param() const;
 void param(const param_type& parm);
 result_type min() const;
 result_type max() const;
};
[codeblock:end]

[%@library fisher_f_distribution[![:en]constructor]]
[codeblock:declaration]
explicit fisher_f_distribution(RealType m = 1, RealType n = 1);
[codeblock:end]

[enter:description]
[para:requires]
[:en] 0 < [`m] and 0 < [`n].

[para:effects]
[:en] Constructs a [`fisher_f_distribution] object; [`m] and [`n] correspond to
the respective parameters of the distribution.
[exit:description]

[%@library fisher_f_distribution[!m]]
[%@library m[!fisher_f_distribution]]
[codeblock:declaration]
RealType m() const;
[codeblock:end]

[enter:description]
[para:returns]
[:en] The value of the [`m] parameter with which the object was constructed.
[exit:description]

[%@library fisher_f_distribution[!n]]
[%@library n[!fisher_f_distribution]]
[codeblock:declaration]
RealType n() const;
[codeblock:end]

[enter:description]
[para:returns]
[:en] The value of the [`n] parameter with which the object was constructed.
[exit:description]
