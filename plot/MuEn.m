function En=MuEn(path,type)
% path='energySTO2';type='final';
data=readmatrix(path);

if strcmp(type,'final')==1
    En=data(size(data,1),4:8);
elseif strcmp(type,'all')==1
    En=zeros(size(data,1),5);
    for i=1:5
    En(:,i)=data(:,i+3);
    end
end

end