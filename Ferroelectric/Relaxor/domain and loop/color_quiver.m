function color_quiver(Px,Py,background,backGcolorscale,scale,color,arrowdensity,linewidth,rescaling_factor)
%scale control the length of arrow in quiver plot
%color control the color of arrow
[m,n]=size(Px);

Pvx=zeros(m,n);Pvy=zeros(m,n);

density=m/arrowdensity;

for i=1:m
    for j=1:n
        if rem(i,density)==1&&rem(j,density)==1
            Pvx(i,j)=Px(i,j);
            Pvy(i,j)=Py(i,j);
        end
            
    end
end
Pvx=reshape(Pvx,m,n);Pvy=reshape(Pvy,m,n);
[x,y]=meshgrid(1:m,1:n);
imagesc(background,backGcolorscale);
hold on;
quiver(x,y,Pvx,Pvy,scale*mean2(sqrt(Px.^2+Py.^2))/rescaling_factor,color,'LineWidth',linewidth);
end