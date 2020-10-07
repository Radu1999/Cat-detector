function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  path1 = fullfile(path_to_testset, 'cats');
  path2 = fullfile(path_to_testset, 'not_cats');
  images_cats = dir(fullfile(path1, '*.jpg'));
  images_not_cats = dir(fullfile(path2, '*.jpg'));
  n_cats = length(images_cats);
  n_not_cats = length(images_not_cats);
  [X,k] = preprocess(path_to_testset, histogram, count_bins);
  [n, m] = size(X);
  scale(X, m);
  v(1:n, 1) = 1;
  X1 = [X, v];
  correct = 0;
  for i = 1 : n_cats
    y = w * X1(i, :)';
    if y >= 0
      correct++;
    endif
  endfor
  
  for i = (n_cats + 1) : n
    y = w * X1(i, :)';   
    if y < 0
      correct++;  
    endif
  endfor
  
  percentage = correct / (n_cats + n_not_cats);
     
     
endfunction