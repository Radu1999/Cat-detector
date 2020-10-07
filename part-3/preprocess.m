function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  path1 = fullfile(path_to_dataset, "cats");
  path2 = fullfile(path_to_dataset, "not_cats");
  images_cats = dir(fullfile(path1, '*.jpg'));
  images_not_cats = dir(fullfile(path2, '*.jpg'));
  n_cats = length(images_cats);
  n_not_cats =  length(images_not_cats);
  X = zeros(n_cats + n_not_cats, 3 * count_bins);
  y = zeros(n_not_cats, 1);
  hstype = 0;
  y(1 : n_cats) = 1;
  y((n_cats + 1) : (n_cats + n_not_cats)) = -1;
  if histogram == "HSV"
    hstype = 1;
  endif
  for i = 1 : n_cats
    name = fullfile(path1, images_cats(i).name);
    img = imread(name);
    if hstype == 0
      X(i, :) = rgbHistogram(name, count_bins);
    else
      X(i, :) = hsvHistogram(name, count_bins);
    endif
  endfor
  for i = n_cats + 1 : n_not_cats
    name = fullfile(path2, images_not_cats(i).name);
    img = imread(name);
    if hstype == 0
      X(i, :) = rgbHistogram(name, count_bins);
    else
      X(i, :) = hsvHistogram(name, count_bins);
    endif
  endfor
    
  
endfunction
