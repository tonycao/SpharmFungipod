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
%no_of_img = [150 150 150 150 150 150 150 150 150 150 150 150];
no_of_img = 121*ones(1,30);
%{
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
%}

center = 31*ones(30,3);
iorder = 1:30;
center = [center iorder'];
grouplabel = [4 1 1 2 1 2 3 1 1 2 1 1 2 2 1 1 4 1 NaN 1 NaN NaN 1 6 2 4 0 2 5 3];

%[folder, center, no_of_img] = folders_and_yeast_centers();

invariant_with_fung_0 = [];
invariant_with_fung_1 = [];
invariant_with_fung_2 = [];
invariant_with_fung_3 = [];
invariant_with_fung_4 = [];

invariant = [];

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
folder = [folder ; '../data/fungipod numbers/clipped_actin/1/1'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/1/2'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/1/3'];

folder = [folder ; '../data/fungipod numbers/clipped_actin/2/1'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/2/2'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/2/3'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/2/4'];

folder = [folder ; '../data/fungipod numbers/clipped_actin/3/1'];

folder = [folder ; '../data/fungipod numbers/clipped_actin/4/1'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/4/2'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/4/3'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/4/4'];

folder = [folder ; '../data/fungipod numbers/clipped_actin/5/1'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/5/2'];

folder = [folder ; '../data/fungipod numbers/clipped_actin/6/1'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/6/2'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/6/3'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/6/4'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/6/5'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/6/6'];

folder = [folder ; '../data/fungipod numbers/clipped_actin/7/1'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/7/2'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/7/3'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/7/4'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/7/5'];

folder = [folder ; '../data/fungipod numbers/clipped_actin/8/1'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/8/2'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/8/3'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/8/4'];
folder = [folder ; '../data/fungipod numbers/clipped_actin/8/5'];
%%}

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
no_of_radii = 10;
radius_of_yeast = 4*voxeldim;
%%}

for q = 1:size(folder,1)
    q
    
    check = 1;
    while check == 1
        if(row_no <= size(center,1) && center(row_no,4) == q)
            
            [temp_x, temp_y, temp_z, temp_grayscale, temp_regular, temp_invariant, temp_TRI] ...
                = calculate(center(row_no,1:3), folder(q,:), voxeldim, no_of_img(q), spacing, no_of_radii, radius_of_yeast);
            
            %{
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
            %}
            invariant = cat(3, invariant, temp_invariant);
            row_no = row_no + 1;
            
        else
            check = 0;
        end
    end
    
end

%%%%%%%%%%%%
%all = cat(3,invariant_with_fung_1,invariant_with_fung_2,invariant_with_fung_3,invariant_with_fung_4);
all = invariant;
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
%grouplabel = center(:,5);
nan_location = find(isnan(grouplabel));

trainingSetclean = trainingSet;
trainingSetclean(nan_location,:) = [];
labelclean = grouplabel;
labelclean(nan_location) = [];

% knn test
sizeTraining = size(trainingSetclean,1);
for i=1:sizeTraining
   test = trainingSetclean(i,:);
   training = trainingSetclean;
   training(i,:) = [];
   group = labelclean';
   group(i,:) = [];
   
   label = knnclassify(test, training, group);
   
   display([num2str(i) 'th test case labeled as ' num2str(label) '']);
end



