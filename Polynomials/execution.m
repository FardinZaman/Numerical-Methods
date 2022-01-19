
x = [1 2 4 7 8];
y=[-9 -41 -189 9 523];
plot(x,y);
hold on

%x_set = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
x_set = 1:0.2:8;
n = length(x_set);
for g = 1:n
  y_set(g) = new_pol(x,y,x_set(g));
end
plot(x_set,y_set);

%x_set = 2.6;
%y_set = new_pol(x,y,x_set);
%scatter(x_set,y_set,'filled');