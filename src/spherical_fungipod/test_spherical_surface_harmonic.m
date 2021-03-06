% Define constants.
degree = 3;
order = 1;

% Create the grid
delta = pi/40;
theta = 0 : delta : pi; % altitude
phi = 0 : 2*delta : 2*pi; % azimuth
[phi,theta] = meshgrid(phi,theta);

% Calculate the harmonic
Ymn = legendre(degree,cos(theta));
if degree ~= 0
    Ymn = squeeze(Ymn(abs(order)+1,:,:));
end

Kmn = sqrt(((2*degree+1)/4*pi)*(factorial((degree - order))/factorial( order + degree )));

i = sqrt(-1);

Yml = Kmn*Ymn.*exp(i*order.*phi);

rho = real(Yml).^2;
rho2 = imag(Yml).^2;
% Apply spherical coordinate equations

[x,y,z] = sph2cart(phi, theta-pi/2, rho);

% Plot the surface
clf
surf(x,y,z)
light
lighting phong
axis tight equal off
view(40,30)
camzoom(1.5)

