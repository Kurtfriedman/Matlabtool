% M=data(2).M1;
% x=flipud(data(2).Px_dcre);
% y=flipud(Ex1);
% t=(0.01:0.01:0.30)';

function f=getvalue_spline(M,x,y,t)
%{
this is a function used to get fucntion value of whatever point inside the
interpolation interval.

M(vector): parameters returned by the function cubic_spline(x,y).

x and y(vector): points and value of the function you interpolate.

t(vector): the point you want to calculate its function value.
%}
n=length(t);
n0=length(x);
f=zeros(length(t),1);
M=[0;M;0];
for i=1:n
    for j=1:n0-1
        if (t(i)<x(j+1))&&(t(i)>=x(j))
            r=j;
            break;
        end
    end
    h=x(r+1)-x(r);
    term1=(x(r+1)-t(i))^3*M(r)/(6*h);
    term2=(t(i)-x(r))^3*M(r+1)/(6*h);
    term3=(y(r)-h^2*M(r)/6)*(x(r+1)-t(i))/h;
    term4=(y(r+1)-h^2*M(r+1)/6)*(t(i)-x(r))/h;
    f(i)=term1+term2+term3+term4;
end
end