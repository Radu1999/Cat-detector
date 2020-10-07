function [values, colind, rowptr] = matrix_to_csr(A)
  [n, n] = size(A);
  values = [];
  colind = [];
  rowptr = [];
  curr_num = 0;
  size_rowptr = 0;
  for i = 1:n 
    ok = 0;
    for j = 1:n;
      if A(i,j) ~= 0 
        values(++curr_num) = A(i, j);
        colind(curr_num) = j;
        if ok == 0 
          ok = 1;
          rowptr(++size_rowptr) = curr_num;
        endif  
      endif
    endfor
  endfor
  rowptr(n + 1) = curr_num + 1;
endfunction