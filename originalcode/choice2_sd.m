function [out]=choice2_sd() % function has no input, returns out

global s


%%%% Simulating the example given on p. 263 (choosing between gamble A and gamble B) of Birnbaum (2005) %%%%
%%%% Birnbaum, M. H., (2005). A comparison of five models that predict violations of first-order stochastic dominance
%%%% in risky decision making. The Jounal of Risk and Uncertainty, 31(3), 263-287.

B1=abs(util(96)-util(14))*(0.85)*(0.05)*sqrt((1+abs(util(96)-util(14))*sqrt(s))/(abs(util(96)-util(14))*sqrt(s)));
B2=abs(util(96)-util(12))*(0.85)*(0.05)*sqrt((1+abs(util(96)-util(12))*sqrt(s))/(abs(util(96)-util(12))*sqrt(s)));
B3=abs(util(90)-util(96))*(0.05)*(0.9)*sqrt((1+abs(util(90)-util(96))*sqrt(s))/(abs(util(90)-util(96))*sqrt(s)));
B4=abs(util(90)-util(14))*(0.05)*(0.05)*sqrt((1+abs(util(90)-util(14))*sqrt(s))/(abs(util(90)-util(14))*sqrt(s)));
B5=abs(util(90)-util(12))*(0.05)*(0.05)*sqrt((1+abs(util(90)-util(12))*sqrt(s))/(abs(util(90)-util(12))*sqrt(s)));
B6=abs(util(12)-util(96))*(0.1)*(0.9)*sqrt((1+abs(util(12)-util(96))*sqrt(s))/(abs(util(12)-util(96))*sqrt(s)));
B7=abs(util(12)-util(14))*(0.1)*(0.05)*sqrt((1+abs(util(12)-util(14))*sqrt(s))/(abs(util(12)-util(14))*sqrt(s)));

% fprintf('\n%f\n', B1);
% fprintf('%f\n', B2);
% fprintf('%f\n', B3);
% fprintf('%f\n', B4);
% fprintf('%f\n', B5);
% fprintf('%f\n', B6);
% fprintf('%f\n', B7);

B_t=B1+B2+B3+B4+B5+B6+B7;
% fprintf('\n%f\n', B_t);

rnd_B=rand;
% fprintf('\n%f\n', rnd_B);

if (rnd_B<(B1/B_t))
    out=util(96)-util(14);
elseif (rnd_B<(B1+B2)/B_t)
    out=util(96)-util(12);
elseif (rnd_B<(B1+B2+B3)/B_t)
    out=util(90)-util(96);
elseif (rnd_B<(B1+B2+B3+B4)/B_t)
    out=util(90)-util(14);
elseif (rnd_B<(B1+B2+B3+B4+B5)/B_t)
    out=util(90)-util(12);
elseif (rnd_B<(B1+B2+B3+B4+B5+B6)/B_t)
    out=util(12)-util(96);
elseif (rnd_B<(B1+B2+B3+B4+B5+B6+B7)/B_t)
    out=util(12)-util(14);
end

end