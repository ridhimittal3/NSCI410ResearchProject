function [out]=choice2_sd() % function has no input, returns out
global s


%%%% Simulating the example given on p. 263 (choosing between gamble A and gamble B) of Birnbaum (2005) %%%%
%%%% Birnbaum, M. H., (2005). A comparison of five models that predict violations of first-order stochastic dominance
%%%% in risky decision making. The Journal of Risk and Uncertainty, 31(3), 263-287.
A_val=[96, 14, 12];
A_prob=[0.9, 0.05, 0.05];
A=containers.Map(A_val,A_prob);
a_k=keys(A);
a_val=values(A);


B_val=[96, 90, 12];
B_prob=[0.85, 0.05, 0.1];
B=containers.Map(B_val, B_prob);
b_k=keys(B);
b_val=values(B);

i=1;
x=[];
list={{}};

for b = 1:length(B)
    for a = 1:length(A)
        value=abs(util(b_k{b})-util(a_k{a}))*(b_val{b})*(a_val{a})*sqrt((1+abs(util(b_k{b})-util(a_k{a}))*sqrt(s))/(abs(util(b_k{b})-util(a_k{a}))*sqrt(s)))
        if ~isnan(value)
            x(end+1)=value;
            list(end+1)={a_k{a}, b_k{b}}
            i=i+1;
        end
    end
end

B_t=sum(x);
rnd_B=rand;

for i = 1:length(x)
    if (rnd_B<(sum(x(1:i)))/B_t)
        out=util(dict{i})-util(dict{i});
        break
    end
end
