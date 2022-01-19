now = 0:0.001:1;
now_x = now.*(180/pi);
plot(now,projectile(now_x));
grid;