clear;clc;close all;
scale=0.3;L=0.125e-6;
d=0.01;
[Px,Py]=meshgrid(-scale:d:scale,scale:-d:-scale);
[n,m]=size(Px);

Tc=115+273;
T=420;
alpha1=4.124*1e5*(T-Tc);
alpha11=-20.97*1e7;alpha12=7.974e8;
alpha111=1.294*1e9; alpha112=-1.950e9;
alpha1111=3.863*1e10; alpha1112=2.529e10; alpha1122=1.637e10;
Q11=0.1104; Q12=-0.452; Q44=0.0289;
E1=3e6;E2=0;
Ex=E1*ones(n); Ey=E2*ones(n);
e1=0; e2=0; e3=0;
exx=e1*ones(n);eyy=e2*ones(n);exy=e3*ones(n);

GL_alpha1=alpha1*Px.^2+alpha1*Py.^2;
GL_alphabar11=alpha11*Px.^4+alpha11*Py.^4;
GL_alphabar12=alpha12*Px.^2.*Py.^2;
GL_alpha111=alpha111*Px.^6+alpha111*Py.^6;
GL_alpha112=alpha112*(Px.^4.*Py.^2+Px.^2.*Py.^4);
GL_alpha1111=alpha1111*Px.^8+alpha1111*Py.^8;
GL_alpha1112=alpha1112*(Px.^6.*Py.^2+Px.^2.*Py.^6);
GL_alpha1122=alpha1122*Px.^4.*Py.^4;
G_GL=GL_alpha1+GL_alphabar11+GL_alphabar12+GL_alpha111+GL_alpha112+GL_alpha1111+GL_alpha1112+GL_alpha1122-Ex.*Px-Ey.*Py-exx.*(Q11*Px.^2+Q12*Py.^2)-eyy.*(Q11*Py.^2+Q12*Px.^2)-0.5*Q44*exy.*Px.*Py;
% plot(Px((n+1)/2,:),G_GL((n+1)/2,:));
% plot(Px(4,:),G_GL(4,:));
% figure;
% contour(Px,Py,G_GL,50);
surf(Px,Py,G_GL);
% T_min=270;
% T_max=290;
% P_T=zeros(T_max-T_min+1,1);
% for T=T_min:T_max
%     alpha1=4.124e5*(T-388); 
%     GL_alpha1=alpha1*Px.^2+alpha1*Py.^2;
%     GL_alphabar11=alpha11*Px.^4+alpha11*Py.^4;
%     GL_alphabar12=alpha12*Px.^2.*Py.^2;
%     GL_alpha111=alpha111*Px.^6+alpha111*Py.^6;
%     GL_alpha112=alpha112*(Px.^4.*Py.^2+Px.^2.*Py.^4);
%     GL_alpha1111=alpha1111*Px.^8+alpha1111*Py.^8;
%     GL_alpha1112=alpha1112*(Px.^6.*Py.^2+Px.^2.*Py.^6);
%     GL_alpha1122=alpha1122*Px.^4.*Py.^4;
%     G_GL=GL_alpha1+GL_alphabar11+GL_alphabar12+GL_alpha111+GL_alpha111+GL_alpha112+GL_alpha1111+GL_alpha1112+GL_alpha1122;
%     [x,y]=find(G_GL==min(min(G_GL)));
%     P_T(T-T_min+1)=sqrt(Px(x(1),y(1))^2+Py(x(1),y(1))^2);
% end
% plot(T_min:T_max,P_T);
  %%----------------------------gradient energy----------------------------%%
% subplot(1,2,1);
% surf(Px,Py,G_GL)
% subplot(1,2,2);
% contour(Px,Py,G_GL);
% figure;
% subplot(1,2,1);
% plot(-0.3:0.01:0.3,G_GL(10,:));
% subplot(1,2,2);
% plot(-0.3:0.01:0.3,G_GL(19,:));
% figure;
% plot3(Px,Py,dG_GL_Px);
% figure;
% plot3(Px,Py,dG_GL_Py);
% figure;
% plot3(Px,Py,ddG_GL_Px);
% disp(length(find(ddG_GL_Px<0)));