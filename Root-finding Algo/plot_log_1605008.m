function plot_log_1605008
  x = -0.9:0.1:1;
  log_1_plus_x = log(1+x);
  subplot(2,1,1)
  plot(x,log_1_plus_x);
  title('Built-in log');
  xlabel('values of x');
  ylabel('values of ln(1+x)');
  
  subplot(2,1,2)
  number_of_terms = [1,3,5,20];
  for i = 1:1:4
    now = valueOf_ln_1605008(x,number_of_terms(i));
    plot(x,now);
    hold on;
  end
  title('Compare different log');
  xlabel('values of x');
  ylabel('values of ln(1+x)');
  
  
  
  