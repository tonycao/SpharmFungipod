
[folder, center, no_of_img] = folders_and_yeast_centers();

base = 'Data/clipped_actin/';

for img_no = 8:8 %1:8

    img = zeros(512, 512, no_of_img(img_no)+100);
    %file = strcat(folder(img_no,:), '/stack%04d.tif');
    file = strcat(folder(img_no,:), '/dc10 actin%04d.tif');

    for i = 1:no_of_img(img_no)
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
    
    counter = 1;
    for q = 1:size(center,1)
        if center(q,4) == img_no
            img_size = no_of_img(img_no) + 100;
            center_x = center(q,1);
            center_y = center(q,2);
            center_z = center(q,3) + 50;
            
            [center_x center_y center_z-50]
            
            for k = 1:121
                writefile = strcat(base, '%d/%d/stack%03d.tif');
                %imwrite(uint8(img(center_x-30:center_x+30,center_y-30:center_y+30,center_z-61+k)), sprintf(writefile, img_no, counter, k));
                imwrite(uint8(img(center_y-30:center_y+30,center_x-30:center_x+30,center_z-61+k)), sprintf(writefile, img_no, counter, k));
            end         
            counter = counter + 1;
        else
            counter = 1;
        end
    end
end
