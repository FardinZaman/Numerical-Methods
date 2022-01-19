function constants = multi_lin_regress(x,y)
  
  [m,n] = size(x);
  
  matrix = zeros(m+1,m+1);
  for row=2:m+1
    for col=2:m+1
      for i=1:n
        matrix(row,col) = matrix(row,col) + x(row-1,i)*x(col-1,i);
      end
    end
  end
  
  for j=1:m
    for k=1:n
      matrix(1,j+1) = matrix(1,j+1) + x(j,k);
      matrix(j+1,1) = matrix(j+1,1) + x(j,k);
    end
  end
  
  matrix(1,1) = n;
  
  col_matrix = zeros(m+1,1);
  for l=1:m
    for p=1:n
      col_matrix(l+1,1) = col_matrix(l+1,1) + x(l,p)*y(p);
    end
  end
  
  for q=1:n
    col_matrix(1,1) = col_matrix(1,1) + y(q);
  end
  
  constants = GaussPivot(matrix,col_matrix);
  
  
  %y_reg = zeros(m+1);
  %for r=1:m+1
    %y_reg(r) = result(1);
  %end
  
    