function Muxyplot(path,variableindex,layer)
[SL,SLsize]=domainread(path,'false');
dataType=isa(SL,'cell');
if dataType==true
    Pz=SL{1,variableindex};
    index=[1,SLsize(1),1,SLsize(2),layer,layer];
    Pzcut=domaincut(Pz,index);
    figure;
    imagesc(Pzcut);
    colorbar;
else
    Pz=SL;
    index=[1,SLsize(1),1,SLsize(2),layer,layer];
    Pzcut=domaincut(Pz,index);
    figure;
    imagesc(Pzcut);
    colorbar;
end
end