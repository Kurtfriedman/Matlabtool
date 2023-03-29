function reducedarray=dtrim(m,t)
%This function is used to porpotionally reduce the size of a matrix,
%For example: if m is a 8*8*8 matrix, then dtrim(m,2)return a 4*4*4 matrix
    if length(t)==2
    reducedarray=m(1:t(1):size(m,1),1:t(2):size(m,2));
    elseif length(t)==3
    reducedarray=m(1:t(1):size(m,1),1:t(2):size(m,2),1:t(3):size(m,3));
    end
end
