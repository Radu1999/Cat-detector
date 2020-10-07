function [X] = scale(X, m)
  for i = 1 : m
    X(:, i) =   (X(:, i) - mean(X(:, i))) / std(X(:, i));
  endfor
endfunction 
  