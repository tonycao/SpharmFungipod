function [spharm] = regularSphericalHarmonicsAtANode(theta, phi) %(x, y, z, r)

spharm = zeros(1,9);

%{
spharm(1) = 0.5*sqrt(1/pi);

%l = 1
spharm(2) = sqrt(3/(4*pi))*(x/r);
spharm(3) = sqrt(3/(4*pi))*(y/r);
spharm(4) = sqrt(3/(4*pi))*(z/r);

%l = 2
spharm(5) = 0.25*sqrt(5/pi)*( (-(x*x)-(y*y)+2*(z*z)) / (r*r) );
spharm(6) = 0.5*sqrt(15/pi)*( (y*z) / (r*r) );
spharm(7) = 0.5*sqrt(15/pi)*( (z*x) / (r*r) );
spharm(8) = 0.5*sqrt(15/pi)*( (x*y) / (r*r) );
spharm(9) = 0.25*sqrt(15/pi)*( (x*x - y*y) / (r*r) );
%}


i = sqrt(-1);

spharm(1) = 0.5*sqrt(1/pi);

%l = 1
spharm(2) = 0.5*sqrt(3/(2*pi))*exp(-i*phi)*sin(theta);
spharm(3) = 0.5*sqrt(3/(pi))*cos(theta);
spharm(4) = -0.5*sqrt(3/(2*pi))*exp(i*phi)*sin(theta);

%l = 2
spharm(5) = 0.25*sqrt(15/(2*pi))*exp(-2i*phi)*sin(theta)*sin(theta);
spharm(6) = 0.5*sqrt(15/(2*pi))*exp(-i*phi)*sin(theta)*cos(theta);
spharm(7) = 0.25*sqrt(5/(pi))*(3*cos(theta)*cos(theta)-1);
spharm(8) = -0.5*sqrt(15/(2*pi))*exp(i*phi)*sin(theta)*cos(theta);
spharm(9) = 0.25*sqrt(15/(2*pi))*exp(2i*phi)*sin(theta)*sin(theta);


%{
%l = 0
spharm(1) = 0.5*sqrt(1/pi);

%l = 1
spharm(2) = 0.5*sqrt(3/(2*pi))*((x-i*y)/r);
spharm(3) = 0.5*sqrt(3/pi)*(z/r);
spharm(4) = -0.5*sqrt(3/(2*pi))*((x+i*y)/r);

%l = 2
spharm(5) = 0.25*sqrt(15/(2*pi))*(((x-i*y)^2)/(r^2));
spharm(6) = 0.5*sqrt(15/(2*pi))*(((x-i*y)*z)/(r^2));
spharm(7) = 0.25*sqrt(5/(pi))*((2*(z^2)-(x^2)-(y^2))/(r^2));
spharm(8) = -0.5*sqrt(15/(2*pi))*(((x+i*y)*z)/(r^2));
spharm(9) = 0.25*sqrt(15/(2*pi))*(((x+i*y)^2)/(r^2));

%l = 3
spharm(10) = 0.125*sqrt(35/(pi))*(((x-i*y)^3)/(r^3));
spharm(11) = 0.25*sqrt(105/(2*pi))*(((x-i*y)^2)*z/(r^3));
spharm(12) = 0.125*sqrt(21/(pi))*(((x-i*y)*(4*(z^2)-(x^2)-(y^2)))/(r^3));
spharm(13) = 0.25*sqrt(7/(pi))*((z*(2*(z^2)-3*(x^2)-3*(y^2)))/(r^3));
spharm(14) = -0.125*sqrt(21/(pi))*(((x+i*y)*(4*(z^2)-(x^2)-(y^2)))/(r^3));
spharm(15) = 0.25*sqrt(105/(2*pi))*(((x+i*y)^2)*z/(r^3));
spharm(16) = -0.125*sqrt(35/(pi))*(((x+i*y)^3)/(r^3));


%l = 4

spharm(17) = (3/16)*sqrt(35/(2*pi))* (((x-i*y)^4)/(r^4));
spharm(18) = (3/8)*sqrt(35/pi)* (((x-i*y)^3*z)/(r^4));
spharm(19) = (3/8)*sqrt(5/(2*pi))* ((((x-i*y)^2)*(7*z^2-r^2))/(r^4));
spharm(20) = (3/8)*sqrt(5/pi)* (((x-i*y)*z*(7*z^2-3*r^2))/(r^4));
spharm(21) = (3/16)*sqrt(1/pi)* ((35*z^4 -30*z^2*r^2 +3*r^4)/(r^4));
spharm(22) = -(3/8)*sqrt(5/pi)* (((x+i*y)*z*(7*z^2-3*r^2))/(r^4));
spharm(23) = (3/8)*sqrt(5/(2*pi))* ((((x+i*y)^2)*(7*z^2-r^2))/(r^4));
spharm(24) = -(3/8)*sqrt(35/pi)* (((x+i*y)^3*z)/(r^4));
spharm(25) = (3/16)*sqrt(35/(2*pi))* (((x+i*y)^4)/(r^4));

%l = 5
spharm(26) = 
spharm(27) = 
spharm(28) = 
spharm(29) = 
spharm(30) = 
spharm(31) = 
spharm(32) = 
spharm(33) = 
spharm(34) = 
spharm(35) = 
spharm(36) = 

%l = 6
spharm(37) = 
spharm(38) = 
spharm(39) = 
spharm(40) = 
spharm(41) = 
spharm(42) = 
spharm(43) = 
spharm(44) = 
spharm(45) = 
spharm(46) = 
spharm(47) = 
spharm(48) = 
spharm(49) = 
%}