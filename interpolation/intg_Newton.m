function I=intg_Newton(x,y)
%{
this function used Newton method to calculate the numerical integral

x(vector): points on horizontal coordinate.

y(vector): the function value.
%}
h=x(2)-x(1);
n=length(y);    
I=(h/2)*(y(1)+y(n)+2*sum(y(2:n-1)));
end