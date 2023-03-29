clc;clear;close all;
filen=4;P=cell(filen,1);
filename=["1e3","5e3","1e4","2e4"];
for i=1:filen
load(join(["S_298K_c04_E1e6f",filename(i),"epsilon.mat"],''));
P{i,1}=Px_mean;
end
Emax=1e6;
epsilon1=zeros(length(T_series),filen);
delta=zeros(length(T_series),filen);
sampling=100;
t=(2*pi/sampling:(2*pi/sampling):2*pi);
for i=1:filen
    for j=1:length(T_series)
        epsilon1(j,i)=(max(P{i,1}(j,:))-min(P{i,1}(j,:)))/(2*Emax);
        [fitresult,error]=sinfit(t,P{i,1}(j,:));
        delta(j,i)=-fitresult.c;
    end
end
epsilon2=abs(tan(delta)).*epsilon1;
for i=1:filen
subplot(1,3,1);
plot(T_series,epsilon1(:,i));
hold on;
subplot(1,3,2);
plot(T_series,epsilon2(:,i));
hold on;
subplot(1,3,3);
plot(T_series,abs(tan(delta(:,i))));
hold on;
end
subplot(1,3,1)
title('epsilon1');
legend(filename);
subplot(1,3,2)
title('epsilon2');
legend(filename);
subplot(1,3,3)
title('loss angle');
legend(filename);

[row,col]=find(max(epsilon1)==epsilon1);
max_T=row+280;
figure;
plot(max_T,'o-');
title("Temperature of dielectric peak")

