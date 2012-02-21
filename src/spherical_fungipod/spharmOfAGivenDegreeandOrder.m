function [rotationVariant] = spharmOfAGivenDegreeandOrder(degree, order, theta, phi)

i = sqrt(-1);

leg_temp = legendre(degree,cos(theta));
%leg_temp = legendre(degree,cos(theta),'norm');

leg_pos = leg_temp(abs(order)+1);

if order < 0
    leg_neg = ((-1)^(abs(order))) * (factorial(degree-abs(order))/factorial(degree+abs(order))) * leg_pos;
    rotationVariant = sqrt(((2*degree+1)/(4*pi))*(factorial(degree-order)/factorial(degree+order))) * leg_neg * exp(i*order*phi); 
else
    rotationVariant = sqrt(((2*degree+1)/(4*pi))*(factorial(degree-order)/factorial(degree+order))) * leg_pos * exp(i*order*phi); 
end



%{
leg_temp = legendre(degree,cos(theta));
if order < 0
    leg = abs(leg_temp(abs(order)+1));
else
    leg = leg_temp(abs(order)+1);
end

rotationInvariant = sqrt(((2*degree+1)/(4*pi))*(factorial(degree-abs(order))/factorial(degree+abs(order)))) * leg * exp(i*order*phi); 
%}