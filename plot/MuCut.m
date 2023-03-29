function MuCut(input,output,cutRange)
[SL,~]=domainread(input,true);
xmin=cutRange(1);xmax=cutRange(2);
ymin=cutRange(3);ymax=cutRange(4);
zmin=cutRange(5);zmax=cutRange(6);

cuttedData=zeros((xmax-xmin+1)*(ymax-ymin+1)*(zmax-zmin+1),length(SL));
for i=1:length(SL)
    SL{i}=SL{i}(xmin:xmax,ymin:ymax,zmin:zmax);
    cuttedData(:,i)=SL{i}(:);
end
cuttedData(:,1)=cuttedData(:,1)-xmin+1;
cuttedData(:,2)=cuttedData(:,2)-ymin+1;
cuttedData(:,3)=cuttedData(:,3)-zmin+1;

cuttedData=sortrows(cuttedData,[1 2 3]);

title=[xmax-xmin+1,ymax-ymin+1,zmax-zmin+1];
fileID=fopen(output,'w');
fprintf(fileID,'%6d%6d%6d\n',title);
fprintf(fileID,'%6u%6u%6u%16.8E%16.8E%16.8E\n',cuttedData');
fclose(fileID);
end