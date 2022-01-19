function y = projectile (angle_in_degree)
  x = 90;
  v_not = 30;
  y_not = 1.8;
  
  angle_in_radian = angle_in_degree * pi/180;
  
  y = y_not + x*tan(angle_in_radian) - 4.9*(x.^2)./(v_not*v_not*(cos(angle_in_radian).^2));