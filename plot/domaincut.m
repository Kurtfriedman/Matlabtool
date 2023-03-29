function cuttedomain=domaincut(Domain,index)
%This function is used to cut 3-D matrix
%Domain is the matrix you want to cut
%index is a 3*2 matrix, index should be in this form:
%[rowleftlimit,rowrightlimit;columnleftlimit,coloumnrightlimit;layerleftlimit,layerrightlimit]

%set the range of cutting
Pxleftlimit=index(1);Pxrightlimit=index(2);
lx=Pxrightlimit-Pxleftlimit+1;
Pyleftlimit=index(3);Pyrightlimit=index(4);
ly=Pyrightlimit-Pyleftlimit+1;
Pzleftlimit=index(5);Pzrightlimit=index(6);
lz=Pzrightlimit-Pzleftlimit+1;
%do cut
if Pxleftlimit==Pxrightlimit
    Domain=Domain(Pxleftlimit:Pxrightlimit,Pyleftlimit:Pyrightlimit,Pzleftlimit:Pzrightlimit);
    cuttedomain=reshape(Domain(:),[ly,lz])';
elseif Pyleftlimit==Pyrightlimit
    Domain=Domain(Pxleftlimit:Pxrightlimit,Pyleftlimit:Pyrightlimit,Pzleftlimit:Pzrightlimit);
    cuttedomain=reshape(Domain(:),[lx,lz])';
else
    cuttedomain=Domain(Pxleftlimit:Pxrightlimit,Pyleftlimit:Pyrightlimit,Pzleftlimit:Pzrightlimit);
end

end
