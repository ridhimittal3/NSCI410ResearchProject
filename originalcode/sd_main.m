clc
clear all

global s
s=2;   %% number of samples (mental simulations)
sim_avg=1000;   %% number of participants (experimental subjects)

expect2=[];
expect2_avg=[];
expect2_avg_test=[];

num2_test=0;

for M=1:sim_avg %% iterating for number of participants
        
    denum2=0; 
    num2=0; 
    
    for k=1:s %% iterating for number of samples
        [b2]=choice2_sd();
        denum2=denum2+1/(abs(b2)*((1+abs(b2)*sqrt(s))/(abs(b2)*s))^0.5*(s^0.25));
        num2=num2+(1/(abs(b2)*((1+abs(b2)*sqrt(s))/(abs(b2)*s))^0.5*(s^0.25)))*b2;
    end
       
    expect2(M)=num2/denum2;     %% SbEU estimate of expected utility
            
    if (expect2(M)>0) % if SbEU estimates expected utility > 0, then num2_test++
        num2_test=num2_test+1;
    elseif (expect2(M)==0)      %% if SbEU estimate of expected utility is 0, then randomly choose between the two gambles
        if (rand<0.5)
            num2_test=num2_test+1;
        end 
    else
    end
    
end

expect2_avg_test=num2_test/sim_avg
%fprintf('\n# of participants who choose B = %d\n', num2_test);
%fprintf('total # of participants = %d\n', sim_avg);
%fprintf('percentage of participants who choose B: %f\n', expect2_avg_test);