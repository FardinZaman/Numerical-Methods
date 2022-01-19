a = csvread('train.csv');
b = csvread('test.csv');

miss = 0;
for missing = 2:801
  if a(missing,4) == 0
    miss = miss + 1;
  endif
endfor
    
miss    
avg = sum(a(:,4))/(800 - miss)
for missed = 1:801
  if a(missed,4) == 0
    a(missed,4) = avg;
  endif
endfor

%subplot(1,2,1)
figure;
for i = 2:801
  scatter(a(i,1),a(i,2),a(i,5)*.05,a(i,7),'filled')
  hold on
end
%colorbar = colorBar;
xlabel("longitude")
ylabel("lattitude")
colorBar = colorbar;
colormap = ("jet");


%subplot(1,2,2)
figure;
for p = 2:201
  scatter(b(p,1),b(p,2),.05*b(p,5),b(p,7),'filled')
  hold on
end
xlabel("longitude")
ylabel("lattitude")
colorBar = colorbar;
colormap = ("jet");


x = zeros(6,800);
for j = 1:6
  for k = 2:801
    x(j,k-1) = a(k,j);
  end
end

y = zeros(800,1);
for l = 2:801
  y(l-1,1) = a(l,7);
end

result = multi_lin_regress(x,y);
result

fprintf("y = %d ",result(1));
for m = 2:7
  fprintf("+ (%d)*x_%d ",result(m),m-1);
end
fprintf("\n");

y_b = zeros(200,1);
for q = 1:200
  y_b(q,1) = result(1);
  for r = 1:6
    y_b(q,1) = y_b(q,1) + result(r+1) * b(q+1,r);
  end
end
%y_b

y_a = zeros(800,1);
for u = 1:800
  y_a(u,1) = result(1);
  for v = 1:6
    y_a(u,1) = y_a(u,1) + result(v+1) * a(u+1,v);
  end
end


error_b = 0;
for s = 1:200
  error_b = error_b + (y_b(s,1) - b(s+1,7))^2;
  %error_b
end
error_b = sqrt(error_b/200);
error_b

error_a = 0;
for t = 1:800
  error_a = error_a + (y_a(t,1) - a(t+1,7))^2;
end
error_a = sqrt(error_a/800);
error_a
