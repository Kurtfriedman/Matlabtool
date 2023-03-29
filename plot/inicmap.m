function color=inicmap(basecolor)
%this program is used to generate the colormap
%every color in matlab is a triple components array
%red [1 0 0] green [0 1 0] blue [0 0 1] white [1 1 1] black [0 0 0]
%yellow[1 1 0] fuchsin[1 0 1] cyan[0 1 1]
%input the any amount of basecolor in matrix form like:
%    [1 1 0
%     1 0 1
%     0 1 1
%     1 0 0];
%and this program will generate the colorbar according to
% the minimun color interval that you input

m=size(basecolor,1);
interval=200;
color=zeros((m-1)*interval,3);
for i=1:(m-1)
    for j=1:interval
        color((i-1)*interval+j,:)=basecolor(i,:)+(basecolor(i+1,:)-basecolor(i,:))*j/interval;
    end
end
color=color/255;
end