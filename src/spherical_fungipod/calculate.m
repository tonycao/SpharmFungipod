%function [locX, locY locZ, grayscale, allSphereRegularCoefficients,
%allSphereRotationInvariantCoefficients, TRI] = calculate(folder)
function [locX, locY, locZ, grayscale, allSphereRegularCoefficients, allSphereRotationInvariantCoefficients, TRI] ...
    = calculate(center, folder, voxeldim, no_of_img, spacing, no_of_radii, radius_of_yeast)

%get point coordinates
%get grayscale values
%translate point coordinates to spherical coordinates
%calculate regular spharm coefficients
%calculate rotation invariant spharm coefficients

%%
%folder = 'G:/Users/serdar/Desktop/myspherical/8bit';
%center_x = 178;
%center_y = 183;
%center_z = 33;

%folder = 'G:/Users/serdar/Desktop/pseudo/f1a';
%{
center_x = 251; %251
center_y = 251;
center_z = 251;
%}

%no_of_radii = 10;

%grayscale values at each node at each radius level
%42 nodes per level.
%each row has 42 nodes of a level
%first row has the smallest radius; last row has the biggest.
%all "loc"s are coordinates of nodes WITH THE SPHERES' CENTER AT 0,0,0
[locX, locY, locZ, grayscale, TRI] = ...
    pointsOnSpheres(no_of_radii, folder, center(1), center(2), center(3), voxeldim, no_of_img, spacing, radius_of_yeast);
%[locX, locY, locZ, grayscale, TRI] = pointsOnSpheres(no_of_radii, folder, center_x, center_y, center_z);

%%

%each row consists of the coefficients of a given radius level
allSphereRegularCoefficients = [];

%each row consists of the rotation invariant coefficients of a given radius level
allSphereRotationInvariantCoefficients = [];

max_degree = 2; % i.e. "l" takes values between 0 and 6 (both included).
%max_degree = 4

basis_count = max_degree+1+(max_degree*(max_degree+1));

len = size(locX,2);
for ind_rad = 1:no_of_radii
    for ind_node = 1:len
        node_norm  = norm( [locX(ind_rad,ind_node) locY(ind_rad,ind_node) locZ(ind_rad,ind_node)] );       
        locX(ind_rad,ind_node) = locX(ind_rad,ind_node)/node_norm;
        locY(ind_rad,ind_node) = locY(ind_rad,ind_node)/node_norm;
        locZ(ind_rad,ind_node) = locZ(ind_rad,ind_node)/node_norm;
    end
end

for i = 1:no_of_radii
    revisedspharm = [];
    %for j = 1:42
    for j = 1:size(locX,2)
 %       [theta,phi,r] = cart2sph(locX(i,j),locY(i,j),locZ(i,j));
%%%%%%%%%%%%%%%%%%%%    
        temp_theta = atan2( locY(i,j), locX(i,j) );
        temp_phi = acos( locZ(i,j) );

        thetaPhysics = temp_phi;
        phiPhysics = temp_theta;
%%%%%%%%%%%%%%%%%%%%
        
%%{
        variant = [];
        for k = 0:max_degree
            for m = -k:k
                variant = [variant spharmOfAGivenDegreeandOrder(k, m, thetaPhysics, phiPhysics)];
            end
        end
%%}
%        variant = regularSphericalHarmonicsAtANode(locX(i,j),locY(i,j),locZ(i,j),r);
%        variant = regularSphericalHarmonicsAtANode(thetaPhysics, phiPhysics);
        revisedspharm = [revisedspharm ; variant];        
    end
    i

    
%%%%%%%%%%%%%%%%%%%%%%%%%

    for ind_temp = 1:basis_count
        revisedspharm(:,ind_temp) = revisedspharm(:,ind_temp)/norm(revisedspharm(:,ind_temp));
    end

%%%%%%%%%%%%%%%%%%%%%%%%%

    %sphereCoefficients = revisedspharm;    
    sphereCoefficients = revisedspharm \ grayscale(i,:)' ;
    allSphereRegularCoefficients = [allSphereRegularCoefficients ; conj(sphereCoefficients')]; %added conj to cancel out the automatic conj op by transpose op
    rotationInvariant = rotationInvariantSpHarmCalc(max_degree, conj(sphereCoefficients')); %added conj to cancel out the automatic conj op by transpose op
%    allSphereRotationInvariantCoefficients = [allSphereRotationInvariantCoefficients ; rotationInvariant];
    allSphereRotationInvariantCoefficients = [allSphereRotationInvariantCoefficients rotationInvariant];
    i
end
%%
