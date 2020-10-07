function [cost] = compute_cost_pc(points, centroids)
  [n, d] = size(points);
  [NC, d] = size(centroids);
  cost = 0;
  for i = 1  : n
    min = 99999;
    for j = 1 : NC
      dist = norm(points(i, :) - centroids(j,:), 2);
      if dist < min
        min = dist;
      endif
    endfor
    cost = cost + min;
  endfor
  
endfunction

