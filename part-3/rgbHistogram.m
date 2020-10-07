function [sol] = rgbHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  [n,m,k] = size(image);
  R = accumarray(fix(double(reshape(image(:, :, 1), [], 1)) * count_bins / 256 + 1), 1);
  G = accumarray(fix(double(reshape(image(:, :, 2), [], 1)) * count_bins / 256 + 1), 1);  
  B = accumarray(fix(double(reshape(image(:, :, 3), [], 1)) * count_bins / 256 + 1), 1);
  if size(R, 1) < count_bins
    R(count_bins) = 0;
  endif
  if size(G, 1) < count_bins
    G(count_bins) = 0;
  endif
  if size(B, 1) < count_bins
    B(count_bins) = 0;
  endif
  sol = [R', G', B'];
  
end