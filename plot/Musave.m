function Musave(outputData,outputPath)
l=size(outputData,1);
title=[outputData(l,1),outputData(l,2),outputData(l,3)];
fileID=fopen(outputPath,'w');
fprintf(fileID,'%6d%6d%6d\n',title);
fprintf(fileID,'%6u%6u%6u%16.8E%16.8E%16.8E\n',outputData');
fclose(fileID);
end