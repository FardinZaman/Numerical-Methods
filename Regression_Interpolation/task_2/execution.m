%x = [0 10 15 20 22.5 30];
%y = [0 227.04 362.78 517.35 602.97 901.67];
a = csvread('shampoo.csv');
b = length(a);
v = 1;
w = 1;
for u = 2:b
  if a(u,2)~=0
    time(v) = a(u,1);
    shampoo(v) = a(u,2);
    v = v+1;
  endif
  if a(u,2)==0
    unknown(w) = a(u,1);
    w = w+1;
  endif
endfor
unknown;
uk = length(unknown);

x = time;
y = shampoo;

%subplot(2,3,1)
figure;
plot(x,y,'o');
hold on
xlabel("time")
ylabel("sales of shampoo")

n = length(x);
result = quadratic_spline(x,y);
%result
figure;
%subplot(2,3,2)
for i = 1:n-1
  x_temp = x(i):0.0001:x(i+1);
  y_temp = (x_temp.^2).*result(i,1) + x_temp.*result(i,2) + result(i,3);
  plot(x_temp,y_temp,'y')
  hold on
end
for r = 1:uk
  for o = 1:n-1
    if unknown(r)>x(o) && unknown(r)<x(o+1)
      y_quad(r) = result(o,1)*(unknown(r)^2) + result(o,2)*unknown(r) + result(o,3);
      scatter(unknown(r),y_quad(r),'r','filled')
      hold on
    endif
  endfor
endfor
xlabel("time")
ylabel("sales of shampoo")
y_quad
%plot(unknown,y_quad,'r','filled')
%then = result(28,1)*(33^2) + result(28,2)*33 + result(28,3)

%subplot(2,3,3)
figure;
for f = 1:n-1
  temp_x_3 = [x(f) x(f+1)];
  temp_y_3 = [y(f) y(f+1)];
  plot(temp_x_3,temp_y_3,'g')
  hold on
end
for w= 1:uk
  for e = 1:n-1
    if unknown(w)>x(e) && unknown(w)<x(e+1)
      x_side = (unknown(w) - x(e))/(x(e) - x(e+1));
      y_lin_spline(w) = y(e) + x_side*(y(e) - y(e+1));
      scatter(unknown(w),y_lin_spline(w),'r','filled')
      hold on
    endif
  endfor
endfor
xlabel("time")
ylabel("sales of shampoo")
y_lin_spline

%subplot(2,3,4)
figure;
x_temp_2 = 1:1:36;
z = length(x_temp_2);
y_temp_2 = zeros(z);
for h = 1:z-1
   x_temp_21 = x_temp_2(h):0.01:x_temp_2(h+1);
   the_size = length(x_temp_21);
   for h_1 = 1:the_size
     y_temp_21(h_1) = new_pol(x,y,x_temp_21(h_1));
   end
   plot(x_temp_21,y_temp_21,'y')
   hold on
end
%y_temp_2(20)
%lag_pol(x,y,20)
%plot(x_temp_2,y_temp_2,'y')
%hold on
for s = 1:uk
  y_new_pol(s) = new_pol(x,y,unknown(s));
  scatter(unknown(s),y_new_pol(s),'r','filled');
  hold on
end
xlabel("time")
ylabel("sales of shampoo")
y_new_pol
%then = new_pol(x,y,20);
%scatter(20,then,20,'r','filled');

%subplot(2,3,5)
figure;
x_temp_4 = 1:1:36;
z_1 = length(x_temp_4);
y_temp_4 = zeros(z_1);
for g = 1:z_1-1
  x_temp_41 = x_temp_4(g):0.01:x_temp_4(g+1);
  the_siz = length(x_temp_41);
  for g_1 = 1:the_siz
    y_temp_41(g_1) = lag_pol(x,y,x_temp_41(g_1));
  end
  plot(x_temp_41,y_temp_41,'g')
  hold on
end
%plot(x_temp_4,y_temp_4,'g')
%hold on
for t = 1:uk
  y_lag_pol(t) = lag_pol(x,y,unknown(t));
  scatter(unknown(t),y_lag_pol(t),'r','filled');
  hold on
end
xlabel("time")
ylabel("sales of shampoo")
y_lag_pol
  