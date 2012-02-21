all_grayscale = [];
all_regular = [];
all_invariant = [];

folder = [];
%folder = [folder ; 'G:/Users/serdar/Desktop/pseudo/perfectsphere'];

% each one is a folder that holds 2D stack of images of a yeast-fungipod 
% complex (i.e. not the whole specimen with many yeasts, but just a single
% yeast with its fungipods)
folder = [folder ; '../artifical_images/f1a'];
folder = [folder ; '../artifical_images/f1b'];
folder = [folder ; '../artifical_images/f1c'];
folder = [folder ; '../artifical_images/f1d'];

folder = [folder ; '../artifical_images/f2a'];
folder = [folder ; '../artifical_images/f2b'];
folder = [folder ; '../artifical_images/f2c'];
folder = [folder ; '../artifical_images/f2d'];

folder = [folder ; '../artifical_images/f3a'];
folder = [folder ; '../artifical_images/f3b'];
folder = [folder ; '../artifical_images/f3c'];
folder = [folder ; '../artifical_images/f3d'];

for q = 1:size(folder,1)
    q
    [temp_grayscale, temp_regular, temp_invariant] = calculate(folder(q,:));
    all_grayscale = cat(3,all_grayscale,temp_grayscale);
    all_regular = cat(3,all_regular,temp_regular);
    all_invariant = cat(3,all_invariant,temp_invariant);
end

temp_fung = squeeze(all_invariant)';

with_1_fung = temp_fung(1:4,:);
with_2_fung = temp_fung(5:8,:);
with_3_fung = temp_fung(9:12,:);

%%
dist_1_1 = dist2(with_1_fung,with_1_fung);
dist_1_2 = dist2(with_1_fung,with_2_fung);
dist_1_3 = dist2(with_1_fung,with_3_fung);

dist_2_1 = dist2(with_2_fung,with_1_fung);
dist_2_2 = dist2(with_2_fung,with_2_fung);
dist_2_3 = dist2(with_2_fung,with_3_fung);

dist_3_1 = dist2(with_3_fung,with_1_fung);
dist_3_2 = dist2(with_3_fung,with_2_fung);
dist_3_3 = dist2(with_3_fung,with_3_fung);