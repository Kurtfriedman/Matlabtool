clear;clc;close all;
kb=1.38e-23;
deltat=5e-10;
Tc=115+273;
iter_num=6000;
P_history=zeros(iter_num,2);
dG_history=zeros(iter_num,2);
amount=360;
reaction_t=zeros(amount,1);

% Px=1e-14;Py=1e-14;
%%--------------history--------------%%


for j=0:amount
field=4e6*1;
rho=cutoff_nrnd(field,2e5);
estrength=1e8*0;
exx=cutoff_nrnd(estrength,0); eyy=exx;exy=0;
theta=(j/360)*2*pi;
rhox=rho*cos(theta);rhoy=rho*sin(theta);
T=298;
Px=0.23;Py=0;
for i=1:6000
    dG_Px=get_dG_GL(Px,Py,T,Tc,rhox,exx,eyy,exy);
    dG_Py=get_dG_GL(Py,Px,T,Tc,rhoy,eyy,exx,exy);
    
    noise=0*randn(1);
    Px=Px-(deltat*dG_Px+noise);
    noise=0*randn(1);
    Py=Py-(deltat*dG_Py+noise);
    
%     P_history(i,1)=Px;
%     P_history(i,2)=Py;
%     dG_history(i,1)=dG_Px;
%     dG_history(i,2)=dG_Py;
end
% 
for i=1:5000
    dG_Px=get_dG_GL(Px,Py,T,Tc,rhox+1e6,exx,eyy,exy);
    dG_Py=get_dG_GL(Py,Px,T,Tc,rhoy,eyy,exx,exy);
    
%     noise=1e-5*randn(1);
    noise=0;
    Px=Px-(deltat*dG_Px+noise);
%     noise=1e-5*randn(1);
    noise=0;
    Py=Py-(deltat*dG_Py+noise);

    dG_history(i,1)=dG_Px;
    dG_history(i,2)=dG_Py;
    
    grad=sqrt(dG_Px^2+dG_Py^2);
    
    if grad<1e2
        reaction_t(j+1)=i;
        break;
    end
    
%     Px_history(i)=Px;
    
end
end
plot(reaction_t);
