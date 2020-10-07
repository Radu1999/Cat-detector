function [w] = learn(X, y, lr, epochs)
  [n, m] = size(X);
  w =  -0.1 + (0.2)*rand(1, m + 1);
  X = scale(X, m);
  v(1:n, 1) = 1;
  X1 = [X, v];
  sum = 0;
   for epoch = 1:epochs
    rnd = randperm(n, 64);
     w = w - lr * 1/n * (X1(rnd,:) * w' - y(rnd))' * X1(rnd, :);
  endfor
      
    
endfunction
