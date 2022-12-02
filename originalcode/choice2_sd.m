function [out]=choice2_sd() % function has no input, returns out
global s

%%%% Simulating the example given on p. 263 (choosing between gamble A and gamble B) of Birnbaum (2005) %%%%
%%%% Birnbaum, M. H., (2005). A comparison of five models that predict violations of first-order stochastic dominance
%%%% in risky decision making. The Journal of Risk and Uncertainty, 31(3), 263-287.
A_val=[96, 14, 12];
A_prob=[0.9, 0.05, 0.05];
A=[A_val(:), A_prob(:)];

B_val=[96, 90, 12];
B_prob=[0.85, 0.05, 0.1];
B=[B_val(:), B_prob(:)];

i=1;
x=zeros(9,3);

for b = 1:length(B)
    for a = 1:length(A)
        value=abs(util(B_val(b))-util(A_val(a)))*(B_prob(b))*(A_prob(a))*sqrt((1+abs(util(B_val(b))-util(A_val(a)))*sqrt(s))/(abs(util(B_val(b))-util(A_val(a)))*sqrt(s)));
        if ~isnan(value)
            x(i,1)=value;
            x(i,2)=A_val(a);
            x(i,3)=B_val(b);
            i=i+1;
        end
    end
end


B_t=sum(x(:,1));
rnd_B=rand;

for i = 1:sum(all(x~=0,2))
    if (rnd_B<(sum(x(1:i,1))/B_t))
        out=util(x(i,3))-util(x(i,2));
        break
    end
end