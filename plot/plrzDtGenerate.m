function plrzDtGenerate(inputPath,outputPath)
data=readmatrix(inputPath);
data(:,4:size(data,2))=0;
maxtemp=max(data);
title=maxtemp(1:3);
fileID=fopen(outputPath,'w');
fprintf(fileID,'%6d%6d%6d\n',title);
fprintf(fileID,'%6u%6u%6u%16.8E%16.8E%16.8E\n',data');
fclose(fileID);
end