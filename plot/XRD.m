classdef XRD
    methods (Static=true)
        %function read: read the XRD and corresponding coordinated file
        function [XRDData,kspaceCoor,XRDSize]=read(XRDDataPath,kspaceCoorPath)
            [XRDData,~]=domainread(XRDDataPath,false);

            [data,XRDSize]=domainread(kspaceCoorPath,false);
            kspaceCoor=cell(1,3);
            for j=1:3
                kspaceCoor{j}=data{j}/10;
            end
        end
        
        %function cut: cut the XRD and corresponding coordinated file into the
        %size you want. cutindex specify the range of cutting, it should be
        %in this form:[xmin xmax ymin ymax zmin zmax]
        function [XRDCutted,kspaceCoorCutted]=cut(XRDData,kspaceCoorx,kspaceCoory,kspaceCoorz,cutindex)
            kspaceCoorCutted=cell(1,3);

            XRDCutted=domaincut(XRDData,cutindex);

            kspaceCoorCutted{1}=domaincut(kspaceCoorx,cutindex);
            kspaceCoorCutted{2}=domaincut(kspaceCoory,cutindex);
            kspaceCoorCutted{3}=domaincut(kspaceCoorz,cutindex);
        end
        %function 2dPlot: plot the 2d figure of the XRD data 
        function plot(XRDCutted,kspaceCoorCutted,cutindex)
            figure;
            if cutindex(3)==plotindex(4)
                subplot(1,2,1)
                surf(kspaceCoorCutted{1,2},kspaceCoorCutted{1,3},log(XRDCutted));
                subplot(1,2,2)
                pcolor(kspaceCoorCutted{1,2},kspaceCoorCutted{1,3},log(XRDCutted));
            elseif cutindex(1)==plotindex(2)
                subplot(1,2,1)
                surf(kspaceCoorCutted{1,1},kspaceCoorCutted{1,3},log(XRDCutted));
                subplot(1,2,2)
                pcolor(kspaceCoorCutted{1,1},kspaceCoorCutted{1,3},log(XRDCutted));
            else
                disp('First two(or second two) values of the plotindex must be the same')
            end
        end        

    end
end