
no_of_img = 81;
yeastcenter = [178 183 33];

mat = zeros(512,512,no_of_img);

for i=100:300
    i
    for j=100:250
        for k=1:no_of_img
            dist = pdist([yeastcenter; i j k]);
            if round(dist) < 20
                mat(i,j,k) = 255-round(dist);
            end
        end
    end
end
