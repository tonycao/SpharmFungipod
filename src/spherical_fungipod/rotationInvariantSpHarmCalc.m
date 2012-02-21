function [rotationInvariant] = rotationInvariantSpHarmCalc(max_degree, spharm)

rotationInvariant = zeros(1,max_degree+1);
pos = 1;

for ind = 0:max_degree
%    rotationInvariant(ind+1) = sqrt(sum(spharm(pos:(pos+ind*2)).^2));
%    rotationInvariant(ind+1) = norm(sum(spharm(pos:(pos+ind*2))),2);
    rotationInvariant(ind+1) = norm(spharm(pos:(pos+ind*2)),2);
    
    pos = (pos+ind*2)+1;
end

%{
rotationInvariant = zeros(1,4);

rotationInvariant(1) = sqrt(sum(spharm(1).^2));
rotationInvariant(2) = sqrt(sum(spharm(2:4).^2));
rotationInvariant(3) = sqrt(sum(spharm(5:9).^2));
rotationInvariant(4) = sqrt(sum(spharm(10:16).^2));
%}