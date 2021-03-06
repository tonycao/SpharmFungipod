clear all
clc

load('descriptor_5.mat');
%folder = [];

no_of_img = 121*ones(1,30);

center = 31*ones(30,3);
iorder = 1:30;
center = [center iorder'];
%{
grouplabel = [4 1 1 ...
    2 1 2 3 ...
    1 ...
    1 2 1 1 ...
    2 2 ...
    1 1 4 1 NaN 1 ...
    NaN NaN 1 6 2 ...
    4 0 2 5 3];
%}

% label from fungipods locations
%{
grouplabel = [3 1 2 ...
    2 1 2 3 ...
    1 ...
    1 1 1 1 ...
    2 2 ...
    1 1 3 1 1 1 ...
    1 3 2 4 2 ...
    3 1 1 4 2];
%}

% labeled by myself
%{
grouplabel = [3 0 1(2) ...
    1 1(0) 1 2 ...
    1(0) ...
    1 2 1 1 ...
    2(1) 2 ...
    1 1 4 1(0) 1(0) 1 ...
    1 3 1 4 2 ...
    4 0 0 4 2];
%}

% 1 and VS others
grouplabel = [1 0 0 ...
    1 0 1 1 ...
    0 ...
    0 1 0 0 ...
    1 1 ...
    0 0 1 0 0 0 ...
    0 0 0 1 1 ...
    1 0 1 1 1];

%center = [center grouplabel'];
%center = sortrows(center, 5);
%[folder, center, no_of_img] = folders_and_yeast_centers();
%folder = [folder ; 'G:/Users/serdar/Desktop/pseudo/perfectsphere'];


%{
voxeldim = 0.414;
spacing = [0.414 0.414 0.200];
no_of_radii = 5;
radius_of_yeast = 10*voxeldim;
%}
%%{
voxeldim = 0.414;
spacing = [0.414 0.414 0.200];
normalize = 0;
classrate = zeros(10,10);

for inoradii = 1:10
    for iradiiyeast = 1:10
        %{
        no_of_radii = inoradii;
        radius_of_yeast = iradiiyeast*voxeldim;
        %%}
        row_no = 1;
        invariant = [];
  
        for q = 1:size(folder,1)
            %q
            check = 1;
            while check == 1
                if(row_no <= size(center,1) && center(row_no,4) == q)
                    
                    [temp_x, temp_y, temp_z, temp_grayscale, temp_regular, temp_invariant, temp_TRI] ...
                        = calculate(center(row_no,1:3), folder(q,:), voxeldim, no_of_img(q), spacing, no_of_radii, radius_of_yeast);
                    
                    if normalize ==1
                        temp_invariant = temp_invariant/norm(temp_invariant);
                    end
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
        %}
        
        %% use descriptor.mat
        conf_all = descriptor{iradiiyeast + (inoradii-1)*10};
        %%
        
        %all_dist= dist2(conf_all,conf_all);
        %figure, imagesc(all_dist), colorbar, colormap hot, title ''
        %%
        
        %%
        %all_dist= dist2(temp_fung,temp_fung);
        sortall = [grouplabel' center conf_all];
        
        %trainingSet = conf_all;
        %grouplabel = center(:,5);
        nan_location = find(isnan(grouplabel));
        sortall(nan_location,:) = [];
        sortall = sortrows(sortall, 1);
        
        trainingSetclean = sortall(:, 6:end);
        %trainingSetclean(nan_location,:) = [];
        %labelclean = grouplabel;
        %labelclean(nan_location) = [];
        labelclean = sortall(:,1);
        
        % knn test
        sizeTraining = size(trainingSetclean,1);
        label = [];
        for i=1:sizeTraining
            %i
            test = trainingSetclean(i,:);
            training = trainingSetclean;
            training(i,:) = [];
            group = labelclean;
            group(i,:) = [];
            
            label(i) = knnclassify(test, training, group, 3);
            
            % display([num2str(i) 'th test case labeled as ' num2str(label(i)) ', true label is ' num2str(labelclean(i))]);
        end
        
        classrate(inoradii, iradiiyeast) = sum((label' - labelclean)==0)/size(labelclean,1);
        
        [inoradii iradiiyeast classrate(inoradii, iradiiyeast)]
        
    end
end
max(classrate(:))
%classrate
