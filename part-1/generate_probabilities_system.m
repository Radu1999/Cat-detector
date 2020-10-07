function [A, b] = generate_probabilities_system(rows)
  A(1,1) = 4;
  A(1,2:3) = -1;
  lft = 2;
  rght = 3;
  step = 1;
  count  = rows * (rows + 1) / 2;
  b = zeros(rows, 1);
  for i = 2:count
    if step + 1 < rows 
      if i == lft
        A(i, i) = 5;
        A(i, i + 1) = -1;
        A(i, i - step) = -1;
        A(i, i + step + 1) = -1;
        A(i, i + step + 2) = -1;
      elseif i == rght
        A(i, i) = 5;
        A(i, i - 1) = - 1;
        A(i, i - step - 1) = -1;
        A(i, i + step + 2) = -1;
        A(i, i + step + 1) = -1;
        step++;
        lft  = lft + step;
        rght = rght + step + 1;
      else
        A(i, i) = 6;
        A(i, i - 1) = -1;
        A(i, i + 1) = -1;
        A(i, i - step - 1) = -1;
        A(i, i - step) = -1;
        A(i, i + step + 2) = -1;
        A(i, i + step + 1) = -1;
      endif
    else
      if i == lft
        A(i, i) = 4;
        A(i, i + 1) = -1;
        A(i, i - step) = -1;
      elseif i == rght
        A(i, i) = 4;
        A(i, i - 1) = - 1;
        A(i, i - step - 1) = -1;
        step++;
        lft  = lft + step;
        rght = rght + step + 1;
      else
        A(i, i) = 5;
        A(i, i - 1) = -1;
        A(i, i + 1) = -1;
        A(i, i - step - 1) = -1;
        A(i, i - step) = -1;
      endif
      b(i) = 1;
    endif

  endfor
endfunction