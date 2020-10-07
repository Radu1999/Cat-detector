function [sol] = hsvHistogram(path_to_image, count_bins)
  [H, S, V] = myrgb2hsv(path_to_image);
  h = accumarray(fix(double(reshape(H, [], 1)) * 100 * count_bins / 101 + 1), 1);
  s = accumarray(fix(double(reshape(S, [], 1)) * 100 * count_bins / 101 + 1), 1);
  v = accumarray(fix(double(reshape(V, [], 1)) * 100 * count_bins / 101 + 1), 1);
  [n, m] = size(H);
  if size(h, 1) < count_bins
    h(count_bins) = 0;
  endif
  if size(s, 1) < count_bins
    s(count_bins) = 0;
  endif
  if size(v, 1) < count_bins
    v(count_bins) = 0;
  endif
  sol = [h', s', v'];
end