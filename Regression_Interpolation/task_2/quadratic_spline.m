function decorated = quadratic_spline(x,y)

n = length(x);
var_no = (n-1)*3;
matrix = zeros(var_no,var_no);  

j = 1;  
for i = 1:n-1
  matrix(2*i-1,j) = x(i)*x(i);
  matrix(2*i,j) = x(i+1)*x(i+1);
  j = j+1;
  matrix(2*i-1,j) = x(i);
  matrix(2*i,j) = x(i+1);
  j = j+1;
  matrix(2*i-1,j) = 1;
  matrix(2*i,j) = 1;
  j = j+1;
end

l = 1; 
now = (n-1)*2 + 1;
for k = 2:n-1
  matrix(now,l) = x(k)*2;
  matrix(now,l+1) = 1;
  matrix(now,l+3) = 0 - x(k)*2;
  matrix(now,l+4) = -1;
  now = now + 1;
  l = l + 3;
end

matrix(var_no,1) = 1;

col_matrix = zeros(var_no,1);
for m = 2:n-1
  col_matrix(m*2 - 1,1) = y(m);
  col_matrix(m*2 - 2,1) = y(m);
end
col_matrix(1,1) = y(1);
col_matrix(n*2 - 2,1) = y(n);

qs = GaussPivot(matrix,col_matrix);

decorated = zeros(n-1,3);
v = 1;
for u = 1:n-1
  decorated(u,1) = qs(v);
  v = v+1;
  decorated(u,2) = qs(v);
  v = v+1;
  decorated(u,3) = qs(v);
  v = v+1;
end

 