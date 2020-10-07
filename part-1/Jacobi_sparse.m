function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  [ln, num] = size(G_rowptr);
  x0 = zeros(1, num - 1);
  step = 1000;
  while step > 0
    x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;
    if norm(x - x0) <= tol
      return;
    endif
    x0 = x;
    step--;
    
  endwhile
endfunction