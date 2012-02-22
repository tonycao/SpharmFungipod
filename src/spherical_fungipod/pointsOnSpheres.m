%function [locationX_results, locationY_results, locationZ_results, grayscale_results, TRI] = ...
% pointsOnSpheres(no_of_radii, folder, center_x, center_y, center_z, voxeldim, no_of_img, spacing, radius_of_yeast)
%function [x,y,z,vi,xi,yi,zi, a, b, c, locationX_results, locationY_results, locationZ_results, grayscale_results, TRI] ...
function [locationX_results, locationY_results, locationZ_results,grayscale_results,TRI] ...
    = pointsOnSpheres(no_of_radii, folder, center_x, center_y, center_z, voxeldim, no_of_img, spacing, radius_of_yeast)

%voxeldim = 0.414;
%no_of_img = 81;
%no_of_img = 501;
%no_of_img = 251;

%%%%
%no_of_img = no_of_img + 100;
%no_of_img = 150;
%center_z = center_z + 50;
%%%%

yeastcenter_notconverted = [center_x center_y center_z]; %1 based pixel coordinate (x y z) of the yeast center. 
%yeastcenter_notconverted = [178 183 33]; %1 based pixel coordinate (x y z) of the yeast center. 
%yeastcenter = (yeastcenter_notconverted - 1).*[0.414 0.414 0.828]; %x y z of the yeast center
yeastcenter = (yeastcenter_notconverted - 1).*spacing; %x y z of the yeast center


%img = zeros(512, 512, no_of_img);
%img = zeros(501, 501, no_of_img);
img = zeros(150, 150, no_of_img);

%file = strcat(folder, '/Stack00%02d.tif');
file = strcat(folder, '/stack%04d.tif');

%{
for i = 1:no_of_img - 100
    %It = imread(sprintf(file, i-1), 1);
    It = imread(sprintf(file, i-1), 1);
    if i == 1
        for lp = 1:51
            img(:,:,lp) = It;
        end
    elseif i == no_of_img - 100
        for lp = 1:51
            img(:,:,i+lp+49) = It;
        end
    else
        img(:,:,i+50) = It;
    end
end
%}

%%{
for i = 1:no_of_img
    %It = imread(sprintf(file, i-1), 1);
    It = imread(sprintf(file, i-1), 1);
    img(:,:,i) = It;
end
%%}


%radius = 4*voxeldim;
radius = radius_of_yeast;
%{
radius = 90*voxeldim;
%}
%radius = 50*voxeldim;
%radius = 7*voxeldim;

xi = [];
yi = [];
zi = [];

locationX_results = [];
locationY_results = [];
locationZ_results = [];


%generate no_of_radiii of concentric spheres and 
%generate the sampple points on the spheres with make_icosahedron
for i = 1:no_of_radii    
    [ a, b, c, TRI] = make_icosahedron(2, radius+i*voxeldim, 1, 0, 0);
%    [ a, b, c, TRI] = make_icosahedron(3, radius+i*voxeldim, 1, 0, 0);
%    [ a, b, c, TRI] = make_icosahedron(3, radius_of_yeast+i*voxeldim, 1, 0, 0);
    xi = [xi ; a+yeastcenter(1)];
    yi = [yi ; b+yeastcenter(2)];
    zi = [zi ; c+yeastcenter(3)];
    locationX_results = [locationX_results ; a];
    locationY_results = [locationY_results ; b];
    locationZ_results = [locationZ_results ; c];
end

xmax = (size(img,1)-1)*spacing(1);
ymax = (size(img,1)-1)*spacing(2);
zmax = (no_of_img-1)*spacing(3);

%[x, y, z] = meshgrid(0:0.414:xmax, 0:0.414:ymax, 0:0.828:zmax);
[x, y, z] = meshgrid(0:spacing(1):xmax, 0:spacing(2):ymax, 0:spacing(3):zmax);

%%%%%%%%%%%%%%%%
%{
hey = radius_of_yeast+voxeldim;
%[x, y, z] = meshgrid(0:0.414:xmax, 0:0.414:ymax, 0:0.828:zmax);
[x, y, z] = meshgrid(0:spacing(1):xmax, 0:spacing(2):ymax, 0:spacing(3):zmax);
[xif, yif, zif] = meshgrid(0:spacing(1):xmax, 0:spacing(2):ymax, yeastcenter(3)-hey);
%[xif, yif, zif] = meshgrid(yeastcenter(1)-hey:spacing(1):yeastcenter(1)+hey, yeastcenter(2)-hey:spacing(2):yeastcenter(2)+hey, yeastcenter(3));
%}
%%%%%%%%%%%%%%%%%

v = img;
grayscale_results = [];
for ind = 1:no_of_radii
    vi = interp3(x,y,z,v,xi(ind,:),yi(ind,:),zi(ind,:));
    grayscale_results = [grayscale_results ; vi];
end
