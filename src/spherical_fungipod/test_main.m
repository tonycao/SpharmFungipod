all_grayscale = [];
all_regular = [];
all_invariant = [];
all_x = [];
all_y = [];
all_z = [];

all_TRI = [];

folder = [];
%{
no_of_img = [501 501 501 501 501 501 501 501 501 501 501 501];
center = [
250 250 250 1 1;
250 250 250 2 1;
250 250 250 3 1;
250 250 250 4 1;
250 250 250 5 2;
250 250 250 6 2;
250 250 250 7 2;
250 250 250 8 2;
250 250 250 9 3;
250 250 250 10 3;
250 250 250 11 3;
250 250 250 12 3;
];
%}
no_of_img = [150 150 150 150 150 150 150 150 150 150 150 150];
center = [
75 75 75 1 1;
75 75 75 2 1;
75 75 75 3 1;
75 75 75 4 1;
75 75 75 5 2;
75 75 75 6 2;
75 75 75 7 2;
75 75 75 8 2;
75 75 75 9 3;
75 75 75 10 3;
75 75 75 11 3;
75 75 75 12 3;
];

%[folder, center, no_of_img] = folders_and_yeast_centers();

invariant_with_fung_0 = [];
invariant_with_fung_1 = [];
invariant_with_fung_2 = [];
invariant_with_fung_3 = [];
invariant_with_fung_4 = [];

regular_with_fung_0 = [];
regular_with_fung_1 = [];
regular_with_fung_2 = [];
regular_with_fung_3 = [];
regular_with_fung_4 = [];

grayscale_with_fung_0 = [];
grayscale_with_fung_1 = [];
grayscale_with_fung_2 = [];
grayscale_with_fung_3 = [];
grayscale_with_fung_4 = [];


%folder = [folder ; 'G:/Users/serdar/Desktop/pseudo/perfectsphere'];

% each one is a folder that holds 2D stack of images of a yeast-fungipod 
% complex (i.e. not the whole specimen with many yeasts, but just a single
% yeast with its fungipods)
%folder = [folder ; 'C:/Users/cakici/Desktop/test_image_maker/g000'];

%%{
folder = [folder ; '../data/artifical_images/f1a'];
folder = [folder ; '../data/artifical_images/f1b'];
folder = [folder ; '../data/artifical_images/f1c'];
folder = [folder ; '../data/artifical_images/f1d'];
folder = [folder ; '../data/artifical_images/f2a'];
folder = [folder ; '../data/artifical_images/f2b'];
folder = [folder ; '../data/artifical_images/f2c'];
folder = [folder ; '../data/artifical_images/f2d'];
folder = [folder ; '../data/artifical_images/f3a'];
folder = [folder ; '../data/artifical_images/f3b'];
folder = [folder ; '../data/artifical_images/f3c'];
folder = [folder ; '../data/artifical_images/f3d'];
%%}

%{
for q = 1:size(folder,1)
    q
    [temp_x, temp_y, temp_z, temp_grayscale, temp_regular, temp_invariant, temp_TRI] = calculate(folder(q,:));
    all_grayscale = cat(3,all_grayscale,temp_grayscale);
    all_regular = cat(3,all_regular,temp_regular);
    all_invariant = cat(3,all_invariant,temp_invariant);
    
    all_x = cat(3,all_x,temp_x);
    all_y = cat(3,all_y,temp_y);
    all_z = cat(3,all_z,temp_z);
    
    all_TRI = cat(3,all_TRI,temp_TRI);
end
%}

row_no = 1;

%{
voxeldim = 0.414;
spacing = [0.414 0.414 0.200];
no_of_radii = 5;
radius_of_yeast = 10*voxeldim;
%}
%%{
voxeldim = 0.414;
spacing = [0.414 0.414 0.414];
no_of_radii = 5;
radius_of_yeast = 10*voxeldim;
%%}

for q = 1:size(folder,1)
    q
    
    check = 1;
    while check == 1
        if(row_no <= size(center,1) && center(row_no,4) == q)
            
            [temp_x, temp_y, temp_z, temp_grayscale, temp_regular, temp_invariant, temp_TRI] ...
                = calculate(center(row_no,1:3), folder(q,:), voxeldim, no_of_img(q), spacing, no_of_radii, radius_of_yeast);
            
            if(center(row_no,5) == 1)
                invariant_with_fung_1 = cat(3,invariant_with_fung_1,temp_invariant);
                regular_with_fung_1 = cat(3,regular_with_fung_1,temp_regular);
                grayscale_with_fung_1 = cat(3,grayscale_with_fung_1,temp_grayscale);
            elseif(center(row_no,5) == 2)
                invariant_with_fung_2 = cat(3,invariant_with_fung_2,temp_invariant);
                regular_with_fung_2 = cat(3,regular_with_fung_2,temp_regular);
                grayscale_with_fung_2 = cat(3,grayscale_with_fung_2,temp_grayscale);
            elseif(center(row_no,5) == 3)
                invariant_with_fung_3 = cat(3,invariant_with_fung_3,temp_invariant);
                regular_with_fung_3 = cat(3,regular_with_fung_3,temp_regular);
                grayscale_with_fung_3 = cat(3,grayscale_with_fung_3,temp_grayscale);
            elseif(center(row_no,5) == 4)
                invariant_with_fung_4 = cat(3,invariant_with_fung_4,temp_invariant);
                regular_with_fung_4 = cat(3,regular_with_fung_4,temp_regular);
                grayscale_with_fung_4 = cat(3,grayscale_with_fung_4,temp_grayscale);
            else
                
            end
            
            row_no = row_no + 1;
            
        else
            check = 0;
        end
    end
    
end

%%%%%%%%%%%%
all = cat(3,invariant_with_fung_1,invariant_with_fung_2,invariant_with_fung_3,invariant_with_fung_4);
%all = cat(3,invariant_with_fung_1,invariant_with_fung_2,invariant_with_fung_3);
conf_all = squeeze(all)';
all_dist= dist2(conf_all,conf_all);
figure, imagesc(all_dist), colorbar, colormap hot, title ''
%%%%%%%%%%%%

%temp_fung = squeeze(all_invariant)';
%burdaki ' olayina dikkat. conjugate aliyo gene galiba. disa bi tane "conj"
%koyman gerekebilir.

%with_1_fung = temp_fung(1:4,:);
%with_2_fung = temp_fung(5:8,:);
%with_3_fung = temp_fung(9:12,:);

%%
%all_dist= dist2(temp_fung,temp_fung);

trainingSet = conf_all;
grouplabel = center(:,5);

% knn test
sizeTraining = size(trainingSet,1);
for i=1:sizeTraining
   test = trainingSet(i,:);
   training = trainingSet;
   training(i,:) = [];
   group = grouplabel;
   group(i,:) = [];
   
   label = knnclassify(test, training, group);
   
   display([num2str(i) 'th test case labeled as ' num2str(label) '']);
end



