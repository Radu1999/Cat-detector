function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  path1 = fullfile(path_to_testset, 'cats');
  path2 = fullfile(path_to_testset, 'not_cats');
  images_cats = dir(fullfile(path1, '*.jpg'));
  images_not_cats = dir(fullfile(path2, '*.jpg'));
  n_cats = length(images_cats);
  n_not_cats = length(images_not_cats);
  correct = 0;
  hstype = 0;
  if histogram == "HSV"
    hstype = 1;
  endif
  for i = 1 : n_cats
    name = fullfile(path1, images_cats(i).name);
    img = imread(name);
    if hstype == 0
      x = rgbHistogram(name, count_bins);
    else
      x = hsvHistogram(name, count_bins);
    endif
    [k, n] = size(x);
    x(n + 1) = 1;
    y = w * x';
    if y >= 0
      correct++;
    endif
  endfor
  
  for i = 1 : n_not_cats
    name = fullfile(path2, images_not_cats(i).name);
    img = imread(name);
    if hstype == 0
      x = rgbHistogram(name, count_bins);
    else
      x = hsvHistogram(name, count_bins);
    endif
    [k, n] = size(x);
    x(n + 1) = 1;
    y = w * x';   
    if y < 0
      correct++;  
    endif
  endfor
  percentage = correct / (n_cats + n_not_cats);
     
     
endfunction