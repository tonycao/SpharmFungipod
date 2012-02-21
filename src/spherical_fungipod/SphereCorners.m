
%{
no_of_img = 81;
yeastcenter = [178 183 33];

img = zeros(512,512,no_of_img);

for i=100:300
    i
    for j=100:250
        for k=1:no_of_img
            dist = pdist([yeastcenter; i j k]);
            if round(dist) < 10
                img(i,j,k) = 255-round(dist);
            end
        end
    end
end
%}

%%
voxeldim = 0.414;
no_of_img = 81;
yeastcenter_notconverted = [178 183 33]; %1 based pixel coordinate (x y z) of the yeast center. 
yeastcenter = (yeastcenter_notconverted - 1).*[0.414 0.414 0.200]; %x y z of the yeast center

img = zeros(512, 512, no_of_img);
for i = 1:no_of_img
    It = imread(sprintf('G:/Users/serdar/Desktop/myspherical/8bit/Stack00%02d.tif', i-1), 1);
    img(:,:,i) = It;
end

radius = 4*voxeldim;

nodevalues = zeros(16,42);    

%img'yi interpolate edip, ordan gelen degerleri nodevalues'a koyman lazim.

xi = [];
yi = [];
zi = [];
for i = 1:16
    [ a, b, c, TRI] = make_icosahedron(2, radius+i*voxeldim, 1, 0, 0);
%    a = a + yeastcenter(1);
%    b = b + yeastcenter(2);
%    c = c + yeastcenter(3);
    xi = [xi ; a+yeastcenter(1)];
    yi = [yi ; b+yeastcenter(2)];
    zi = [zi ; c+yeastcenter(3)];

%    for j = 1:42
%       nodevalues(i,j) = img(round(a(j)),round(b(j)),round(c(j)));
%    end

end

%dlmwrite('D:/cakici/DATA/fungipod/actin_01/values.txt', nodevalues, ' ');

xmax = (size(img,1)-1)*0.414;
ymax = (size(img,1)-1)*0.414;
zmax = (no_of_img-1)*0.200;
%%
[x, y, z] = meshgrid(0:0.414:xmax, 0:0.414:ymax, 0:0.200:zmax);

%%
v = img;
vi = interp3(x,y,z,v,xi(1,:),yi(1,:),zi(1,:)); % vi is 25-by-40-by-25
%vi = interp3(x,y,z,v,a,b,c); % vi is 25-by-40-by-25
%slice(xi,yi,zi,vi,[6 9.5],2,[-2 .2]), shading flat

