function fp = new_pol(x,y,point)
  
  n = length(x);
  b = zeros(n);
  
  %plot(x,y,'o');
  %hold on
  
  d = zeros(n-1,n-1);
  
  for i = 1:n-1
    d(i,1) = (y(i+1) - y(i))/(x(i+1) - x(i));
  end
  
  for j = 2:n-1
    for k = j:n-1
      d(k,j) = (d(k,j-1) - d(k-1,j-1))/(x(k+1) - x(k+1-j));
    end
  end
  
  %d
  
  b(1) = y(1);
  for l = 2:n
    b(l) = d(l-1,l-1);
  end
  
  %b
  
  difference = zeros(n);
  result = zeros(n);
  difference(1) = 1;
  result(1) = b(1);
  for m = 2:n
    difference(m) = (point - x(m-1)) * difference(m-1);
    result(m) = difference(m) * b(m);
  end
  
  %result
  
  s = sum(result);
  fp = s(1);
  
  error = zeros(n-1,1);
  for o = 1:n-1
    error(o,1) = result(o+1,1);
  end
  
  %error
  