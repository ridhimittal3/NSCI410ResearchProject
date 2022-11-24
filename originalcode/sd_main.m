clc
clear all

global s
s=2;   %% number of samples (mental simulations)
sim_avg=10;   %% number of participants (experimental subjects)

expect2=[];
expect2_avg=[];
expect2_avg_test=[];

num2_test=0;

for M=1:sim_avg %% iterating for number of participants
    
    fprintf('M=%d\n',M); %% prints M, %d=integer,\n=line-break
    
    denum2=0; 
    num2=0; 
    
    for k=1:s %% iterating for number of samples
        [b2]=choice2_sd();
%         fprintf('Sample %d:\nb2=%f\n', k, b2);
        denum2=denum2+1/(abs(b2)*((1+abs(b2)*sqrt(s))/(abs(b2)*s))^0.5*(s^0.25));
%         fprintf('denum2=%f\n', denum2);
        num2=num2+(1/(abs(b2)*((1+abs(b2)*sqrt(s))/(abs(b2)*s))^0.5*(s^0.25)))*b2;
%         fprintf('num2=%f\n', num2);
    end

            
    expect2(M)=num2/denum2;     %% SbEU estimate of expected utility
%     fprintf('\nexpect2=%f\n', expect2);
            
    if (expect2(M)>0) % if SbEU estimates expected utility > 0, then num2_test++
        num2_test=num2_test+1;
%         fprintf('\nParticipant %d has SbEU utility > 0\n', M);
    elseif (expect2(M)==0)      %% if SbEU estimate of expected utility is 0, then randomly choose between the two gambles
        if (rand<0.5)
            num2_test=num2_test+1;
%             fprintf('\nrand<0.5');
        end 
%         fprintf('\nParticipant %d has SbEU utility = 0\n', M);
    else
%         fprintf('\nParticipant %d has SbEU utility < 0\n', M);
    end
    
end

fprintf('\nexpect2=%f\n', expect2);
expect2_avg_test=num2_test/sim_avg;
fprintf('\n# of participants who choose B = %d\n', num2_test);
fprintf('total # of participants = %d\n', sim_avg);
fprintf('percentage of participants who choose B: %f\n', expect2_avg_test);