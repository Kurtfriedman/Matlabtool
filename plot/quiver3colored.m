function q=quiver3colored(Pa,Pb,Pc,rgb)
%This function is used to plot a quiver plot with colored arrow
%Pa Pb Pc is the vector and rgb is your colormap
[x,y,z]=meshgrid(1:size(Pa,2),1:size(Pa,1),1:size(Pa,3));
q=quiver3(x,y,z,Pa,Pb,Pc);

mags = reshape(q.WData, numel(q.UData), []);

% mags = sqrt(sum(cat(2, q.UData(:), q.VData(:), reshape(q.WData, numel(q.UData), [])).^2, 2));
%// Get the current colormap
currentColormap = rgb;

%// Now determine the color to make each arrow using a colormap
[~, ~, ind] = histcounts(mags, size(currentColormap, 1));

%// Now map this to a colormap to get RGB
cmap = uint8(ind2rgb(ind(:), currentColormap) * 255);
cmap(:,:,4) = 255;
cmap = permute(repmat(cmap, [1 3 1]), [2 1 3]);

%// We repeat each color 3 times (using 1:3 below) because each arrow has 3 vertices
set(q.Head,'ColorBinding', 'interpolated','ColorData', reshape(cmap(1:3,:,:), [], 4).');   %'

%// We repeat each color 2 times (using 1:2 below) because each tail has 2 vertices
set(q.Tail,'ColorBinding', 'interpolated', 'ColorData', reshape(cmap(1:2,:,:), [], 4).');
end

