%x = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];
%y = x.^2;
% I have done this for online
% the functions added are necessary
% black line is for regression
% blue line indicates interpolation
% diamond indicates y_value from regression
% filled circle is the y_value from interpolation

x = [0 1 2 3 4 5];
y = [2.1 7.7 13.6 27.2 40.9 61.1];

plot(x,y,'o');
hold on

pol_regress(x,y,2,4.5);

x_now = 0:.002:5;
n = length(x_now);
for i = 1:n
  y_now(i) = new_pol(x,y,x_now(i));
end
plot(x_now,y_now,'b');
hold on

x_arb = 4.5;
y_arb = new_pol(x,y,x_arb);
fprintf('value got from interpolation : %d\n',y_arb)
scatter(x_arb,y_arb,'filled');
hold on