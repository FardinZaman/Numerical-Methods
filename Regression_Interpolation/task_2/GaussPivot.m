function x = GaussPivot(A , b)
  [m,n] = size(A);
  if m~=n
    error('Matrix A must eb square');
  end
  
  nb = n+1;
  Aug = [A b];
  
  for k = 1:n-1
    [big,position] = max(abs(Aug(k:n,k)));
    ipr = position+k-1;
    if ipr~=k
      Aug([k,ipr],:) = Aug([ipr,k],:);
    end
    
    for i = k+1:n
      factor = Aug(i,k)/Aug(k,k);
      Aug(i,k:nb) = Aug(i,k:nb) - factor*Aug(k,k:nb);
    end
  end
  %Aug
  
  x = zeros(n,1);
  x(n) = Aug(n,nb)/Aug(n,n);
  for j = n-1:-1:1
    x(j) = (Aug(j,nb) - Aug(j,j+1:n)*x(j+1:n,1))/Aug(j,j);
  end