clc;clear;close all;
T1=[298,348,398,448,498,548];
P1=cell(5,1);P2=cell(5,1);
stress1=cell(5,1);stress2=cell(5,1);
basecolor=[0.1 0.5 1
    0.3 0.7 0.3
    1 0.6 0];
color=ini_color(basecolor);
set(gcf,'Units','centimeters','Position',[1 1 20 25]);
for i=1:5
    for j=1:6
    load(['E_',num2str(T1(j)),'K_c0',num2str(i-1),'_Relaxor.mat'],'Px2','Py2');
    load(['E298K_c0',num2str(i-1),'_hyloop.mat']);
    Pabs=sqrt(Px2.^2+Py2.^2);
    backG=Px2+Py2;
    subplot('Position',[0.2*(i-1) 0.04+0.16*(j-1) 0.17 0.13])
%     color_quiver(Px2,Py2,angle(Px2,Py2)./(Pabs/0.28),3,'black',32,0.3,0.28)
    color_quiver(Px2,Py2,backG,[-0.3,0.3],3,'black',32,0.3,0.28)
    axis off;
    end
    P1{i,1}=Px_mean;
    stress1{i,1}=0.1104*Px_mean.^2;
end
colormap(color);

T2=[298,328,358,388];
figure;
set(gcf,'Units','centimeters','Position',[1 1 25 20]);
for i=1:5
    for j=1:4
    load(['S_',num2str(T2(j)),'K_c0',num2str(i-1),'_Relaxor.mat'],'Px2','Py2');
    load(['S_298K_c0',num2str(i-1),'_hyloop.mat'])
    backG=Px2+Py2;
    subplot('Position',[0.2*(i-1) 0.25*(j-1) 0.18 0.23])
    color_quiver(Px2,Py2,backG,[-0.3,0.3],3,'black',32,0.3,0.28)
    axis off;
    end
    P2{i,1}=Px_mean;
    stress2{i,1}=0.1104*Px_mean.^2;
end
colormap(color);

% figure;
% subplot(1,2,1);
% for i=1:5
%     plot(E_hyloop,P1{i,1});
%     hold on;
% end
% subplot(1,2,2)
% for i=1:5
%     plot(E_hyloop,stress1{i,1});
%     hold on;
% end
% 
% figure;
% subplot(1,2,1);
% for i=1:5
%     plot(E_hyloop,P2{i,1});
%     hold on;
% end
% subplot(1,2,2)
% for i=1:5
%     plot(E_hyloop,stress2{i,1});
%     hold on;
% end

