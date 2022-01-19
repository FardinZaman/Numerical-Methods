function values = pol_regress(x,y,degree,x_temp)
  
  n = length(x);
  m = length(y);
  
  n
  
  if n~=m
    error('x and y elements should be same');
  end
  
  arr = zeros(2*degree+1,1);
  sum = 0;
  for i=1:(2*degree)
    for j=1:n
      sum = sum + x(j)^i;
    end
    arr(i+1,1) = sum;
    sum = 0;
  end
  arr(1,1) = n;
  
  matrix = zeros(degree+1,degree+1);
  for k=1:degree+1
    index = k;
    for l=1:degree+1
      matrix(k,l) = arr(index,1);
      index = index + 1;
    end
  end
  
  col_matrix = zeros(degree+1,1 );
  mus = 0;
  for p=1:degree+1
    for q=1:n
      mus = mus + y(q)*(x(q)^(p-1));
    end
    col_matrix(p,1) = mus;
    mus = 0;
  end
  
  result = GaussPivot(matrix,col_matrix);
  result
  
  final = x(n);
  x_reg = 0:0.02:final;
  n_now = length(x_reg);
  y_reg = zeros(n_now);
  for r=1:n_now
    for s=1:degree+1
      y_reg(r) = y_reg(r) + result(s)*(x_reg(r)^(s-1));
    end
  end
  
  %plot(x,y,'');
  %hold on;
  plot(x_reg,y_reg,'k');
  hold on
  
  y_temp = 0;
  for u = 1:degree+1
    y_temp = y_temp + result(u)*(x_temp^(u-1));
  end
  scatter(x_temp,y_temp,'d');
  fprintf('value got from regression : %d\n',y_temp);
  hold on
  