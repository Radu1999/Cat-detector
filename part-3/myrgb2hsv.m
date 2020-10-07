function [H, S, V]  = myrgb2hsv(path_to_image)
  image = imread(path_to_image);
  [n, m, k] = size(image);
  R = reshape(image(:, :, 1), 1, []);
  G = reshape(image(:, :, 2), 1, []);
  B = reshape(image(:, :, 3), 1, []);
  sz = size(R);
  H = zeros(n, m);
  S = zeros(n, m);
  V = zeros(n, m);
  r = double(R) / 255;
  g = double(G) / 255;
  b = double(B) / 255;
  size = n * m;
  h = zeros(1, size);
  s = zeros(1, size);
  v = zeros(1, size);
  cmax = max([r; g; b]);
  cmin = min([r; g; b]);
  delta = cmax - cmin;
  h(delta == 0) = 0;
  h(delta ~= 0  & cmax == r) = 60 * mod((g(delta ~= 0  & cmax == r) - b(delta ~= 0  & cmax == r)) ./ delta(delta ~= 0  & cmax == r), 6);
  h(delta ~= 0  & cmax == g) = 60 * ((b(delta ~= 0  & cmax == g) - r(delta ~= 0  & cmax == g)) ./ delta(delta ~= 0  & cmax == g) + 2);
  h(delta ~= 0  & cmax == b) = 60 * ((r(delta ~= 0  & cmax == b) - g(delta ~= 0  & cmax == b)) ./ delta(delta ~= 0  & cmax == b) + 4);
  h = h / 360;
  s(cmax ==  0) = 0;
  s(cmax ~=0 ) = delta(cmax ~= 0) ./ cmax(cmax ~= 0);
  v = cmax;
  H = reshape(h, [n, m]);
  S = reshape(s, [n, m]);
  V = reshape(v, [n, m]);
  
endfunction
  
  