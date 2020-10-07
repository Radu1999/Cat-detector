function [G_J, c_J] = Jacobi_factorization(A, b)
  N = diag(diag(A));
  invN = inv(N);
  G_J = invN * (N - A);
  c_J = invN * b;
  
endfunction
