close all;clc;clear;
omega=(1:100);
E1=5e6; E=1e5; t=1e-2;
f1=(E1+E*cos(omega*t))./((E1+E*cos(omega*t)).^2-E*sin(omega*t).^2);
plot(f1);

f2=-sin(omega*t)./((E1+E*cos(omega*t)).^2-E*sin(omega*t).^2);
figure;
plot(f2);