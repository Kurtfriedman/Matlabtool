function [exx,eyy,exy,elecfieldx,elecfieldy]=rndfield2(n,L,T,random_point_number,s10,s20,strech_sigma,elecstrength,strength_sigma,range_mu,range_sigma)
%parameter and constant of random field
% clc;clear;
% n=128;
% L=0.125e-6;
Q11=0.1104; Q12=-0.452; Q44=0.0289; alpha1=4.124e5*(T-388);
Q1=Q11-Q12; Q2=Q11+Q12;
d=L/n;
[x,y]=meshgrid(-L/2:d:(L/2-d),-L/2:d:(L/2-d));
% random_point_number=1000;
% exx_strength=1e7;
% eyy_strength=1e7;
% exy_strength=1e7;
% elecstrength=7e6;
% range_mu=8e-17;
% range_sigma=8e-17
%initialization field
exx=zeros(n);eyy=zeros(n);exy=zeros(n);%stress field initialization
elecfieldx=zeros(n);elecfieldy=zeros(n);%electric field initialization
%intialize direction
random_direction=rand(random_point_number,1)*2*pi;%initialize in radian
direc_x=cos(random_direction);direc_y=sin(random_direction);%calculate direction vector
%initialize exerting point
random_point=randi(128*128,random_point_number,1);
random_x=(mod(random_point,128)-65)*d;
random_y=(ceil(random_point/128)-65)*d;
%generate random field
for i=1:random_point_number
    range=normrnd(range_mu,range_sigma);
    if range<0
        while range<0 
            range=normrnd(range_mu,range_sigma);
        end
    end
    distance=(x-random_x(i)).^2+(y-random_y(i)).^2;
    s1=normrnd(s10,strech_sigma);
    s2=normrnd(s20,strech_sigma);
    exx=exx+((0.5/Q1+0.5/Q2)*alpha1*(1-(s1*direc_x(i)^2+s2*direc_y(i)^2))+(-0.5/Q1+0.5/Q2)*alpha1*(1-(s1*direc_y(i)^2+s2*direc_x(i)^2)))*exp(-distance/range);
    eyy=eyy+((-0.5/Q1+0.5/Q2)*alpha1*(1-(s1*direc_x(i)^2+s2*direc_y(i)^2))+(0.5/Q1+0.5/Q2)*alpha1*(1-(s1*direc_y(i)^2+s2*direc_x(i)^2)))*exp(-distance/range);
    exy=exy+(2*alpha1*(s1-s2)*direc_x(i)*direc_y(i)/Q44)*exp(-distance/range);
    elecfieldx=elecfieldx+normrnd(elecstrength,strength_sigma)*exp(-distance/range).*direc_x(i);
    elecfieldy=elecfieldy+normrnd(elecstrength,strength_sigma)*exp(-distance/range).*direc_y(i);
end
end