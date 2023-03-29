function x=cutoff_nrnd(mu,sigma)
x=normrnd(mu,sigma);
if x<0
    while x<0 
        x=normrnd(mu,sigma);
    end
end