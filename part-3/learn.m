function [w] = learn(X, y)
  [n, m] = size(X);
  v(1:n, 1) = 1;
  tX = [X, v];
  [Q, R] = Householder(tX);
  b = Q' * y;
  w = SST(R, b); 
  
end
