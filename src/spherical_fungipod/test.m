%%
%folder = 'G:/Users/serdar/Desktop/myspherical/8bit';
folder = '/artifical_images/f1a';
%center_x = 178;
%center_y = 183;
%center_z = 33;

center_x = 75;
center_y = 75;
center_z = 75;

voxeldim = 0.414;
radius = 4*voxeldim;
no_of_img = 149;
no_of_radii = 10
spacing = [1 1 1];

%grayscale values at each node at each radius level
%42 nodes per level.
%each row has 42 nodes of a level
%first row has the smallest radius; last row has the biggest.
%all "loc"s are coordinates of nodes WITH THE SPHERES' CENTER AT 0,0,0
%pointsOnSpheres(no_of_radii, folder, center_x, center_y, center_z, voxeldim, no_of_img, spacing, radius_of_yeast)
[locX, locY, locZ, grayscale] = pointsOnSpheres(no_of_radii, folder, center_x, center_y, center_z, voxeldim, no_of_img, spacing, radius);

%each row consists of the coefficients of a given radius level
allSphereRegularCoefficients = [];

%each row consists of the rotation invariant coefficients of a given radius level
allSphereRotationInvariantCoefficients = [];

%%
for i = 1:no_of_radii
    sphericalHarmonics = [];
    revisedspharm = [];
  %  for j = 1:42
  j=10;
        % regularSphericalHarmonicsAtANode(theta, phi)
        [spharm] = regularSphericalHarmonicsAtANode(locX(i,j),locY(i,j),locZ(i,j),radius+i*voxeldim);
        sphericalHarmonics = [sphericalHarmonics ; spharm];

        [theta,phi,r] = cart2sph(locX(i,j),locY(i,j),locZ(i,j));
        invariant = [];
        for k = 0:3
            for m = -k:k
                invariant = [invariant spharmOfAGivenDegreeandOrder(k, m, theta, phi)];
            end
        end
        revisedspharm = [revisedspharm ; invariant];
   % end
end
