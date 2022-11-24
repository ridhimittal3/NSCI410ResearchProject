function [out]=util(x)

%%% Utility function used for decision making

if (x>=0)
    out=abs(x)^0.85;
else
    out=-abs(x)^0.95;
end

end