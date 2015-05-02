[/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% geometric_distribution
/]

[section#rand.dist.bern.geo
    [:en] Class template [`geometric_distribution]
]

[%@library geometric_distribution]
[%[:en]random number distribution[![`geometric_distribution]]]

[para]
[:en] A [`geometric_distribution] random number distribution produces integer
values [$i] [=geq] 0 distributed according to the discrete probability function
[%discrete probability function[![`geometric_distribution]]]
[%[`geometric_distribution][!discrete probability function]]

[math]
P(i | p) = p [=cdot] (1-p)[^i] .
[math:end]

[codeblock:synopsis [special unspecified] ]
template<class IntType = int>
 class geometric_distribution
{
public:
 // [:en] types
 typedef IntType result_type;
 typedef unspecified param_type;

 // [:en] constructors and reset functions
 explicit geometric_distribution(double p = 0.5);
 explicit geometric_distribution(const param_type& parm);
 void reset();

 // [:en] generating functions
 template<class URNG>
   result_type operator()(URNG& g);
 template<class URNG>
   result_type operator()(URNG& g, const param_type& parm);

 // [:en] property functions
 double p() const;
 param_type param() const;
 void param(const param_type& parm);
 result_type min() const;
 result_type max() const;
 };
[codeblock:end]

[%@library geometric_distribution[![:en] constructor]]
[codeblock:declaration]
explicit geometric_distribution(double p = 0.5);
[codeblock:end]

[enter:description]
[para:requires]
[:en] 0 < [`p] < 1.

[para:effects]
[:en] Constructs a [`geometric_distribution] object; [`p] corresponds to the
parameter of the distribution.
[exit:description]

[%@library geometric_distribution[!p]]
[%@library p[!geometric_distribution]]
[codeblock:declaration]
double p() const;
[codeblock:end]

[enter:description]
[para:returns]
[:en] The value of the [`p] parameter with which the object was constructed.
[exit:description]
