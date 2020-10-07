function [x] = SST(A, b)
  [n, m] = size(A);
  lst = n;
  if n < m
    A(m, m) = 0;
  endif
  sz = m;
  x = zeros(1, sz);
  if A(sz, sz) ~= 0
    x(sz) = b(sz) / A(sz, sz);
  else
    x(sz) = 0;
  endif
  for i = (sz - 1):-1:1
    if A(i,i) ~= 0
      x(i) = (b(i) - sum(A(i, i + 1 : sz) .* x(i + 1 : sz))) / A(i,i);
    else
      x(i) = 0;
    endif
  endfor
  
endfunction