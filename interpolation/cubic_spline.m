function M=cubic_spline(x,y)
%{
this is a function used for get parameters of cubic spline interpolation
function

x is the interpolation interval

y is the value of the function you want to interpolate

ATTENTION: x and y must be coloum vector(means that the dimension of x and
y must be n*1)

M is the parameter returned by this function

%}

n=length(x);%n is the number of samples
h=x(2:n)-x(1:n-1);
mu=h(1:n-2)./(h(1:n-2)+h(2:n-1));
lambda=1.-mu;
A=zeros(n-2,n-2);%A is the parameter matrix of the equation set, the variable of the matrix is M
for i=1:n-2
    for j=1:n-2
        if j-i==1
            A(i,j)=lambda(i);
        elseif i-j==1
            A(i,j)=mu(j);
        elseif i==j
            A(i,j)=2;
        end
    end
end
dy=(y(2:n)-y(1:n-1))./(x(2:n)-x(1:n-1));
ddy=(dy(2:n-1)-dy(1:n-2))./(2*(x(3:n)-x(1:n-2)));
b=6*ddy;
M=A\b;%M is the paramter of spline function,the length of M is n-1
end
