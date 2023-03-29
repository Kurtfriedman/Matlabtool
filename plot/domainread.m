function [Domain,Domainsize]=domainread(Path,coor)
%read standard mupro data
muproData=sortrows(readmatrix(Path),3);
% muproData=sortrows(readmatrix('C:\Users\KurtFriedman\Desktop\MURI\shrinking STO\STO16'),3);
dsize=size(muproData,2);
maxtemp=max(muproData);
%Find the nx ny nz of the muproData
nx=maxtemp(1,1);ny=maxtemp(1,2);nz=maxtemp(1,3);
Domainsize=[nx,ny,nz];

%if coor=true output the coordinate, else skip the coordinate.
if coor==true
    Domain=cell(1,dsize-3);
    for i=1:dsize
        Domain{1,i}=reshape(muproData(:,i),[ny,nx,nz]);
    end
else
    %if the mupro file just have 4 columns and the coordinate is skipped,
    %then output just a matrix, else output a cell.
    if dsize==4
        Domain=reshape(muproData(:,4),[ny,nx,nz]);
    else
        Domain=cell(1,dsize-3); 
        for i=1:(dsize-3)
            Domain{1,i}=reshape(muproData(:,i+3),[ny,nx,nz]);
        end
    end
end

end