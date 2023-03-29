function df=derv(x,y)
%{
this function use two point method to calculate the numerical derivation

x(vector): points on horizontal coordinate;

y(vector): function value;
%}
    n=length(x);
    h=x(2)-x(1);
    df=(y(3:n)-y(1:n-2))/h;
end